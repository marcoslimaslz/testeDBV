object dmServicoFarmaceutico: TdmServicoFarmaceutico
  OldCreateOrder = False
  Height = 327
  Width = 497
  object sdsPesquisar: TSQLDataSet
    CommandText = 
      'select codigo,'#13#10'  farmaceutico_id,'#13#10'  paciente_id,'#13#10'  observacao' +
      ','#13#10'  valor_total,'#13#10'  data'#13#10'from servico_farmaceutico'#13#10'where codi' +
      'go like :codigo'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 47
    Top = 56
  end
  object sdsInserir: TSQLDataSet
    CommandText = 
      'insert into servico_farmaceutico (codigo, farmaceutico_id, pacie' +
      'nte_id, observacao, valor_total, data)'#13#10'values (:codigo, :farmac' +
      'eutico_id, :paciente_id, :observacao, :valor_total, :data)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'farmaceutico_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'paciente_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'observacao'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor_total'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'data'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 229
    Top = 56
  end
  object sdsExcluir: TSQLDataSet
    CommandText = 'delete from servico_farmaceutico'#13#10'where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 421
    Top = 56
  end
  object sdsAlterar: TSQLDataSet
    CommandText = 
      'update servico_farmaceutico'#13#10'set farmaceutico_id = :farmaceutico' +
      '_id,'#13#10'    paciente_id = :paciente_id,'#13#10'    observacao = :observa' +
      'cao,'#13#10'    valor_total = :valor_total,'#13#10'    data = :data'#13#10'where (' +
      'codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'farmaceutico_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'paciente_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'observacao'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'valor_total'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'data'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 325
    Top = 56
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
    Left = 39
    Top = 184
    object cdsPesquisarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPesquisarFARMACEUTICO_ID: TIntegerField
      FieldName = 'FARMACEUTICO_ID'
      Required = True
    end
    object cdsPesquisarPACIENTE_ID: TIntegerField
      FieldName = 'PACIENTE_ID'
      Required = True
    end
    object cdsPesquisarOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cdsPesquisarVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesquisarDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sdsPesquisar
    Left = 39
    Top = 120
  end
  object sdsInserir_Item: TSQLDataSet
    CommandText = 
      'insert into servico_farmaceutico_lista (codigo, servico_farmaceu' +
      'tico_id, servico_id, valor)'#13#10'values (:codigo, :servico_farmaceut' +
      'ico_id, :servico_id, :valor)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'servico_farmaceutico_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'servico_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 229
    Top = 120
  end
  object sdsExcluir_Item: TSQLDataSet
    CommandText = 'delete from servico_farmaceutico_lista'#13#10'where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 421
    Top = 120
  end
  object sdsAlterar_Item: TSQLDataSet
    CommandText = 
      'update servico_farmaceutico_lista'#13#10'set servico_farmaceutico_id =' +
      ' :servico_farmaceutico_id,'#13#10'    servico_id = :servico_id,'#13#10'    v' +
      'alor = :valor'#13#10'where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'servico_farmaceutico_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'servico_id'
        ParamType = ptInput
      end
      item
        DataType = ftFMTBcd
        Name = 'valor'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 325
    Top = 120
  end
  object sdsPesquisar_Item: TSQLDataSet
    CommandText = 
      'select codigo,'#13#10'  servico_farmaceutico_id,'#13#10'  servico_id,'#13#10'  val' +
      'or'#13#10'from servico_farmaceutico_lista'#13#10'where servico_farmaceutico_' +
      'id like :servico_farmaceutico_id'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 136
    Top = 56
  end
  object cdsPesquisar_Item: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar_Item'
    Left = 128
    Top = 184
    object cdsPesquisar_ItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsPesquisar_ItemSERVICO_FARMACEUTICO_ID: TIntegerField
      FieldName = 'SERVICO_FARMACEUTICO_ID'
      Required = True
    end
    object cdsPesquisar_ItemSERVICO_ID: TIntegerField
      FieldName = 'SERVICO_ID'
      Required = True
    end
    object cdsPesquisar_ItemVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dspPesquisar_Item: TDataSetProvider
    DataSet = sdsPesquisar_Item
    Left = 128
    Top = 120
  end
end
