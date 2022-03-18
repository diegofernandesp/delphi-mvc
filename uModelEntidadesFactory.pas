unit uModelEntidadesFactory;

interface

uses
  uInterface;

type
  TModelEntidadesFactory = class(TInterfacedObject, iModelEntidadeFactory)
  private
    FItem: IModelEntidade;
    FVenda: IModelEntidade;
    FVendaItem: IModelEntidade;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iModelEntidadeFactory;
    function Item: IModelEntidade;
    function Venda: IModelEntidade;
    function VendaItem: IModelEntidade;
  end;

implementation

uses
  uModelEntidadeItem, uModelEntidadeVenda, uModelEntidadeVendaItem;

{ TModelEntidadesFactory }

constructor TModelEntidadesFactory.Create;
begin

end;

destructor TModelEntidadesFactory.Destroy;
begin
  inherited;
end;

class function TModelEntidadesFactory.New: iModelEntidadeFactory;
begin
  Result := Self.Create;
end;

function TModelEntidadesFactory.Venda: IModelEntidade;
begin
  if not Assigned(FVenda) then
    FVenda := TModelEntidadeVenda.New;
  Result := FVenda;
end;

function TModelEntidadesFactory.VendaItem: IModelEntidade;
begin
  if not Assigned(FVendaItem) then
    FVenda := TModelEntidadeVendaItem.New;
  Result := FVenda;
end;

function TModelEntidadesFactory.Item: IModelEntidade;
begin
  if not Assigned(FItem) then
    FItem := TModelEntidadeItem.New;
  Result := FItem;
end;

end.
