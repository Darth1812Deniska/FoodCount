unit AddFood;
{!
================================================================================
Модуль добавления продуктов в систему
================================================================================
!}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.Win.ADODB, Data.DB;

type
  TAddFoodForm = class(TForm)
    lbledtFoodName: TLabeledEdit;
    lbledtProts: TLabeledEdit;
    lbledtFats: TLabeledEdit;
    lbledtCarbons: TLabeledEdit;
    lbledtKCal: TLabeledEdit;
    cbbFoodGroup: TComboBox;
    lblFoodGroup: TLabel;
    btnAddFood: TButton;
    rgRatio: TRadioGroup;
    conMSSQL: TADOConnection;
    cmdMSSQL: TADOCommand;
    procedure btnAddFoodClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    // Наименование продукта
    Name:string;
    // Количетво белков на 1 грамм
    Prots: Double;
    // Количество жиров на 1 грамм
    Fats: Double;
    // Количество углеводов на 1 грамм
    Carbons: Double;
    // Калорийность на 1 грамм
    Cals: Double;
    FormatSettings : TFormatSettings;
  public
    { Public declarations }
  end;

var
  AddFoodForm: TAddFoodForm;

implementation

{$R *.dfm}

procedure TAddFoodForm.btnAddFoodClick(Sender: TObject);
var
  SQLText: string;
begin
  Name:= Trim( lbledtFoodName.Text );
  if rgRatio.ItemIndex = 0 then
  begin
    Prots:= StrToFloat( Trim( lbledtProts.Text ));
    Fats:= StrToFloat(Trim( lbledtFats.Text ));
    Carbons:= StrToFloat(Trim( lbledtCarbons.Text ));
    cals:= StrToFloat(Trim( lbledtKCal.Text ));
  end;
  if rgRatio.ItemIndex = 1 then
  begin
    Prots:= StrToFloat( Trim( lbledtProts.Text )) / 100;
    Fats:= StrToFloat(Trim( lbledtFats.Text )) / 100;
    Carbons:= StrToFloat(Trim( lbledtCarbons.Text )) / 100;
    cals:= StrToFloat(Trim( lbledtKCal.Text )) / 100;
  end;


  SQLText:=  'INSERT INTO FoodInfo '+
  '( NAME, '+
    'Prots, '+
    'Fats, '+
    'Carbons, '+
    'Cals ) '+
  'VALUES '+
  '( '''+Name+''', '+
  '  '+ FloatToStr(Prots, FormatSettings) +', '+
  '  '+ FloatToStr(Fats, FormatSettings) +', '+
  ' '+ FloatToStr(Carbons, FormatSettings) +', '+
  ' '+ FloatToStr(Cals, FormatSettings) +' )';
  cmdMSSQL.CommandText:=SQLText;
  cmdMSSQL.Execute;
end;

procedure TAddFoodForm.FormCreate(Sender: TObject);
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, FormatSettings);
  FormatSettings.DecimalSeparator:='.';
end;

end.
