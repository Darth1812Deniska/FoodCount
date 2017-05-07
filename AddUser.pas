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
    procedure btnSolveClick(Sender: TObject);
  private
    Name: string;
    Sex: Integer;
    Age: Integer;
    Weight: Real;
    Height: Real;
    ActKof: Real;
    BaseCalories: Real;
    ResCal: Real;
    CalWLossMin: Real;
    CalWLossMax: Real;
    CalWGainMin: Real;
    CalWGainMax: Real;
    ProteinsMin: Real;
    ProteinsMax: Real;
    FatsMin: Real;
    FatsMax: Real;
    CarbonsMin: Real;
    CarbonsMax: Real;
  public
    { Public declarations }
  end;

var
  AddUserForm: TAddUserForm;

implementation

{$R *.dfm}

procedure TAddUserForm.btnSolveClick(Sender: TObject);
var
  NutrPercentMin:Real;
  NutrPercentMax:Real;
begin
  Name:= edtName.Text;
  Sex:= rgSex.ItemIndex;
  Weight:= StrToFloat( edtWeight.Text );
  Height:= StrToFloat( edtHeight.Text );
  Age:= StrToInt( edtAge.Text );
  ActKof := StrToFloat( cbbActKof.Text );
  if Sex = 0 then
  BaseCalories:= 66.47 + 13.75 * Weight + 5 * Height - 6.74 * Age;
  if Sex = 1 then
  BaseCalories:= 655.1 + 9.6 * Weight + 1.85 * Height - 4.68 * Age;
  ResCal:=BaseCalories * ActKof;
  CalWLossMin:= 0.75 * ResCal;
  CalWLossMax:= 0.8 * ResCal;
  ProteinsMin:= Round (Weight);
  ProteinsMax:= Round( Weight * 1.5 );
  NutrPercentMin:= ProteinsMin / 30;
  NutrPercentMax:= ProteinsMax / 30;
  FatsMin:= Round( NutrPercentMin * 20 );
  FatsMax:= Round( NutrPercentMax * 20 );
  CarbonsMin:= Round( NutrPercentMin * 50);
  CarbonsMax:= Round( NutrPercentMax * 50);
  edtBaseCalories.Text:= FloatToStr(BaseCalories);
  edtRequiredCal.Text:= FloatToStr( ResCal );
  edtWLoss.Text:= FloatToStr(CalWLossMin)+' � '+FloatToStr(CalWLossMax);
  edtProteins.Text:=FloatToStr(ProteinsMin)+' � '+FloatToStr(ProteinsMax);
  edtFats.Text:= FloatToStr(FatsMin)+' � '+FloatToStr(FatsMax);
  edtCarbons.Text:=FloatToStr(CarbonsMin)+' � '+FloatToStr(CarbonsMax);
end;

end.
