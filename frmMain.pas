unit frmMain;

interface

uses
  module, frmCity, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, pngimage, DB, ADODB;

type
  TForm1 = class(TForm)
    sideMenu: TTreeView;
    mainBody: TPanel;
    header: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    lvRecords: TListView;
    Panel2: TPanel;
    btnUpdate: TButton;
    btnAdd: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure createList();
  end;

var
  Form1: TForm1;
  Form2: TForm2;
  dt: TDm;

implementation

{$R *.dfm}

procedure TForm1.btnAddClick(Sender: TObject);
begin

  Application.CreateForm(TForm2, Form2);

  Form2.newRecord := true;
  Form2.btnRemove.Visible := false;
  Form2.Show;

end;

procedure TForm1.btnUpdateClick(Sender: TObject);
begin

  Application.CreateForm(TForm2, Form2);

  Form2.Show;

end;

procedure TForm1.createList();
var
  item: TListItem;

begin

  lvRecords.Clear;

  dt.sqlCity.SQL.Add('SELECT * from cidades');

  dt.sqlCity.Open;

  while not dt.sqlCity.Eof do
  begin

    item := lvRecords.Items.Add;

    item.Caption := dt.sqlCity.FieldByName('codigo_cidade').Value;

    item.SubItems.Add(dt.sqlCity.FieldByName('nome').Value);

    item.SubItems.Add(dt.sqlCity.FieldByName('estado').Value);

    item.SubItems.Add(dt.sqlCity.FieldByName('cep_inicial').Value + ' a ' + dt.sqlCity.FieldByName('cep_final').Value);

    dt.sqlCity.Next;

  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  dt := TDm.Create(Self);

  createList();

end;

end.
