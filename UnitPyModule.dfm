object PyModule: TPyModule
  Height = 270
  Width = 568
  PixelsPerInch = 96
  object PythonEngine1: TPythonEngine
    AutoLoad = False
    Left = 40
    Top = 16
  end
  object PythonModule1: TPythonModule
    Engine = PythonEngine1
    OnInitialization = PythonModule1Initialization
    ModuleName = 'delphi_mod'
    Errors = <>
    Left = 136
    Top = 16
  end
  object PyEmbeddedEnvironment1: TPyEmbeddedEnvironment
    AutoLoad = False
    PythonEngine = PythonEngine1
    Distributions = <>
    Scanner.ScanRule = srFolder
    Scanner.DeleteEmbeddable = False
    Left = 288
    Top = 16
  end
  object Folium1: TFolium
    PythonEngine = PythonEngine1
    PyEnvironment = PyEmbeddedEnvironment1
    ManagerKind = pip
    Left = 144
    Top = 88
  end
  object Meteostat1: TMeteostat
    PythonEngine = PythonEngine1
    PyEnvironment = PyEmbeddedEnvironment1
    ManagerKind = pip
    Left = 248
    Top = 96
  end
end
