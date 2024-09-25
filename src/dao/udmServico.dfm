object dmServico: TdmServico
  OldCreateOrder = False
  Height = 282
  Width = 468
  object sdsPesquisar: TFDQuery
    SQL.Strings = (
      'select codigo,'
      '  nome,'
      '  valor,'
      '  estado'
      'from servico'
      'where nome like :nome')
    Left = 72
    Top = 56
    ParamData = <
      item
        Name = 'nome'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object sdsInserir: TFDQuery
    SQL.Strings = (
      'insert into servico (codigo, nome, valor, estado)'
      'values (:codigo, :nome, :valor, :estado)')
    Left = 144
    Top = 56
    ParamData = <
      item
        Name = 'codigo'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'nome'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'valor'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'estado'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object sdsExcluir: TFDQuery
    SQL.Strings = (
      'delete from servico where (codigo = :codigo)')
    Left = 280
    Top = 56
    ParamData = <
      item
        Name = 'codigo'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sdsAlterar: TFDQuery
    SQL.Strings = (
      'update servico'
      'set nome = :nome,'
      '    valor = :valor,'
      '    estado = :estado'
      'where (codigo = :codigo)')
    Left = 208
    Top = 56
    ParamData = <
      item
        Name = 'codigo'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'nome'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'valor'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'estado'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 64
    Top = 184
    object cdsPesquisarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPesquisarNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object cdsPesquisarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
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
end
