unit uModelEntidadeItem;

interface

uses
  uInterface, Data.DB, uModelEntidadeTabela;

Type
  TModelEntidadeItem = class(TModelEntidadeTabela)
  public
    constructor Create; override;
    destructor Destroy; override;
    class function New : IModelEntidade;
  end;

implementation

uses
  uModelConexaoFactory, System.Variants, StrUtils, System.SysUtils;

{ TModelEntidadeProduto }

constructor TModelEntidadeItem.Create;
begin
  FQuery := TModelConexaoFactory.New.Query;
  TableName := 'ITENS';
  inherited;
end;

destructor TModelEntidadeItem.Destroy;
begin
  inherited;
end;

class function TModelEntidadeItem.New: IModelEntidade;
begin
  Result := Self.Create;
end;

end.
