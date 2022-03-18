object fMasterDetail: TfMasterDetail
  Left = 0
  Top = 0
  Caption = 'Master-Detail'
  ClientHeight = 614
  ClientWidth = 988
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 388
    Top = 41
    Width = 13
    Height = 573
    ExplicitLeft = 197
    ExplicitTop = 33
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 988
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object RzBitBtn1: TRzBitBtn
      Left = 3
      Top = 3
      Width = 78
      Height = 35
      Caption = 'Run'
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 382
    Height = 567
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object gridUni: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 31
      Width = 376
      Height = 533
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 312
      object gridUniDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnFocusedRecordChanged = gridUniDBTableView1FocusedRecordChanged
        DataController.DataSource = dsVenda
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        object gridUniDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object gridUniDBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'PEDIDO'
        end
      end
      object gridUniLevel1: TcxGridLevel
        GridView = gridUniDBTableView1
      end
    end
    object DBNavigator1: TDBNavigator
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 376
      Height = 22
      DataSource = dsVenda
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 312
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 404
    Top = 44
    Width = 581
    Height = 567
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 2
    ExplicitLeft = 340
    ExplicitWidth = 185
    object gridItm: TcxGrid
      AlignWithMargins = True
      Left = 3
      Top = 31
      Width = 575
      Height = 533
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 179
      object gridItmDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsVendaItem
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        object gridItmDBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'VENDA_ID'
        end
        object gridItmDBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'ITEM_ID'
        end
        object gridItmDBTableView1Column3: TcxGridDBColumn
          DataBinding.FieldName = 'QUANTIDADE'
          Width = 131
        end
        object gridItmDBTableView1Column4: TcxGridDBColumn
          DataBinding.FieldName = 'PRECO'
          Width = 130
        end
      end
      object gridItmLevel1: TcxGridLevel
        GridView = gridItmDBTableView1
      end
    end
    object DBNavigator2: TDBNavigator
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 575
      Height = 22
      DataSource = dsVendaItem
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 200
    end
  end
  object dsVenda: TDataSource
    Left = 144
    Top = 184
  end
  object dsVendaItem: TDataSource
    Left = 912
    Top = 96
  end
end
