object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 150
  Width = 215
  object ADOC: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=bd.mdb;Persist Secu' +
      'rity Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 8
  end
  object ADOTable: TADOTable
    Active = True
    Connection = ADOC
    CursorType = ctStatic
    TableName = 'TableHaupt'
    Left = 32
    Top = 56
    object ADOTableKey: TAutoIncField
      FieldName = 'Key'
      ReadOnly = True
    end
    object ADOTableSubst: TMemoField
      FieldName = 'Subst'
      BlobType = ftMemo
    end
    object ADOTableCoefB: TFloatField
      FieldName = 'CoefB'
    end
    object ADOTableMotON: TFloatField
      FieldName = 'MotON'
    end
    object ADOTableResON: TFloatField
      FieldName = 'ResON'
    end
    object ADOTableRo20: TFloatField
      FieldName = 'Ro20'
    end
    object ADOTableTemKip: TFloatField
      FieldName = 'TemKip'
    end
    object ADOTableDNP_A: TFloatField
      FieldName = 'DNP_A'
    end
    object ADOTableDNP_B: TFloatField
      FieldName = 'DNP_B'
    end
    object ADOTableDNP_C: TFloatField
      FieldName = 'DNP_C'
    end
    object ADOTableMolarMass: TFloatField
      FieldName = 'MolarMass'
    end
  end
  object ADOTableVarName: TADOTable
    Active = True
    Connection = ADOC
    CursorType = ctStatic
    TableName = 'TableVarName'
    Left = 112
    Top = 56
    object ADOTableVarNameKey: TAutoIncField
      FieldName = 'Key'
      ReadOnly = True
    end
    object ADOTableVarNameSubst: TWideStringField
      FieldName = 'Subst'
      Size = 255
    end
    object ADOTableVarNameVarName: TMemoField
      FieldName = 'VarName'
      BlobType = ftMemo
    end
  end
end
