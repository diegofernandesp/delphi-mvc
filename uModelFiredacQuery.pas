unit uModelFiredacQuery;

interface

uses
  uInterface, FireDAC.Comp.Client, Firedac.Stan.Param;

Type
  TModelFiredacQuery = class(TInterfacedObject, iModelQuery)
    private
      FQuery : TFDQuery;
      FConexao : iModelConexao;
    public
      constructor Create(aValue : iModelConexao);
      destructor Destroy; override;
      class function New(aValue : iModelConexao) : iModelQuery;
      function Query : TObject;
      function Open(ASql : String) : iModelQuery;
      function ExecSQL(aSQL : String) : iModelQuery;
  end;

implementation

uses
  System.SysUtils;

{ TModelFiredacQuery }

constructor TModelFiredacQuery.Create(aValue: iModelConexao);
begin
  FConexao := aValue;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(FConexao.Connection);
end;

destructor TModelFiredacQuery.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelFiredacQuery.ExecSQL(aSQL: String): iModelQuery;
begin
  Result := Self;
  FQuery.ExecSQL(aSQL);
end;

class function TModelFiredacQuery.New(aValue: iModelConexao): iModelQuery;
begin
  Result := Self.Create(aValue);
end;

function TModelFiredacQuery.Open(ASql: String): iModelQuery;
begin
  Result := Self;
  FQuery.Open(ASql);
end;

function TModelFiredacQuery.Query: TObject;
begin
  Result := FQuery;
end;

end.
