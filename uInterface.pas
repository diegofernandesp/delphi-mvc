unit uInterface;

interface

uses DB, uFilter, uJoin;

type
  iModelQuery = interface;

  iModelConexao = interface
    function Connection : TObject;
  end;

  iModelConexaoFactory = interface
    function Conexao : iModelConexao;
    function Query : iModelQuery;
  end;

  iModelQuery = interface
    function Query : TObject;
    function Open(aSQL : String) : iModelQuery;
    function ExecSQL(aSQL : String) : iModelQuery;
  end;

  IModelEntidade = interface
    function DataSet ( aValue : TDataSource ) : IModelEntidade;
    function Filter(ADatasetFilter: IDatasetFilter): IModelEntidade;
    function Select(AFields: array of String): IModelEntidade;
    function OrderBy(AFields: array of String): IModelEntidade;
    function Join(AJoinKind: TJoinKind; ATable, AField, ATargetField: String): IModelEntidade; overload;
    procedure Open; overload;
  end;

  iModelEntidadeFactory = interface
    function Item: IModelEntidade;
    function Venda: IModelEntidade;
    function VendaItem: IModelEntidade;
  end;

implementation

end.
