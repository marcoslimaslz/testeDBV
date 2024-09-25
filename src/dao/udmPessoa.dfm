object dmPessoa: TdmPessoa
  OldCreateOrder = False
  Height = 273
  Width = 448
  object sdsPesquisar: TSQLDataSet
    CommandText = 
      'select codigo,'#13#10'  tipo,'#13#10'  nome,'#13#10'  estado'#13#10'from pessoa'#13#10'where (' +
      'nome like :nome)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 72
    Top = 56
  end
  object sdsInserir: TSQLDataSet
    CommandText = 
      'insert into pessoa (codigo, tipo, nome, estado)'#13#10'values (:codigo' +
      ', :tipo, :nome, :estado)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'estado'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 248
    Top = 56
  end
  object sdsExcluir: TSQLDataSet
    CommandText = 'delete from pessoa where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 384
    Top = 56
  end
  object sdsAlterar: TSQLDataSet
    CommandText = 
      'update pessoa'#13#10'set tipo = :tipo,'#13#10'    nome = :nome,'#13#10'    estado ' +
      '= :estado'#13#10'where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'estado'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 312
    Top = 56
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 64
    Top = 184
    object cdsPesquisarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPesquisarTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object cdsPesquisarNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object cdsPesquisarESTADO: TSmallintField
      FieldName = 'ESTADO'
      Required = True
    end
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sdsPesquisar
    Left = 64
    Top = 120
  end
  object sdsPesquisaPessoa: TSQLDataSet
    CommandText = 
      'select codigo,'#13#10'  tipo,'#13#10'  nome,'#13#10'  estado'#13#10'from pessoa'#13#10'where (' +
      'codigo = :codigo)'#13#10'  and (tipo = :tipo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 160
    Top = 56
  end
  object dspPesquisaPessoa: TDataSetProvider
    DataSet = sdsPesquisaPessoa
    Left = 160
    Top = 120
  end
  object cdsPesquisarPessoa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tipo'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisaPessoa'
    Left = 160
    Top = 184
    object cdsPesquisarPessoaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPesquisarPessoaTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object cdsPesquisarPessoaNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 80
    end
    object cdsPesquisarPessoaESTADO: TSmallintField
      FieldName = 'ESTADO'
      Required = True
    end
  end
end
