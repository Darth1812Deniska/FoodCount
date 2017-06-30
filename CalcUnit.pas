unit CalcUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.Samples.Gauges;

type
  ProductInfo = record
  ID: Integer;
  Name: string;
  Cals: Real;
  Prots: Real;
  Carbons: Real;
  Fats:Real;
end;

type
  ProdInfoArr =  array of ProductInfo;

type
  TCalculateForm = class(TForm)
    lblCarbon: TLabel;
    lblProteins: TLabel;
    lblFats: TLabel;
    lstCarbons: TListBox;
    lstProteins: TListBox;
    lstFats: TListBox;
    btnAddProt: TSpeedButton;
    btnAddCarbons: TSpeedButton;
    btnAddFats: TSpeedButton;
    lblDayMenu: TLabel;
    lstDayMenu: TListBox;
    grpDayMenu: TGroupBox;
    seGramms: TSpinEdit;
    lblGramms: TLabel;
    lblPg: TLabel;
    seProts: TSpinEdit;
    lblCarbons: TLabel;
    seCarbons: TSpinEdit;
    lblFG: TLabel;
    seFats: TSpinEdit;
    grpGraphs: TGroupBox;
    gCals: TGauge;
    lblCarbGr: TLabel;
    lblProtGr: TLabel;
    gProt: TGauge;
    lblFatGr: TLabel;
    gFats: TGauge;
    lblCals: TLabel;
    gCarbons: TGauge;
    conMSSQL: TADOConnection;
    qryMSSQL: TADOQuery;
    pbCarbons: TPaintBox;
    pbProteins: TPaintBox;
    pbFats: TPaintBox;
    pbCals: TPaintBox;
    grpUser: TGroupBox;
    cbbUsers: TComboBox;
    lblUsers: TLabel;
    lblUserCal: TLabel;
    lblUserCarbons: TLabel;
    lblUserProteins: TLabel;
    lblUserFats: TLabel;
    edtUserCals: TEdit;
    edtUserProteins: TEdit;
    edtUserCarbons: TEdit;
    edtUserFats: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    procedure AddCarbonProducts;
    procedure AddProteinProducts;
    procedure AddFatProducts;
    procedure AddProduct(SQLText: string; ProductList: TListBox;
      ProductArray: ProdInfoArr);
    procedure AddUserInfo;
  public
    CarbonsProductArray: ProdInfoArr;
    ProtsProductArray: ProdInfoArr;
    FatsProductArray: ProdInfoArr;

  end;

var
  CalculateForm: TCalculateForm;


implementation

{$R *.dfm}

procedure TCalculateForm.FormCreate(Sender: TObject);
var
  SQLText: string;
begin
  SetLength(CarbonsProductArray, 0);
  SetLength(ProtsProductArray, 0);
  SetLength(FatsProductArray, 0);
  AddCarbonProducts;
  AddProteinProducts;
  AddFatProducts;
end;

procedure TCalculateForm.AddCarbonProducts;
var
  SQLText: string;
begin
  SQLText:= 'EXEC sprc_SelectMaxCarbons';
  AddProduct( SQLText, lstCarbons, CarbonsProductArray );
end;

procedure TCalculateForm.AddProteinProducts;
var
  SQLText:string;
begin
  SQLText:= 'EXEC sprc_SelectMaxProteins';
  AddProduct( SQLText, lstProteins, ProtsProductArray );
end;

procedure TCalculateForm.AddFatProducts;
var
  SQLText:string;
begin
  SQLText:= 'EXEC sprc_SelectMaxFats';
  AddProduct( SQLText, lstFats, FatsProductArray );
end;

procedure TCalculateForm.AddProduct(SQLText: string;
  ProductList: TListBox;
  ProductArray: ProdInfoArr);
var
  ArrLength: Integer;
begin
  qryMSSQL.SQL.Text:=SQLText;
  qryMSSQL.Open;
  qryMSSQL.First;
  while not qryMSSQL.Eof do
  begin
    ArrLength:= Length(ProductArray);
    Inc(ArrLength);
    SetLength(ProductArray, ArrLength);
    ProductArray[ArrLength-1].ID:= qryMSSQL.FieldByName('ID').AsInteger;
    ProductArray[ArrLength-1].Name:= qryMSSQL.FieldByName('Name').AsString;
    ProductArray[ArrLength-1].Cals:= qryMSSQL.FieldByName('Cals').AsFloat;
    ProductArray[ArrLength-1].Prots:= qryMSSQL.FieldByName('Prots').AsFloat;
    ProductArray[ArrLength-1].Carbons:= qryMSSQL.FieldByName('Carbons').AsFloat;
    ProductArray[ArrLength-1].Fats:= qryMSSQL.FieldByName('Fats').AsFloat;
    ProductList.Items.Add(ProductArray[ArrLength-1].Name);
    qryMSSQL.Next;
  end;
  qryMSSQL.Close;
end;

end.
