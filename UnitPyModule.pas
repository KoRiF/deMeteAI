unit UnitPyModule;

interface

uses
  System.SysUtils, System.Classes, PythonEngine, PyEnvironment,
  PyEnvironment.Embeddable;
type
  TPyModule = class(TDataModule)
    PythonEngine1: TPythonEngine;
    PythonModule1: TPythonModule;
    PyEmbeddedEnvironment1: TPyEmbeddedEnvironment;
    procedure PythonModule1Initialization(Sender: TObject);

  private
    { Private declarations }
    _pybin: Variant;
    _pymain: Variant;
    _pyop: Variant;
  public
    { Public declarations }

  private
    type
      TPyFuncLambda = TFunc<PPyObject, PPyObject, PPyObject>;
      TPyFuncKWLambda = TFunc<PPyObject, PPyObject, PPyObject, PPyObject>;
    var
      _lambda: TPyFuncLambda;
      _lambda_kw: TPyFuncKWLambda;
    function _DelphiFunctionPyCdecl(pself, args: PPyObject): PPyObject; cdecl;
    function _DelphiFunctionKWPyCdecl(pself, args, kwargs: PPyObject): PPyObject; cdecl;
    function EvalLambdaFuncObject(): Variant;
    function EvalLambdaKWFuncObject(): Variant;
  end;

var
  PyModule: TPyModule;

implementation


{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  Variants, VarPyth, PyUtils;


function TPyModule.EvalLambdaFuncObject: Variant;
begin
  GetPythonEngine().ExecString('import delphi_mod');
  RESULT := VarPythonEval('delphi_mod.lambdafunc'); //cannot be named just a 'lambda' => syntax error!
end;

function TPyModule.EvalLambdaKWFuncObject: Variant;
begin
  GetPythonEngine().ExecString('import delphi_mod');
  RESULT := VarPythonEval('delphi_mod.lambdafunckw');
end;

procedure TPyModule.PythonModule1Initialization(Sender: TObject);
begin
  _lambda := function (pself, args: PPyObject): PPyObject
  begin
    EXIT(PythonEngine1.Py_BuildValue(''));     //stub: return none
  end;

  _lambda_kw := function (pself, args, kwargs: PPyObject): PPyObject
  begin
    EXIT(PythonEngine1.Py_BuildValue(''));     //stub: return none
  end;

  PythonModule1.AddDelphiMethod('lambdafunc', _DelphiFunctionPyCdecl, 'lambda'); //cannot use just a 'lambda' function name due to rather odd python syntax error message
  PythonModule1.AddDelphiMethod('lambdafunckw', _DelphiFunctionPyCdecl, 'lambdakw');
end;

function TPyModule._DelphiFunctionKWPyCdecl(pself, args,
  kwargs: PPyObject): PPyObject;
begin
  RESULT := _lambda_kw(pself, args, kwargs);
end;

function TPyModule._DelphiFunctionPyCdecl(pself, args: PPyObject): PPyObject;
begin
  RESULT := _lambda(pself, args);
end;

end.
