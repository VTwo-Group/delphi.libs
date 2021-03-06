{
  * X11 (MIT) LICENSE *

  Copyright � 2008 Jolyon Smith

  Permission is hereby granted, free of charge, to any person obtaining a copy of
   this software and associated documentation files (the "Software"), to deal in
   the Software without restriction, including without limitation the rights to
   use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
   of the Software, and to permit persons to whom the Software is furnished to do
   so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
   copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.


  * GPL and Other Licenses *

  The FSF deem this license to be compatible with version 3 of the GPL.
   Compatability with other licenses should be verified by reference to those
   other license terms.


  * Contact Details *

  Original author : Jolyon Smith
  skype           : deltics
  e-mail          : <EXTLINK mailto: jsmith@deltics.co.nz>jsmith@deltics.co.nz</EXTLINK>
  website         : <EXTLINK http://www.deltics.co.nz>www.deltics.co.nz</EXTLINK>
}

{$i deltics.bonjour.inc}

{.$ifdef deltics_bonjour_domains}
  {$debuginfo ON}
{.$else}
  {.$debuginfo OFF}
{.$endif}

  unit Deltics.Bonjour.Domains;


interface

  uses
  { vcl: }
    Contnrs,
    SyncObjs,
    Windows,
  { deltics: }
    Deltics.Strings,
  { bonjour: }
    Deltics.Bonjour,
    Deltics.Bonjour.API,
    Deltics.Bonjour.Thread;

  type
    TDomainBrowser = class;
    TDomain = class;

    TDomainBrowserEvent = procedure(aSender: TDomainBrowser; aDomain: TDomain) of object;
    TDomainBrowserFinishedEvent = procedure(aSender: TDomainBrowser) of object;


    TDomainBrowser = class
    private
      fDomains: TObjectList;
      fDomainType: TDomainType;
      fRefreshed: TEvent;
      fIsDestroying: Boolean;
      fIsRefreshing: Boolean;
      fIsRefreshingLock: TCriticalSection;
      fOnDomainAdded: TDomainBrowserEvent;
      fOnDomainRemoved: TDomainBrowserEvent;
      fOnEnumFinished: TDomainBrowserFinishedEvent;
      function get_Count: Integer;
      function get_Items(const aIndex: Integer): TDomain;
      function get_IsRefreshing: Boolean;
      property Refreshed: TEvent read fRefreshed;
      property IsDestroying: Boolean read fIsDestroying;
      property IsRefreshingLock: TCriticalSection read fIsRefreshingLock;
    protected
      procedure DoOnDomainAdded(const aDomain: TDomain);
      procedure DoOnDomainRemoved(const aDomain: TDomain);
      procedure DoOnEnumFinished;
      function GetDomain(const aName: UnicodeString;
                         const aInterfaceID: Integer): TDomain;
    public
      constructor Create(const aDomainType: TDomainType);
      destructor Destroy; override;
      procedure Refresh; overload;
      procedure Refresh(const aTimeOut: Cardinal); overload;
      property Count: Integer read get_Count;
      property DomainType: TDomainType read fDomainType;
      property Items[const aIndex: Integer]: TDomain read get_Items; default;
      property IsRefreshing: Boolean read get_IsRefreshing;
      property OnDomainAdded: TDomainBrowserEvent read fOnDomainAdded write fOnDomainAdded;
      property OnDomainRemoved: TDomainBrowserEvent read fOnDomainRemoved write fOnDomainRemoved;
      property OnEnumFinished: TDomainBrowserFinishedEvent read fOnEnumFinished write fOnEnumFinished;
    end;


    TDomain = class
    private
      fInterfaceID: Integer;
      fIsDefault: Boolean;
      fName: UnicodeString;
    public
      constructor Create(const aName: UnicodeString;
                         const aInterfaceID: Integer;
                         const aIsDefault: Boolean);
      property IsDefault: Boolean read fIsDefault;
      property InterfaceID: Integer read fInterfaceID;
      property Name: UnicodeString read fName;
    end;


    TDomainBrowserMessage = record
      MessageID: Cardinal;
      Browser: TDomainBrowser;
      Domain: TDomain;
      Result: LongInt;
    end;




implementation

  uses
  { vcl: }
    Classes,
    SysUtils,
    Types,
    Deltics.Threads;



  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Domain_Found(const aBrowser: TDomainBrowser;
                         const aName: UnicodeString;
                         const aInterfaceID: Integer;
                         const aIsDefault: Boolean);
  var
    msg: TDomainBrowserMessage;
    domain: TDomain;
  begin
    domain := TDomain.Create(aName, aInterfaceID, aIsDefault);

    msg.MessageID := BJM_DomainFound;
    msg.Browser   := aBrowser;
    msg.Domain    := domain;

    TBonjourThread.NotifyVCL(msg);
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Domain_Lost(const aBrowser: TDomainBrowser;
                        const aName: UnicodeString;
                        const aInterfaceID: Integer);
  var
    msg: TDomainBrowserMessage;
  begin
    msg.MessageID := BJM_DomainLost;
    msg.Browser   := aBrowser;
    msg.Domain    := aBrowser.GetDomain(aName, aInterfaceID);

    if Assigned(msg.Domain) then
      TBonjourThread.NotifyVCL(msg);
  end;



  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure Domain_EnumFinished(const aBrowser: TDomainBrowser);
  var
    msg: TDomainBrowserMessage;
  begin
    msg.MessageID := BJM_DomainEnumFinished;
    msg.Browser   := aBrowser;
    msg.Domain    := NIL;

    TBonjourThread.NotifyVCL(msg);
  end;



  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure DNSServiceDomainEnumReply(const aHandle: TDNSServiceRef;
                                      const aFlags: TDNSServiceFlags;
                                      const aInterfaceIndex: uint32_t;
                                      const aErrorCode: TDNSServiceErrorType;
                                      const aDomain: PUTF8Char;
                                      const aContext: Pointer); stdcall;
  var
    browser: TDomainBrowser absolute aContext;
    sDomain: UnicodeString;
  begin
    if browser.IsDestroying then
    begin
      TBonjourThread.RemoveService(aHandle);
      EXIT;
    end;

    Deltics.Bonjour.CheckResult(aErrorCode);

    sDomain := WIDE.FromUTF8(aDomain);

    if (kDNSServiceFlagsAdd and aFlags) <> 0 then
      Domain_Found(browser, sDomain, aInterfaceIndex, (kDNSServiceFlagsDefault and aFlags) <> 0)
    else
      Domain_Lost(browser, sDomain, aInterfaceIndex);

    // If the MoreComing flag is not present then we are done...

    if ((kDNSServiceFlagsMoreComing and aFlags) = 0) then
    begin
      TBonjourThread.RemoveService(aHandle);
      browser.DoOnEnumFinished;
    end;
  end;






{ TDomains --------------------------------------------------------------------------------------- }

  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  constructor TDomainBrowser.Create(const aDomainType: TDomainType);
  begin
    inherited Create;

    fDomains    := TObjectList.Create(TRUE);
    fDomainType := aDomainType;

    fRefreshed := TEvent.Create(NIL, TRUE, FALSE, 'domains.refreshed');
    fIsRefreshingLock := TCriticalSection.Create;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  destructor TDomainBrowser.Destroy;
  begin
    fIsDestroying := TRUE;

    TBonjourThread.ProcessVCLMessages;

    FreeAndNIL(fDomains);
    FreeAndNIL(fRefreshed);
    FreeAndNIL(fIsRefreshingLock);

    inherited;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function TDomainBrowser.get_Count: Integer;
  begin
    if NOT IsRefreshing then
      result := fDomains.Count
    else
      result := 0;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function TDomainBrowser.get_IsRefreshing: Boolean;
  begin
    fIsRefreshingLock.Enter;
    try
      result := fIsRefreshing;

    finally
      fIsRefreshingLock.Leave;
    end;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function TDomainBrowser.get_Items(const aIndex: Integer): TDomain;
  begin
    if NOT IsRefreshing then
      result := TDomain(fDomains[aIndex])
    else
      result := NIL;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure TDomainBrowser.Refresh;
  const
    FLAG : array[dtBrowsing..dtRegistration] of TDNSServiceFlags =
               (
                kDNSServiceFlagsBrowseDomains,
                kDNSServiceFlagsRegistrationDomains
               );
  var
    handle: TDNSServiceRef;
  begin
    fIsRefreshingLock.Enter;
    try
      if IsRefreshing then
        EXIT;

      fIsRefreshing := TRUE;
      fRefreshed.ResetEvent;

    finally
      fIsRefreshingLock.Leave;
    end;

    fDomains.Clear;

    CheckResult(DNSServiceEnumerateDomains(handle,
                                           FLAG[DomainType],
                                           0, // All domains
                                           DNSServiceDomainEnumReply,
                                           self) );

    TBonjourThread.AddService(handle);
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure TDomainBrowser.Refresh(const aTimeOut: Cardinal);
  begin
    TBonjourThread.WaitFor(Refresh, 'domains.refreshed', aTimeOut);
    TBonjourThread.ProcessVCLMessages;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure TDomainBrowser.DoOnDomainAdded(const aDomain: TDomain);
  begin
    fDomains.Add(aDomain);

    if Assigned(OnDomainAdded) then
      OnDomainAdded(self, aDomain);
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure TDomainBrowser.DoOnDomainRemoved(const aDomain: TDomain);
  begin
    // Extract the domain from the fDomains list (which removes it
    //  but does NOT Free it)

    fDomains.Extract(aDomain);
    try
      if Assigned(OnDomainRemoved) then
        OnDomainRemoved(self, aDomain);

    finally
      // Now we can take care of free�ng the domain object

      aDomain.Free;
    end;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure TDomainBrowser.DoOnEnumFinished;
  begin
    fIsRefreshingLock.Enter;
    try
      fIsRefreshing := FALSE;
      fRefreshed.SetEvent;

    finally
      fIsRefreshingLock.Leave;
    end;

    if Assigned(OnEnumFinished) then
      OnEnumFinished(self);
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function TDomainBrowser.GetDomain(const aName: UnicodeString;
                                    const aInterfaceID: Integer): TDomain;
  var
    i: Integer;
  begin
    for i := 0 to Pred(Count) do
    begin
      result := items[i];
      if SameText(result.Name, aName)
       and (result.InterfaceID = aInterfaceID) then
        EXIT;
    end;

    result := NIL;
  end;






{ TDomain ---------------------------------------------------------------------------------------- }

  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  constructor TDomain.Create(const aName: UnicodeString;
                             const aInterfaceID: Integer;
                             const aIsDefault: Boolean);
  begin
    inherited Create;

    fInterfaceID := aInterfaceID;
    fIsDefault   := aIsDefault;
    fName        := aName;
  end;




end.


