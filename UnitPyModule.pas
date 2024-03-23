unit UnitPyModule;

interface

uses
  System.SysUtils, System.Classes;

type
  TPyModule = class(TDataModule)

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PyModule: TPyModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
