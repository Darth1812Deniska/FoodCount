unit AddUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.ExtCtrls;

type
  TAddUserForm = class(TForm)
    conMSSQL: TADOConnection;
    lblName: TLabel;
    edtName: TEdit;
    lblAge: TLabel;
    edtAge: TEdit;
    lblWeight: TLabel;
    edtWeight: TEdit;
    lblHeight: TLabel;
    edtHeight: TEdit;
    btnSolve: TButton;
    lblActKof: TLabel;
    cbbActKof: TComboBox;
    rgSex: TRadioGroup;
    grpAddInfo: TGroupBox;
    grpResults: TGroupBox;
    btnSaveResults: TButton;
    lblBaseCalories: TLabel;
    edtBaseCalories: TEdit;
    lblRequiredCal: TLabel;
    edtRequiredCal: TEdit;
    lblWLoss: TLabel;
    edtWLoss: TEdit;
    lblProteins: TLabel;
    edtProteins: TEdit;
    lblFats: TLabel;
    edtFats: TEdit;
    lblCarbons: TLabel;
    edtCarbons: TEdit;
    qryMSSQL: TADOQuery;
    cbbProt: TComboBox;
    lblChProts: TLabel;
    lblCalsOnNutr: TLabel;
    edtCalsOnNutr: TEdit;
    procedure btnSolveClick(Sender: TObject);
    procedure btnSaveResultsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Name: string;
    Sex: Integer;
    Age: Integer;
    Weight: Extended;
    Height: Extended;
    ActKof: Extended;
    BaseCalories: Extended;
    ResCal: Extended;
    CalWLossMin: Extended;
    CalWLossMax: Extended;
    Proteins:Extended;
    Fats: Extended;
    Carbons: Extended;
    CalOnNutr: Extended;
    ProtsForWeight: Extended;
    FormatSettings : TFormatSettings;
  public
    { Public declarations }
  end;

var
  AddUserForm: TAddUserForm;

implementation

{$R *.dfm}

procedure TAddUserForm.btnSaveResultsClick(Sender: TObject);
var
  SQLText: string;
begin
  SQLText:= 'INSERT INTO UserInfo '+
  '( NAME, '+
    'Sex, '+
    'Age, '+
    '[Weight], '+
    'Height, '+
    'ActKof, '+
    'ProtsOnWeight, '+
    'Calories, '+
    'ResCal, '+
    'Proteins, '+
    'Carbohydrates, '+
    'Fats, '+
    'CalsOnNutr, '+
    'CalWLossMin, '+
    'CalWLossMax ) '+
  'VALUES '+
  '( '''+ Name+''', '+
    IntToStr ( Sex ) +', '+
    IntToStr ( Age ) +', '+
    FloatToStr ( Weight, FormatSettings ) +', '+
    FloatToStr ( Height, FormatSettings ) +', '+
    FloatToStr(ActKof, FormatSettings)+ ', '+
    FloatToStr( ProtsForWeight, FormatSettings)+ ', '+
    FloatToStr(BaseCalories, FormatSettings)+', '+
    FloatToStr(ResCal, FormatSettings) +', '+
    FloatToStr(Proteins, FormatSettings)+ ', '+
    FloatToStr(Carbons, FormatSettings)+', '+
    FloatToStr(Fats, FormatSettings) +', '+
    FloatToStr(CalOnNutr, FormatSettings) +', '+
    FloatToStr(CalWLossMin, FormatSettings)+', '+
    FloatToStr(CalWLossMax, FormatSettings)+' '+
  ')';
  qryMSSQL.SQL.Text:=SQLText;
  try
    qryMSSQL.ExecSQL;
    ShowMessage('������ ����������');
  except on E:Exception do
    begin
      ShowMessage('������ ��� ���������� ������: '+ e.Message);
    end;
  end;

end;

procedure TAddUserForm.btnSolveClick(Sender: TObject);
var
  Err: Boolean;
  NutrPercent:Real;
begin
  Name:= edtName.Text;
  Sex:= rgSex.ItemIndex;
  Err:= not TryStrToFloat(edtWeight.Text, Weight);
  if not Err then
    Err:= not  TryStrToFloat( edtHeight.Text, Height );
  if not Err then
    Err:= not  TryStrToInt( edtAge.Text, Age );
  if not Err then
    Err:= not  TryStrToFloat(cbbActKof.Text, ActKof);
  if not Err then
    Err:= not  TryStrToFloat( cbbProt.Text, ProtsForWeight );
  if not Err then
    begin
      if Sex = 0 then
      BaseCalories:= 66.47 + 13.75 * Weight + 5 * Height - 6.74 * Age;
      if Sex = 1 then
      BaseCalories:= 655.1 + 9.6 * Weight + 1.85 * Height - 4.68 * Age;
      ResCal:=BaseCalories * ActKof;
      CalWLossMin:= 0.75 * ResCal;
      CalWLossMax:= 0.8 * ResCal;
      Proteins:= Weight * ProtsForWeight;
      NutrPercent:=Proteins / 30;
      Fats:= NutrPercent * 20;
      Carbons:= NutrPercent * 50;
      CalOnNutr:= Round( 9.3 * Fats + 4.1 * Carbons + 3.8 * Proteins);
      Proteins:= Round ( Proteins);
      Fats:= Round( Fats );
      Carbons:= Round ( Carbons );
      edtBaseCalories.Text:= FloatToStr(BaseCalories);
      edtRequiredCal.Text:= FloatToStr( ResCal );
      edtWLoss.Text:= FloatToStr(CalWLossMin)+' � '+FloatToStr(CalWLossMax);
      edtCalsOnNutr.Text:= FloatToStr(CalOnNutr);
      edtProteins.Text:=FloatToStr(Proteins);
      edtFats.Text:= FloatToStr(Fats);
      edtCarbons.Text:=FloatToStr(Carbons);
    end;

end;

procedure TAddUserForm.FormCreate(Sender: TObject);
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FormatSettings);
  FormatSettings.DecimalSeparator:='.';
end;

end.
