object Dm: TDm
  OldCreateOrder = False
  Height = 99
  Width = 177
  object sqlCity: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 112
    Top = 24
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
