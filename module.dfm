object Dm: TDm
  OldCreateOrder = False
  Height = 99
  Width = 177
  object sqlCity: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * from cidades')
    Left = 112
    Top = 24
    object sqlCitycodigo_cidade: TStringField
      FieldName = 'codigo_cidade'
      Size = 50
    end
    object sqlCitynome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object sqlCityestado: TStringField
      FieldName = 'estado'
      Size = 50
    end
    object sqlCitycep_inicial: TStringField
      FieldName = 'cep_inicial'
      Size = 8
    end
    object sqlCitycep_final: TStringField
      FieldName = 'cep_final'
      Size = 8
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Integrated Security=SSPI;Persist Security I' +
      'nfo=False;User ID="";Initial Catalog=newcon_teste;Data Source=DE' +
      'SKTOP-7ELQ00I\MSSQLSERVER01;Initial File Name="";Server SPN=""'
    Provider = 'SQLNCLI11.1'
    Left = 40
    Top = 16
  end
end
