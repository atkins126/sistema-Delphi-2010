unit frmCity;

interface

uses
  module, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    txtPostCodeEnd: TEdit;
    txtPostCodeStart: TEdit;
    txtCode: TEdit;
    cbState: TComboBox;
    txtName: TEdit;
    Panel2: TPanel;
    btnSave: TButton;
    btnRemove: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function validates(): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    newRecord: Boolean;
    procedure loadCity(codigo: String);
  end;

var
  Form2: TForm2;
  dt: TDm;

implementation

{$R *.dfm}

procedure TForm2.loadCity(codigo: String);
begin

  dt.sqlCity.Close;
  dt.sqlCity.SQL.Clear;
  dt.sqlCity.SQL.Add('SELECT * FROM cidades WHERE codigo_cidade = ' + QuotedStr(codigo));
  dt.sqlCity.Open;

  if dt.sqlCity.Eof then
  begin
    ShowMessage('N�o foi poss�vel encontrar a cidade selecionada, por favor, tente novamente!');
    Form2.Release;
    exit;
  end
  else
  begin
    txtCode.Text := dt.sqlCity.FieldByName('codigo_cidade').Value;
    txtName.Text := dt.sqlCity.FieldByName('nome').Value;
    cbState.ItemIndex := cbState.Items.IndexOfName(dt.sqlCity.FieldByName('estado').Value);
    txtPostCodeStart.Text := dt.sqlCity.FieldByName('cep_inicial').Value;
    txtPostCodeEnd.Text := dt.sqlCity.FieldByName('cep_final').Value;
  end;

end;

procedure TForm2.btnSaveClick(Sender: TObject);
begin

  validates();

  dt.sqlCity.Close;
  dt.sqlCity.SQL.Clear;
  dt.sqlCity.SQL.Add('INSERT INTO cidades (codigo_cidade, nome, estado, cep_inicial, cep_final) VALUES ('+
          QuotedStr(txtCode.Text)+ ', ' + QuotedStr(txtName.Text) + ', ' + QuotedStr(cbState.Text) + ', ' + QuotedStr(txtPostCodeStart.Text) + ',' + QuotedStr(txtPostCodeEnd.Text) + ')' );
  dt.sqlCity.ExecSQL();

end;

function TForm2.validates(): boolean;
begin

  if Length(txtCode.Text) = 0 then
  begin
    ShowMessage('Por favor, preencha o c�digo da cidade para continuar!');
    txtCode.SetFocus;
    exit;
  end
  else
    if newRecord then
    begin
      dt.sqlCity.SQL.Add('SELECT COUNT(*) AS qtd FROM cidades WHERE codigo_cidade = ' + QuotedStr(txtCode.Text));
      dt.sqlCity.Open;

      if dt.sqlCity.FieldByName('qtd').Value > 0  then
      begin
        ShowMessage('O c�digo da cidade deve ser �nico!');
        txtCode.SetFocus;
        exit;
      end;

    end;

  if Length(txtName.Text) = 0 then
  begin
    ShowMessage('Por favor, preencha o nome da cidade para continuar!');
    txtName.SetFocus;
    exit;
  end;

  if cbState.ItemIndex = -1 then
  begin
    ShowMessage('Por favor, selecione o estado da cidade para continuar!');
    cbState.SetFocus;
    exit;
  end;

  if (Length(txtPostCodeStart.Text) = 0) OR (Length(txtPostCodeEnd.Text) = 0) then
  begin
    ShowMessage('Por favor, preencha corretamente a feixa de cep para continuar!');
    txtPostCodeStart.SetFocus;
    exit;
  end;

  validates := true;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin

  dt := TDm.Create(Self);

end;

end.
