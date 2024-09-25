object dmVenda: TdmVenda
  OldCreateOrder = False
  Height = 475
  Width = 497
  object sdsPesquisar: TSQLDataSet
    CommandText = 
      'select v.codigo,'#13#10'  v.farmaceutico_id,'#13#10'  f.nome as farmaceutico' +
      ','#13#10'  v.paciente_id,'#13#10'  p.nome as paciente,'#13#10'  v.observacao,'#13#10'  v' +
      '.valor_total,'#13#10'  v.data'#13#10'from venda v'#13#10'  inner join pessoa f on ' +
      'f.codigo = v.farmaceutico_id'#13#10'  inner join pessoa p on p.codigo ' +
      '= v.paciente_id'#13#10'where (v.codigo like :codigo)'#13#10'or (coalesce(:co' +
      'digo,0) = 0)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 47
    Top = 56
  end
  object sdsInserir: TSQLDataSet
    CommandText = 
      'insert into venda (codigo, farmaceutico_id, paciente_id, observa' +
      'cao, valor_total, data)'#13#10'values (:codigo, :farmaceutico_id, :pac' +
      'iente_id, :observacao, :valor_total, :data)'
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
    CommandText = 'delete from venda'#13#10'where (codigo = :codigo)'
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
      'update venda'#13#10'set farmaceutico_id = :farmaceutico_id,'#13#10'    pacie' +
      'nte_id = :paciente_id,'#13#10'    observacao = :observacao,'#13#10'    valor' +
      '_total = :valor_total,'#13#10'    data = :data'#13#10'where (codigo = :codig' +
      'o)'
    MaxBlobSize = -1
    Params = <
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
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigo'
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
      Visible = False
    end
    object cdsPesquisarFARMACEUTICO: TStringField
      DisplayWidth = 50
      FieldName = 'FARMACEUTICO'
      Required = True
      Size = 80
    end
    object cdsPesquisarPACIENTE_ID: TIntegerField
      FieldName = 'PACIENTE_ID'
      Required = True
      Visible = False
    end
    object cdsPesquisarPACIENTE: TStringField
      DisplayWidth = 50
      FieldName = 'PACIENTE'
      Required = True
      Size = 80
    end
    object cdsPesquisarOBSERVACAO: TStringField
      DisplayWidth = 50
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cdsPesquisarVALOR_TOTAL: TFMTBCDField
      DisplayLabel = 'VALOR TOTAL'
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
      'insert into venda_item (codigo, venda_id, servico_id, valor)'#13#10'va' +
      'lues (:codigo, :venda_id, :servico_id, :valor)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'venda_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
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
    CommandText = 'delete from venda_item'#13#10'where (codigo = :codigo)'
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
      'update venda_item'#13#10'set servico_id = :servico_id,'#13#10'    valor = :v' +
      'alor'#13#10'where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'servico_id'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
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
      'select codigo,'#13#10'  venda_id,'#13#10'  servico_id,'#13#10'  valor'#13#10'from venda_' +
      'item'#13#10'where venda_id like :venda_id'
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
    object cdsPesquisar_ItemVENDA_ID: TIntegerField
      FieldName = 'VENDA_ID'
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
  object sdsCarregar: TSQLDataSet
    CommandText = 'select * from venda '#13#10'where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 287
    Top = 208
  end
  object cdsCarregar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    ProviderName = 'dspCarregar'
    Left = 279
    Top = 336
    object cdsCarregarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCarregarFARMACEUTICO_ID: TIntegerField
      FieldName = 'FARMACEUTICO_ID'
      Required = True
    end
    object cdsCarregarPACIENTE_ID: TIntegerField
      FieldName = 'PACIENTE_ID'
      Required = True
    end
    object cdsCarregarOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cdsCarregarVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCarregarDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
  end
  object dspCarregar: TDataSetProvider
    DataSet = sdsCarregar
    Left = 279
    Top = 272
  end
end
