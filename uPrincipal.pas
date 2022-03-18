unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uController, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  RzButton, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, uFilters;

type
  TfMasterDetail = class(TForm)
    bRun: TRzBitBtn;
    DBNavigator1: TDBNavigator;
    dsVenda: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    gridItmDBTableView1: TcxGridDBTableView;
    gridItmLevel1: TcxGridLevel;
    gridItm: TcxGrid;
    gridUniDBTableView1: TcxGridDBTableView;
    gridUniLevel1: TcxGridLevel;
    gridUni: TcxGrid;
    dsVendaItem: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator2: TDBNavigator;
    gridUniDBTableView1Column1: TcxGridDBColumn;
    gridUniDBTableView1Column2: TcxGridDBColumn;
    gridItmDBTableView1Column1: TcxGridDBColumn;
    gridItmDBTableView1Column2: TcxGridDBColumn;
    gridItmDBTableView1Column3: TcxGridDBColumn;
    gridItmDBTableView1Column4: TcxGridDBColumn;
    procedure bRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridUniDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    FControllerVenda: IController;
    FControllerItemVenda: IController;
    function GetVendaItemFilters: IDatasetFilter;
  public

  end;

var
  fMasterDetail: TfMasterDetail;

implementation

{$R *.dfm}

procedure TfMasterDetail.gridUniDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if Assigned(dsVenda.DataSet) then
  begin
    FControllerItemVenda
      .Entidades
        .VendaItem
        .DataSet(dsVendaItem)
        .Filter(GetVendaItemFilters)
        .Select(['*'])
      .Open;
  end;
end;

procedure TfMasterDetail.FormCreate(Sender: TObject);
begin
  FControllerVenda := TController.New;
  FControllerItemVenda := TController.New;
end;

function TfMasterDetail.GetVendaItemFilters: IDatasetFilter;
var
  DsFilter: IDatasetFilter;
begin
  DsFilter := TDatasetFilter.Create;
  DsFilter.Add('VENDA_ID', dfEqual, dsVenda.DataSet.FieldByName('ID').Value);
  Result := DsFilter;
end;

procedure TfMasterDetail.bRunClick(Sender: TObject);
begin
  FControllerVenda
    .Entidades
      .Venda
      .DataSet(dsVenda)
      .Select(['Id', 'Pedido'])
    .Open;
end;

end.
