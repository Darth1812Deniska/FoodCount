unit CalcUnit;
{!
================================================================================
Модуль расчета меню
================================================================================
!}


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
  UserInfo = record
    ID: Integer;
    Name: string;
    CalsMin: Real;
    CalsMax: Real;
    Prots: Real;
    Carbons: Real;
    Fats: Real;
  end;

type
  DayProduct = record
    ID: Integer;
    Name: string;
    Gramms: Real;
    Cals: Real;
    Prots: Real;
    Carbons: Real;
    Fats: Real;
    Color: TColor;
  end;

type
  TProdInfoArr =  array of ProductInfo;

type
  TUserInfoArray = array of UserInfo;

type
  TDayProductArray = array of DayProduct;

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
    imgCals: TImage;
    imgCarbons: TImage;
    imgProts: TImage;
    imgFats: TImage;
    imgProduct: TImage;
    procedure cbbUsersChange(Sender: TObject);
    procedure btnAddCarbonsClick(Sender: TObject);
    procedure lstDayMenuClick(Sender: TObject);
    procedure btnAddProtClick(Sender: TObject);
    procedure btnAddFatsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private

    SelectedUserID: Integer;
    SelectedMinCals: Real;
    SelectedMaxCals: Real;
    SelectedUserProts:Real;
    SelectedUserCarbons: Real;
    SelectedUserFats: Real;
    procedure AddCarbonProducts;
    procedure AddProteinProducts;
    procedure AddFatProducts;
    procedure AddProduct(SQLText: string; ProductList: TListBox;
      var ProductArray: TProdInfoArr);
    procedure AddUserInfo;
    procedure SetStartColors;
    procedure ShowProductColor(iSelectedProduct: Integer);
    procedure AddProductToDayMenu(NutrProductArray: TProdInfoArr;
      ProductList:TListBox);
    procedure UpdateDiagrams;
    function CheckIdInArray(ProductID: Integer):Boolean;
  public
    CarbonsProductArray: TProdInfoArr;
    ProtsProductArray: TProdInfoArr;
    FatsProductArray: TProdInfoArr;
    UsersInfo: TUserInfoArray;
    DayProductArray: TDayProductArray;
end;

var
  CalculateForm: TCalculateForm;


implementation

{$R *.dfm}

procedure TCalculateForm.FormShow(Sender: TObject);
begin
  lstDayMenu.Items.Clear;
  SetLength(CarbonsProductArray, 0);
  SetLength(ProtsProductArray, 0);
  SetLength(FatsProductArray, 0);
  SetLength(UsersInfo, 0);
  SetLength(DayProductArray, 0);
  AddCarbonProducts;
  AddProteinProducts;
  AddFatProducts;
  AddUserInfo;
  SetStartColors;
  SelectedUserID:=-1;
end;

procedure TCalculateForm.lstDayMenuClick(Sender: TObject);
var
  iSelectedItem: Integer;
begin
  iSelectedItem:= lstDayMenu.ItemIndex;
  ShowProductColor(iSelectedItem);
  seGramms.Text:= FloatToStr(DayProductArray[iSelectedItem].Gramms);
  seProts.Text:=FloatToStr(DayProductArray[iSelectedItem].Prots );
  seCarbons.Text:=FloatToStr(DayProductArray[iSelectedItem].Carbons );
  seFats.Text:=FloatToStr(DayProductArray[iSelectedItem].Fats );
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
  var ProductArray: TProdInfoArr);
var
  ArrLength: Integer;
begin
  ProductList.Items.Clear;
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

procedure  TCalculateForm.AddUserInfo;
var
  SQLText: string;
  ArrayLength: Integer;
begin
  cbbUsers.Items.Clear;
  SQLText:='SELECT ui.ID, '+
	   'ui.Name, '+
	   'ui.Proteins, '+
	   'ui.Carbohydrates, '+
	   'ui.Fats, '+
	   'ui.CalWLossMin, '+
	   'ui.CalWLossMax '+
  'FROM UserInfo AS ui';
  qryMSSQL.SQL.Text:= SQLText;
  qryMSSQL.Open;
  qryMSSQL.First;
  while not qryMSSQL.Eof do
  begin
    ArrayLength:= Length(UsersInfo);
    Inc(ArrayLength);
    SetLength(UsersInfo, ArrayLength);
    UsersInfo[ArrayLength-1].ID:= qryMSSQL.FieldByName('ID').AsInteger;
    UsersInfo[ArrayLength-1].Name:= qryMSSQL.FieldByName('Name').AsString;
    UsersInfo[ArrayLength-1].CalsMin:= qryMSSQL.FieldByName('CalWLossMin').AsFloat;
    UsersInfo[ArrayLength-1].CalsMax:= qryMSSQL.FieldByName('CalWLossMax').AsFloat;
    UsersInfo[ArrayLength-1].Prots:= qryMSSQL.FieldByName('Proteins').AsFloat;
    UsersInfo[ArrayLength-1].Carbons:= qryMSSQL.FieldByName('Carbohydrates').AsFloat;
    UsersInfo[ArrayLength-1].Fats:= qryMSSQL.FieldByName('Fats').AsFloat;
    cbbUsers.Items.Add(UsersInfo[ArrayLength-1].Name);
    qryMSSQL.Next;
  end;
  qryMSSQL.Close;
  if cbbUsers.Items.Count>0 then
    cbbUsers.ItemIndex:=0;
end;

procedure TCalculateForm.btnAddCarbonsClick(Sender: TObject);
var
  ProductCount: Integer;
  i: Integer;
  ProductCurrentValue: Real;
  ProductLastVestige: Real;
  LastAddProduct: Real;
  EditedProductValue: Real;
begin
  if (lstCarbons.ItemIndex>-1) and (SelectedUserID <> -1) then
  begin
    if not CheckIdInArray(CarbonsProductArray[lstCarbons.ItemIndex].ID) then
    begin
      AddProductToDayMenu(CarbonsProductArray, lstCarbons);
      // Расчет добавляемого продукта
      // добавляется n-ая часть от нормы. N - все количество продуктов
      ProductCount:= Length( DayProductArray );
      DayProductArray[Length(DayProductArray)-1].Gramms:=
        SelectedUserCarbons / ( ProductCount * CarbonsProductArray[lstCarbons.ItemIndex].Carbons );
      DayProductArray[Length(DayProductArray)-1].Prots:=
        CarbonsProductArray[lstCarbons.ItemIndex].Prots * DayProductArray[Length(DayProductArray)-1].Gramms;
      DayProductArray[Length(DayProductArray)-1].Carbons:=
        CarbonsProductArray[lstCarbons.ItemIndex].Carbons * DayProductArray[Length(DayProductArray)-1].Gramms;
      DayProductArray[Length(DayProductArray)-1].Fats:=
        CarbonsProductArray[lstCarbons.ItemIndex].Fats * DayProductArray[Length(DayProductArray)-1].Gramms;
      DayProductArray[Length(DayProductArray)-1].Cals :=
        CarbonsProductArray[lstCarbons.ItemIndex].Cals * DayProductArray[Length(DayProductArray)-1].Gramms;
      // Изменение значений, которые есть в списке
      if ProductCount > 1 then
      begin
        LastAddProduct:=DayProductArray[Length(DayProductArray)-1].Carbons;
        ProductLastVestige:= SelectedUserCarbons - LastAddProduct;
        for I := 0 to Length( DayProductArray ) - 2 do
        begin
          DayProductArray[i].Carbons:=
            (ProductLastVestige * DayProductArray[i].Carbons)/ SelectedUserCarbons;
          DayProductArray[i].Gramms:=
            (ProductLastVestige * DayProductArray[i].Gramms)/ SelectedUserCarbons;
          DayProductArray[i].Prots:=
            (ProductLastVestige * DayProductArray[i].Prots)/ SelectedUserCarbons;
          DayProductArray[i].Fats:=
            (ProductLastVestige * DayProductArray[i].Fats)/ SelectedUserCarbons;
          DayProductArray[i].Cals:=
            (ProductLastVestige * DayProductArray[i].Cals)/ SelectedUserCarbons;
        end;
      end;
      // Запись в эдиты полученных значений
      seGramms.Text:= FloatToStr(DayProductArray[Length(DayProductArray)-1].Gramms);
      seProts.Text:=FloatToStr(DayProductArray[Length(DayProductArray)-1].Prots );
      seCarbons.Text:=FloatToStr(DayProductArray[Length(DayProductArray)-1].Carbons );
      seFats.Text:=FloatToStr(DayProductArray[Length(DayProductArray)-1].Fats );
    end;
    UpdateDiagrams;
  end;
end;

procedure TCalculateForm.btnAddFatsClick(Sender: TObject);
begin
  if (lstFats.ItemIndex>-1) and (SelectedUserID <> -1) then
  begin
    if not CheckIdInArray(FatsProductArray[lstFats.ItemIndex].ID) then
    AddProductToDayMenu(FatsProductArray, lstFats);
  end;
end;

procedure TCalculateForm.btnAddProtClick(Sender: TObject);
begin
  if (lstProteins.ItemIndex>-1) and (SelectedUserID <> -1) then
  begin
    if not CheckIdInArray(ProtsProductArray[lstProteins.ItemIndex].ID) then
    AddProductToDayMenu(ProtsProductArray, lstProteins);
  end;
end;

procedure TCalculateForm.cbbUsersChange(Sender: TObject);
begin
  SelectedUserID:= UsersInfo[cbbUsers.ItemIndex].ID;
  SelectedMinCals:= UsersInfo[cbbUsers.ItemIndex].CalsMin;
  SelectedMaxCals:= UsersInfo[cbbUsers.ItemIndex].CalsMax;
  edtUserCals.Text:= FloatToStr( UsersInfo[cbbUsers.ItemIndex].CalsMax );
  SelectedUserProts:= UsersInfo[cbbUsers.ItemIndex].Prots;
  edtUserProteins.Text:= FloatToStr( UsersInfo[cbbUsers.ItemIndex].Prots );
  SelectedUserCarbons:= UsersInfo[cbbUsers.ItemIndex].Carbons;
  edtUserCarbons.Text:= FloatToStr( UsersInfo[cbbUsers.ItemIndex].Carbons );
  SelectedUserFats:= UsersInfo[cbbUsers.ItemIndex].Fats;
  edtUserFats.Text:= FloatToStr( UsersInfo[cbbUsers.ItemIndex].Fats );
end;

procedure TCalculateForm.SetStartColors;
begin
  imgCals.Canvas.Brush.Color:= clWhite;
  imgCals.Canvas.Rectangle(0,0, imgCals.Width, imgCals.Height);
  imgCarbons.Canvas.Brush.Color:= clWhite;
  imgCarbons.Canvas.Rectangle(0,0, imgCarbons.Width, imgCarbons.Height);
  imgProts.Canvas.Brush.Color:= clWhite;
  imgProts.Canvas.Rectangle(0,0, imgProts.Width, imgProts.Height);
  imgFats.Canvas.Brush.Color:= clWhite;
  imgFats.Canvas.Rectangle(0,0, imgFats.Width, imgFats.Height);
end;

procedure TCalculateForm.ShowProductColor(iSelectedProduct: Integer);
begin
  imgProduct.Canvas.Brush.Color:= DayProductArray[iSelectedProduct].Color;
  imgProduct.Canvas.Rectangle(0,0,imgProduct.Width, imgProduct.Height);
end;

procedure TCalculateForm.AddProductToDayMenu(NutrProductArray: TProdInfoArr;
  ProductList:TListBox);
var
  ArrayLength:Integer;
  iRed: Byte;
  iGreen: Byte;
  iBlue: Byte;
begin
  ArrayLength:= Length(DayProductArray);
  inc(ArrayLength);
  SetLength(DayProductArray, ArrayLength);
  DayProductArray[ ArrayLength-1 ].ID:= NutrProductArray[ ProductList.ItemIndex ].ID;
  DayProductArray[ ArrayLength-1 ].Name:= NutrProductArray[ ProductList.ItemIndex ].Name;
  iRed:= Random (255);
  iGreen:= Random (255);
  iBlue:= Random (255);
  DayProductArray[ ArrayLength-1 ].Color:= RGB(iRed, iGreen, iBlue );
  lstDayMenu.Items.Add(DayProductArray[ ArrayLength-1 ].Name);
  lstDayMenu.ItemIndex:= lstDayMenu.Items.Count - 1;
  ShowProductColor(ArrayLength-1);
end;

function TCalculateForm.CheckIdInArray(ProductID: Integer):Boolean;
var
  i: Integer;
begin
  for I := 0 to Length(DayProductArray)-1 do
  if ProductID=DayProductArray[i].ID then
  begin
    Result:= True;
    Exit;
  end
  else
  Result:=False;
end;

procedure TCalculateForm.UpdateDiagrams;
var
  i: Integer;
  CarbonStartWidth: Integer;
  CarbonRecWidth: Integer;
  ProtsStartWidth: Integer;
  ProtsRecWidth: Integer;
  FatsStartWidth: Integer;
  FatsRecWidth: Integer;
  CalsStartWidth: Integer;
  CalsRecWidth: Integer;
begin
  //убираем окантовку
  imgCarbons.Canvas.Pen.Style:=psClear;
  imgProts.Canvas.Pen.Style:=psClear;
  imgFats.Canvas.Pen.Style:=psClear;
  // закрашиваем прямоугольник белым
  imgCarbons.Canvas.Brush.Color:=clWhite;
  imgProts.Canvas.Brush.Color:=clWhite;
  imgFats.Canvas.Brush.Color:=clWhite;
  // рисуем белый прямоугольник
  imgCarbons.Canvas.Rectangle(1,1,imgCarbons.Width-1, imgCarbons.Height-1);
  imgProts.Canvas.Rectangle(1,1,imgProts.Width-1, imgProts.Height-1);
  imgFats.Canvas.Rectangle(1,1,imgFats.Width-1, imgFats.Height-1);

  CarbonStartWidth:=1;
  ProtsStartWidth:=1;
  FatsStartWidth:=1;
  for I := 0 to Length(DayProductArray)-1 do
  begin

    //DayProductArray[i].Prots;
    // Расчет прямоугольников для углеводов
    CarbonRecWidth:=
      Round(((imgCarbons.Width-1) * DayProductArray[i].Carbons) / SelectedUserCarbons);
    imgCarbons.Canvas.Brush.Color:=DayProductArray[i].Color;
    imgCarbons.Canvas.Rectangle(CarbonStartWidth, 1,
      CarbonRecWidth + CarbonStartWidth, imgCarbons.Height);
    CarbonStartWidth := CarbonStartWidth + CarbonRecWidth;

    // Расчет прямоугольников для белков
    ProtsRecWidth:=
      Round(( (imgProts.Width-1) * DayProductArray[i].Prots ) / SelectedUserProts );
    imgProts.Canvas.Brush.Color:= DayProductArray[i].Color;
    imgProts.Canvas.Rectangle(ProtsStartWidth, 1,
      ProtsStartWidth + ProtsRecWidth, imgProts.Height);
    ProtsStartWidth:=ProtsStartWidth+ ProtsRecWidth;

    // Расчет прямоугольников для жиров
    FatsRecWidth:=
      Round(( (imgFats.Width-1) * DayProductArray[i].Fats ) / SelectedUserFats );
    imgFats.Canvas.Brush.Color:= DayProductArray[i].Color;
    imgFats.Canvas.Rectangle(FatsStartWidth, 1,
      FatsStartWidth + FatsRecWidth, imgFats.Height);
    FatsStartWidth:=FatsStartWidth+ FatsRecWidth;
    //DayProductArray[i].Fats;
    //DayProductArray[i].Cals;
  end;

end;

end.
