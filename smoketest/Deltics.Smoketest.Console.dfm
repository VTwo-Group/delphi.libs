object SmokeTestConsole: TSmokeTestConsole
  Left = 290
  Top = 205
  Caption = 'Smoketest'
  ClientHeight = 446
  ClientWidth = 930
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 585
    Top = 31
    Width = 7
    Height = 396
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 427
    Width = 930
    Height = 19
    Panels = <
      item
        Text = 'Ready'
        Width = 100
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object lvHierarchy: TListView
    Left = 0
    Top = 31
    Width = 585
    Height = 396
    Align = alLeft
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Checkboxes = True
    Color = clWhite
    Columns = <
      item
        Caption = 'Test'
        Width = 400
      end
      item
        Alignment = taRightJustify
        Caption = '# / sec'
        Width = 80
      end
      item
        Alignment = taRightJustify
        Caption = 'Avg (ms)'
        Width = 80
      end>
    FlatScrollBars = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu
    TabOrder = 1
    ViewStyle = vsReport
    OnClick = lvHierarchyClick
    OnCustomDrawItem = lvHierarchyCustomDrawItem
    OnDblClick = lvHierarchyDblClick
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 930
    Height = 31
    AutoSize = True
    ButtonHeight = 27
    ButtonWidth = 27
    Caption = 'ToolBar'
    Color = clBtnFace
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Transparent = False
    object tbStart: TToolButton
      Left = 0
      Top = 2
      Action = actRunSelected
    end
    object tbStop: TToolButton
      Left = 27
      Top = 2
      Action = actAbortRun
    end
  end
  object ProgressBar: TProgressBar
    Left = 408
    Top = 405
    Width = 150
    Height = 16
    TabOrder = 3
  end
  object Actions: TActionList
    Left = 16
    Top = 56
    object actEditParameters: TAction
      Caption = 'Edit Suite Parameters...'
      Enabled = False
      ImageIndex = 0
    end
    object actRunSelected: TAction
      Caption = 'Run...'
      Hint = 'Runs the selected test object'
      ImageIndex = 5
      OnExecute = actRunSelectedExecute
      OnUpdate = actRunSelectedUpdate
    end
    object actAbortRun: TAction
      Caption = 'Abort'
      Enabled = False
      ImageIndex = 8
      OnExecute = actAbortRunExecute
      OnUpdate = actAbortRunUpdate
    end
  end
  object ResultImages: TImageList
    Height = 20
    Width = 20
    Left = 80
    Top = 56
    Bitmap = {
      494C010105000900740014001400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000500000002800000001002000000000000032
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080C0E000004080000040
      8000004080000040800000408000004080000040800000408000004080000040
      800000408000004080000040800000408000004080000040800080C0E0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004080000060E0000080
      E0000080E00000A0E00000A0E00040C0E00040C0E00080C0E00080E0E00040C0
      E00040C0E00040A0E00000A0E0000080E0000080E0000080E000004080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000004080000060E0000060
      E0000060E0000080E00000A0E00000A0E00040A0E000000000000000000040A0
      E00040A0E00000A0E0000080E0000080E0000080E0000080E000004080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080C0E000004080000060
      E0000060E0000080E0000080E0000080E00000A0E000000000000000000000A0
      E00000A0E0000080E0000080E0000080E0000080E0000040800080C0E0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000040800040A0
      E0000080E0000060E0000080E0000080E0000080E0000080E0000080E0000080
      E0000080E0000080E0000080E0000080E0000080E00000408000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080C0E0000040
      800000A0E0000080E0000060E0000060E0000060E0000060E0000060E0000060
      E0000060E0000060E0000080E0000080E0000040800080C0E000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000040
      800040A0E00000A0E0000080E0000080E0000060E00000000000000000000060
      E0000060E0000060E0000080E00000A0E0000040800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000080C0
      E000004080000080E0000080E0000080E0000080E00000000000000000000040
      E0000060E0000060E0000080E0000040800080C0E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000040800080E0E0004080E0000080E0000060E00000000000000000000040
      C0000060E0000060E00040C0E000004080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080C0E000004080000080E0000080E0000060E00000000000000000000080
      E0000080E0000080E0000040800080C0E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000040800080E0E0004080E0000080E00000000000000000000080
      E00000A0E00040C0E00000408000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080C0E0000040800040A0E0000080E000000000000000000000A0
      E00000A0E0004040800080C0E000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000004080004080C00040A0E0000080E0000080E00000A0
      E00080E0E0000040800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080C0E0000040800040A0E00040A0E00040A0E00040A0
      E0000040800080C0E00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000040800040A0E00040A0E00040C0E00080E0
      E000004080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080C0E0000040800040C0E00040C0E0000040
      800080C0E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080C0E000004080000040800080C0
      E000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008080C0004020C0004020C0004020C0004020
      C0008080C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C060
      0000C0600000C0600000C0600000C0600000C0600000C0600000C0600000C060
      0000C0600000C0600000C0600000C0600000C060000000000000000000000000
      0000000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000000000800000208000000080000000800000008000000080000000
      80004020C0004020C0004020C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0600000C060
      0000C0600000C0600000C0600000C0600000C0600000C0600000C0600000C060
      0000C0600000C0600000C0600000C0600000C0600000C0602000000000000000
      000000000000000000000080000000C0200000C0200000C0200000C0200000C0
      200000C0200000C0200000C0200000C0200000C0200000C0200000C0200000C0
      200000C020000080000000000000000000000000000000000000000000000000
      0000000080000000800000208000002080000020800000208000002080000020
      80000020800000208000000080004020C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80000000000000000000000000000000000000000000C0602000C0600000C060
      0000C0600000C0600000C0600000C0600000C0804000F0CAA600F0CAA600C080
      4000C0600000C0600000C0600000C0600000C0600000C0600000C06000000000
      0000000000000080000000A0200000A0200000A0200000A0200000A0200040A0
      4000C0DCC00040A0600000A0200000A0200000A0200000A0200000A0200000A0
      200000A0200000A0200000800000000000000000000000000000000000000000
      80000020A0004020A000002080000020A0000020800000208000002080000020
      8000002080000020800000208000002080004020C00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      00000000000000000000000000000000000000000000C0602000C0600000C060
      0000C0600000C0600000C0600000C0600000F0CAA600FFFFFF00FFFFFF00F0CA
      A600C0600000C0600000C0600000C0600000C0600000C0600000C06020000000
      0000000000000080000000A0200000A0200000A0200000A0200000800000F0FB
      FF00FFFFFF00FFFFFF000060000000A0200000A0200000A0200000A0200000A0
      200000A0200000A0200000800000000000000000000000000000000080004020
      A0004020A0004020A0004020A0004020A0004020A0000020A0000020A0000020
      800000208000002080000020800000208000002080004020C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      00000000000080808000000000000000000000000000C0602000C0400000C040
      0000C0400000C0400000C0400000C0400000F0CAA600FFFFFF00FFFFFF00F0CA
      A600C0400000C0400000C0400000C0400000C0400000C0400000C06020000000
      0000000000000080000000A0000000A0000000A0000000800000F0FBFF00F0FB
      FF00F0FBFF00F0FBFF00F0FBFF000060000000A0000000A0000000A0000000A0
      000000A0000000A000000080000000000000000000004020C0004040A0004040
      A0004040A0004040A0004020A0004060A0004020A0004020A0004020A0004020
      A0000020600000208000002080000020800000208000002080004020C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00000000000000000000000
      00008080800000000000000000000000000000000000C0602000C0400000C040
      0000C0400000C0400000C0400000C0400000F0CAA600FFFFFF00FFFFFF00F0CA
      A600C0400000C0400000C0400000C0400000C0400000C0400000C06020000000
      00000000000000800000008000000080000000800000F0FBFF00F0FBFF00F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00408040000080000000800000008000000080
      000000800000008000000080000000000000000000004020C0004040C0004040
      A0004040A0004020A000FFFFFF00FFFFFF008060A0004040A0004040A0004040
      8000FFFFFF00FFFFFF00002080000020800000208000002080004020C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80000000000000000000000000000000000000000000C0602000C0400000C040
      0000C0400000C0400000C0400000C0400000F0CAA600FFFFFF00FFFFFF00F0CA
      A600C0400000C0400000C0400000C0400000C0400000C0400000C06020000000
      000000000000008000000080000000800000C0C0C000F0FBFF00F0FBFF00F0FB
      FF00C0DCC000F0FBFF00F0FBFF00C0DCC0000060000000800000008000000080
      0000008000000080000000800000000000008080C0004020C0004040C0004040
      C0004040C0004040A000F0FBFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000FFFF
      FF00FFFFFF00FFFFFF00402080004040A00000208000002080004020C0008080
      C000000000000000000000000000000000000000000080808000000000008080
      8000808080008080800080808000000000000000000000000000C0C0C0000000
      00000000000000000000000000000000000000000000C0400000C0400000C040
      0000C0400000C0400000C0400000C0400000F0CAA600FFFFFF00FFFFFF00F0CA
      A600C0400000C0400000C0400000C0400000C0400000C0400000C04000000000
      0000000000000060000000800000C0C0C000C0DCC000C0DCC000F0FBFF00C0DC
      C00040A06000C0DCC000F0FBFF00F0FBFF00C0DCC00000600000008000000080
      0000008000000080000000600000000000004020C0004060C0004060C0004040
      C0004040C0004040C0004040A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00402080004040A0004040A0004040A00000208000002080004020
      C0000000000000000000000000008080800000000000C0C0C000F0CAA600F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0400000C0400000C040
      0000C0400000C0400000C0400000C0200000F0CAA600FFFFFF00FFFFFF00F0CA
      A600C0400000C0400000C0400000C0400000C0400000C0400000C04000000000
      0000000000000060000000800000C0DCC000C0DCC000C0DCC000C0DCC0004080
      400000802000C0DCC000C0DCC000C0DCC000C0DCC00000602000008000000080
      0000008000000080000000600000000000004020C0004060C0004060C0004060
      C0004040C0004040C0004040C0008080C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C0A0C0004040A0004040A0004040A0004040A0004040A0004040A0004020
      C000000000000000000080808000C0C0C000F0CAA600F0CAA600F0CAA600F0CA
      A600C0C0C0008080800000000000000000008080800000000000000000000000
      00000000000000000000000000000000000000000000C0400000802000008020
      000080200000802000008020000080200000F0CAA600FFFFFF00FFFFFF00F0CA
      A600802000008020000080200000802000008020000080200000C04000000000
      000000000000006000000080000080A06000C0DCC000C0C0C00080A080000060
      00000060000000802000C0DCC000C0DCC000C0DCC000C0DCC000006000000080
      0000008000000080000000600000000000004020C0004060C0004060C0004060
      C0004060C0004040C0004040C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0FBFF004040C0004040A0004040A0004040A0004040A0004040A0004020
      C000000000000000000000000000F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600C0C0C00080808000000000008080800000000000000000000000
      00000000000000000000000000000000000000000000C0400000802000008020
      000080200000802000008020000080200000C0804000FFFFFF00FFFFFF00C080
      4000802000008020000080200000802000008020000080200000C04000000000
      0000000000000060000000600000006000004080400040804000006000000060
      00000060000000600000C0DCC000C0DCC000C0DCC000C0DCC00080A080000060
      0000006000000060000000600000000000004020C0004060E0004060C0004060
      C0004060C0004040C0004040C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF004060A0004040A0004040A0004040A0004040A0004040A0004020
      C0000000000080808000C0C0C000F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600C0C0C000000000008080800000000000000000000000
      00000000000000000000000000000000000000000000C0400000802000008020
      00008020000080200000802000008020000080200000C0804000C08040008020
      0000802000008020000080200000802000008020000080200000C04000000000
      0000000000000060000000600000006000000060000000600000006000000060
      0000006000000060000000600000C0DCC000C0DCC000C0DCC000C0DCC0004080
      4000006000000060000000600000000000008080C0004020C0004060E0004060
      C0004060C0004040C000FFFFFF00FFFFFF00FFFFFF00C0A0C0008080A000FFFF
      FF00FFFFFF00FFFFFF004060A0004040A0004040A0004040A000000080008080
      C0000000000000000000F0CAA600F0CAA600F0CAA600FFFFFF00F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA6008080800000000000000000000000
      00000000000000000000000000000000000000000000C0400000802000008020
      000080200000802000008020000080200000F0CAA600FFFFFF00FFFFFF00F0CA
      A600802000008020000080200000802000008020000080200000C04000000000
      0000000000000060000000600000006000000060000000600000006000000060
      000000600000006000000060000000600000C0C0C000C0DCC000C0DCC000C0DC
      C00040806000006000000060000000000000000000004020C0004060E0004060
      E0004060C0004060C000C0C0C000FFFFFF004040A0004040C0004040C0004020
      A000F0FBFF00FFFFFF004040C0004040C0004040A0004040C000000080000000
      00000000000000000000F0CAA600F0CAA600F0CAA600F0CAA600FFFFFF00F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA6000000000000000000000000000000
      00000000000000000000000000000000000000000000C0602000C0402000C020
      0000C0200000C0200000C0200000C0200000F0CAA600FFFFFF00FFFFFF00F0CA
      A600C0200000C0200000C0200000C0200000C0200000C0200000C06020000000
      0000000000000080000000800000008020000080200000802000008020000080
      20000080200000802000008020000080200080A06000F0FBFF00F0FBFF00F0FB
      FF00F0FBFF00006020000080000000000000000000004020C0004060E0004060
      E0004060E0004060C0004060C0004040C0004060C0004040C0004040C0004040
      C0004020A0004040C0004040C0004040C0004040C0004040C000000080000000
      00000000000080808000C0C0C000F0CAA600F0CAA600F0CAA600F0CAA600FFFF
      FF00F0CAA600F0CAA600F0CAA600C0C0C0008080800000000000000000000000
      00000000000000000000000000000000000000000000C0602000C0404000C040
      4000C0404000C0404000C0404000C0404000C0804000F0CAA600F0CAA600C080
      4000C0404000C0404000C0404000C0404000C0404000C0404000C06020000000
      0000000000000080000080C0600080C0600080C0600080C0600080C0600080C0
      600080C0600080C0600080C0600080C0600080C06000C0DCC000F0FBFF00F0FB
      FF00F0FBFF0080A06000008000000000000000000000000000004020C0004060
      E0004060E0004060E0004060E0004060C0004060C0004060C0004060C0004040
      C0004040C0004040C0004040C0004040C0004040C00000008000000000000000
      0000000000000000000000000000F0CAA600F0CAA600F0CAA600FFFFFF00F0CA
      A600FFFFFF00F0CAA600F0CAA600000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0602000C0404000C040
      4000C0404000C0404000C0404000C0404000C0404000C0404000C0404000C040
      4000C0404000C0404000C0404000C0404000C0404000C0404000C06020000000
      0000000000000080000080C0600080C0600080C0600080C0600080C0600080C0
      600080C0600080C0600080C0600080C0600080C0600080C06000C0DCC000FFFF
      FF00F0FBFF0080C0800000800000000000000000000000000000000000004020
      C0004060E0004060E0004060E0004060E0004060E0004060E0004060C0004060
      C0004060C0004060C0004040C0004040C0000000800000000000000000000000
      0000000000000000000080808000C0C0C000F0CAA600F0CAA600F0CAA600FFFF
      FF00F0CAA600F0CAA600C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0602000C060
      6000C0606000C0606000C0606000C0606000C0606000C0606000C0606000C060
      6000C0606000C0606000C0606000C0606000C0606000C0602000000000000000
      000000000000000000000080000080C0600080C0600080C0600080C0600080C0
      600080C0600080C0600080C0600080C0600080C0600080C0600080C0600080C0
      600080C060000080000000000000000000000000000000000000000000000000
      00004020C0004060E0004060E0004060E0004060E0004060E0004060E0004060
      C0004060C0004060C0004060C000000080000000000000000000000000000000
      00000000000000000000000000008080800000000000C0C0C000F0CAA600F0CA
      A600C0C0C0000000000080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C060
      2000C0602000C0602000C0602000C0602000C0602000C0602000C0602000C060
      2000C0602000C0602000C0602000C0602000C060200000000000000000000000
      0000000000000000000000000000008000000080000000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      0000008000000000000000000000000000000000000000000000000000000000
      0000000000004020C0004020C0004020C0004060E0004060E0004060E0004060
      E0004020C0004020C0004020C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008080C0004020C0004020C0004020C0004020
      C0008080C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000050000000280000000100010000000000E00100000000000000000000
      000000000000000000000000FFFFFF00FFFFF0000000000000000000FFFFF000
      0000000000000000800010000000000000000000800010000000000000000000
      800010000000000000000000800010000000000000000000C000300000000000
      00000000C00030000000000000000000E00070000000000000000000E0007000
      0000000000000000F000F0000000000000000000F000F0000000000000000000
      F801F0000000000000000000F801F0000000000000000000FC03F00000000000
      00000000FC03F0000000000000000000FE07F0000000000000000000FE07F000
      0000000000000000FF0FF0000000000000000000FFFFF0000000000000000000
      FFFFFFFFFFFE07FFFFFF0000E0007E0007F801FFFFFF0000C0003C0003F000FF
      FFE700008000180001E0007FFFC300008000180001C0003FFF83000080001800
      0180001FFF070000800018000180001FFF0F0000800018000100000F801F0000
      800018000100000E007F0000800018000100000C007F0000800018000100000C
      007F00008000180001000008007F00008000180001000008007F000080001800
      01800018007F00008000180001800018007F00008000180001C0003C00FF0000
      8000180001E0007C00FF0000C0003C0003F000FE01FF0000E0007E0007F801FF
      87FF0000FFFFFFFFFFFE07FFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object ResultsPopup: TPopupMenu
    Left = 40
    Top = 132
    object miRenameRun: TMenuItem
      Caption = 'Label/Rename'
      ShortCut = 113
    end
    object miDeleteRun: TMenuItem
      Caption = '&Delete'
      ShortCut = 8238
    end
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 160
    Top = 56
    object miEnabled: TMenuItem
      Caption = 'Enabled'
      OnClick = miEnabledClick
    end
    object miRunTest: TMenuItem
      Caption = 'Run this test'
    end
    object miSeparator: TMenuItem
      Caption = '-'
    end
    object miExpandArticle: TMenuItem
      Caption = 'Expand'
      OnClick = miExpandArticleClick
    end
    object miExpandAll: TMenuItem
      Caption = 'Expand all'
      OnClick = miExpandAllClick
    end
    object miExpandSiblings: TMenuItem
      Caption = 'Expand all at this level'
      OnClick = miExpandSiblingsClick
    end
    object miCollapseArticle: TMenuItem
      Caption = 'Collapse'
      OnClick = miCollapseArticleClick
    end
    object miCollapseAll: TMenuItem
      Caption = 'Collapse all'
      OnClick = miCollapseAllClick
    end
    object miCollapseSiblings: TMenuItem
      Caption = 'Collapse all at this level'
      OnClick = miCollapseSiblingsClick
    end
  end
end
