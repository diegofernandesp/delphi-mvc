unit uInterface;

interface

uses DB, uFilters;

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
    procedure Open; overload;
  end;

  iModelEntidadeFactory = interface
    function Item: IModelEntidade;
    function Venda: IModelEntidade;
    function VendaItem: IModelEntidade;
  end;

implementation

end.
