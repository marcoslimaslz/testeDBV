object dmVendaItem: TdmVendaItem
  OldCreateOrder = False
  Height = 358
  Width = 492
  object sdsPesquisar: TSQLDataSet
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
    Left = 47
    Top = 56
  end
  object sdsInserir: TSQLDataSet
    CommandText = 
      'insert into venda_item (codigo, venda_id, servico_id, valor)'#13#10'va' +
      'lues (:codigo, :venda_id, :servico_id, :valor)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'venda_id'
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
    Left = 125
    Top = 56
  end
  object sdsExcluir: TSQLDataSet
    CommandText = 'delete from venda_item where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 317
    Top = 56
  end
  object sdsAlterar: TSQLDataSet
    CommandText = 
      'update venda_item'#13#10'set servico_id = :servico_id,'#13#10'    valor = :v' +
      'alor'#13#10'where (codigo = :codigo)'
    MaxBlobSize = -1
    Params = <
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
    Left = 221
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
    object cdsPesquisarVENDA_ID: TIntegerField
      FieldName = 'VENDA_ID'
      Required = True
    end
    object cdsPesquisarSERVICO_ID: TIntegerField
      FieldName = 'SERVICO_ID'
      Required = True
    end
    object cdsPesquisarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sdsPesquisar
    Left = 39
    Top = 120
  end
  object sdsCarregar: TSQLDataSet
    CommandText = 'select * from venda_item '#13#10'where (venda_id = :venda_id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.sqlConexao
    Left = 189
    Top = 128
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
    Left = 191
    Top = 256
    object cdsCarregarCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsCarregarVENDA_ID: TIntegerField
      FieldName = 'VENDA_ID'
      Required = True
    end
    object cdsCarregarSERVICO_ID: TIntegerField
      FieldName = 'SERVICO_ID'
      Required = True
    end
    object cdsCarregarVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dspCarregar: TDataSetProvider
    DataSet = sdsCarregar
    Left = 191
    Top = 192
  end
end
