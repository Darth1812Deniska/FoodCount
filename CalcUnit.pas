unit CalcUnit;
{!
================================================================================
Модуль расчета меню
================================================================================
!}


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
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
    // ID Выбранного пользователя
    SelectedUserID: Integer;
    // Минимальное количество углеводов потребляемое в день для пользователя
    SelectedMinCals: Real;
    // Максимальное количество углеводов потребляемых в день для пользователя
    SelectedMaxCals: Real;
    // Необходимое количество белков для пользователя
    SelectedUserProts:Real;
    // Необходимое количество углеводов для пользователя
    SelectedUserCarbons: Real;
    // Необходимое количество жиров для пользователя
    SelectedUserFats: Real;
    // Добавление продукта в список углеводов
    procedure AddCarbonProducts;
    // Добавление продукта в список белков
    procedure AddProteinProducts;
    // Добавление продукта в список жиров
    procedure AddFatProducts;
    //
    procedure AddProduct(SQLText: string; ProductList: TListBox;
      var ProductArray: TProdInfoArr);
    procedure AddUserInfo;
    procedure SetStartColors;
    procedure ShowProductColor(iSelectedProduct: Integer);
    procedure AddProductToDayMenu(NutrProductArray: TProdInfoArr;
      ProductList:TListBox);
    // Перерисовка диаграмм
    procedure UpdateDiagrams;
    // Проверка нахождения продукта в дневном меню
    function CheckIdInArray(ProductID: Integer):Boolean;
    // Проверка заполненности нормы углеводов
    function CarbonsIsFull(out SumProductWeigth:Real):Boolean;
    // Проверка заполненности нормы белков
    function ProteinsIsFull(out SumProductWeigth:Real):Boolean;
    // Проверка заполненности нормы жиров
    function FatsIsFull(out SumProductWeigth:Real):Boolean;
    // Вычисление оставшейся нормы углеводов
    function FindCarbonsVestige(SumProductWeigth:Real):Real;
    // Вычисление оставшейся нормы белков
    function FindProteinsVestige(SumProductWeigth:Real):Real;
    // Вычисление оставшейся нормы жиров
    function FindFatsVestige(SumProductWeigth:Real):Real;
    // Вычисление оставшейся нормы для любого нутриента
    function FindProductVestige(MaxProductWeigth:Real; SumProductWeigth:Real):Real;
    // Вычисление n-ой части от общего количества нутриента
    function CalculateNutrientNPortion(NutrientWeigth: Real; ProductCount: Integer): Real;
    // Вычисление n-ой части от всех углеводов
    function CalculateCarbonNPortion (ProductCount: Integer): Real;
    // Вычисление n-ой части от всех белков
    function CalculateProtNPortion (ProductCount: Integer): Real;
    // Вычисление n-ой части от всех жиров
    function CalculateFatNPortion (ProductCount: Integer): Real;
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
  SumProductWeigth: Real;
begin
  if (lstCarbons.ItemIndex>-1) and (SelectedUserID <> -1) then
  begin
    if not CheckIdInArray(CarbonsProductArray[lstCarbons.ItemIndex].ID) then
    begin
      AddProductToDayMenu(CarbonsProductArray, lstCarbons);
      // Расчет добавляемого продукта
      // Вычисляем количество
      ProductCount:= Length( DayProductArray );
      // Проверка на полноту
      if not CarbonsIsFull(SumProductWeigth) then
        //если не заполнено все, то вычисляем остаток и n-ую часть
        begin
          // Определяем количество добавляемых углеводов
          if FindCarbonsVestige(SumProductWeigth) >= CalculateCarbonNPortion(ProductCount) then
            DayProductArray[Length(DayProductArray)-1].Carbons:=
              FindCarbonsVestige(SumProductWeigth)
          else
            DayProductArray[Length(DayProductArray)-1].Carbons:=
              CalculateCarbonNPortion(ProductCount);
        end
        // Вычисляем при полноте
      else
        // если заполнено то n-ую часть
        begin
          DayProductArray[Length(DayProductArray)-1].Carbons:=
              CalculateCarbonNPortion(ProductCount);
        end;
      // Вычисляем граммовку продукта
      DayProductArray[Length(DayProductArray)-1].Gramms:=
        DayProductArray[Length(DayProductArray)-1].Carbons /
        CarbonsProductArray[lstCarbons.ItemIndex].Carbons;
      // Расчет всех нутриентов
      DayProductArray[Length(DayProductArray)-1].Prots:=
        CarbonsProductArray[lstCarbons.ItemIndex].Prots *
        DayProductArray[Length(DayProductArray)-1].Gramms;
      DayProductArray[Length(DayProductArray)-1].Fats:=
        CarbonsProductArray[lstCarbons.ItemIndex].Fats *
        DayProductArray[Length(DayProductArray)-1].Gramms;
      DayProductArray[Length(DayProductArray)-1].Cals :=
        CarbonsProductArray[lstCarbons.ItemIndex].Cals *
        DayProductArray[Length(DayProductArray)-1].Gramms;
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
var
  ProductCount: Integer;
  i: Integer;
  ProductLastVestige: Real;
  LastAddProduct: Real;
  EditedProductValue: Real;
  SumProductWeigth: Real;

  // промежуточные флаги
  FIFFlag: Boolean;
  FIV: Real;
begin
  if (lstFats.ItemIndex>-1) and (SelectedUserID <> -1) then
  begin

    if not CheckIdInArray(FatsProductArray[lstFats.ItemIndex].ID) then
    begin
      AddProductToDayMenu(FatsProductArray, lstFats);
      ProductCount:= Length( DayProductArray );
      FIFFlag:= FatsIsFull(SumProductWeigth);
      if not FatsIsFull(SumProductWeigth) then
        //если не заполнено все, то вычисляем остаток и n-ую часть
        begin
          // Определяем количество добавляемых углеводов
          FIV:= FindFatsVestige(SumProductWeigth);
          if FindFatsVestige(SumProductWeigth) >= CalculateFatNPortion(ProductCount) then
            DayProductArray[Length(DayProductArray)-1].Fats:=
              FindFatsVestige(SumProductWeigth)
          else
            DayProductArray[Length(DayProductArray)-1].Fats:=
              CalculateFatNPortion(ProductCount);
        end
        // Вычисляем при полноте
      else
        // если заполнено то n-ую часть
        begin
          DayProductArray[Length(DayProductArray)-1].Fats:=
            CalculateFatNPortion(ProductCount);
        end;
      DayProductArray[Length(DayProductArray)-1].Gramms:=
        DayProductArray[Length(DayProductArray)-1].Fats /
        FatsProductArray[lstFats.ItemIndex].Fats;

      DayProductArray[Length(DayProductArray)-1].Prots:=
        FatsProductArray[lstFats.ItemIndex].Prots *
        DayProductArray[Length(DayProductArray)-1].Gramms;
      DayProductArray[Length(DayProductArray)-1].Carbons:=
        FatsProductArray[lstFats.ItemIndex].Carbons *
        DayProductArray[Length(DayProductArray)-1].Gramms;
      DayProductArray[Length(DayProductArray)-1].Cals :=
        FatsProductArray[lstFats.ItemIndex].Cals *
        DayProductArray[Length(DayProductArray)-1].Gramms;
      //if True then

      // Изменение значений, которые есть в списке
      if ProductCount > 1 then
      begin
        LastAddProduct:=DayProductArray[Length(DayProductArray)-1].Fats;
        ProductLastVestige:= SelectedUserFats - LastAddProduct;
        for I := 0 to Length( DayProductArray ) - 2 do
        begin
          DayProductArray[i].Carbons:=
            (ProductLastVestige * DayProductArray[i].Carbons)/ SelectedUserFats;
          DayProductArray[i].Gramms:=
            (ProductLastVestige * DayProductArray[i].Gramms)/ SelectedUserFats;
          DayProductArray[i].Prots:=
            (ProductLastVestige * DayProductArray[i].Prots)/ SelectedUserFats;
          DayProductArray[i].Fats:=
            (ProductLastVestige * DayProductArray[i].Fats)/ SelectedUserFats;
          DayProductArray[i].Cals:=
            (ProductLastVestige * DayProductArray[i].Cals)/ SelectedUserFats;
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

procedure TCalculateForm.btnAddProtClick(Sender: TObject);
var
  ProductCount: Integer;
  i: Integer;
  ProductCurrentValue: Real;
  ProductLastVestige: Real;
  LastAddProduct: Real;
  EditedProductValue: Real;
  SumProductWeigth: Real;
begin
  if (lstProteins.ItemIndex>-1) and (SelectedUserID <> -1) then
  begin
    if not CheckIdInArray(ProtsProductArray[lstProteins.ItemIndex].ID) then
    begin
      AddProductToDayMenu(ProtsProductArray, lstProteins);
    end;

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
  // Продукту присваивается уникальный цветовой индикатор
  iRed:= Random (255);
  iGreen:= Random (255);
  iBlue:= Random (255);
  DayProductArray[ ArrayLength-1 ].Color:= RGB(iRed, iGreen, iBlue );
  // в лист добавляется последний добавленный продукт
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
  imgCarbons.Canvas.Pen.Width:=0;
  imgProts.Canvas.Pen.Width:=0;
  imgFats.Canvas.Pen.Width:=0;
  // закрашиваем прямоугольник белым
  imgCarbons.Canvas.Brush.Color:=clWhite;
  imgProts.Canvas.Brush.Color:=clWhite;
  imgFats.Canvas.Brush.Color:=clWhite;
  // рисуем белый прямоугольник
  imgCarbons.Canvas.Rectangle(1,1,imgCarbons.Width, imgCarbons.Height);
  imgProts.Canvas.Rectangle(1,1,imgProts.Width, imgProts.Height);
  imgFats.Canvas.Rectangle(1,1,imgFats.Width, imgFats.Height);

  CarbonStartWidth:=2;
  ProtsStartWidth:=2;
  FatsStartWidth:=2;
  for I := 0 to Length(DayProductArray)-1 do
  begin

    //DayProductArray[i].Prots;
    // Расчет прямоугольников для углеводов
    CarbonRecWidth:=
      Round(((imgCarbons.Width-2) * DayProductArray[i].Carbons) / SelectedUserCarbons);
    imgCarbons.Canvas.Brush.Color:=DayProductArray[i].Color;
    imgCarbons.Canvas.Rectangle(CarbonStartWidth-1, 1,
      CarbonRecWidth + CarbonStartWidth, imgCarbons.Height);
    CarbonStartWidth := CarbonStartWidth + CarbonRecWidth;

    // Расчет прямоугольников для белков
    ProtsRecWidth:=
      Round(( (imgProts.Width-2) * DayProductArray[i].Prots ) / SelectedUserProts );
    imgProts.Canvas.Brush.Color:= DayProductArray[i].Color;
    imgProts.Canvas.Rectangle(ProtsStartWidth-1, 1,
      ProtsStartWidth + ProtsRecWidth, imgProts.Height);
    ProtsStartWidth:=ProtsStartWidth+ ProtsRecWidth;

    // Расчет прямоугольников для жиров
    FatsRecWidth:=
      Round(( (imgFats.Width-2) * DayProductArray[i].Fats ) / SelectedUserFats );
    imgFats.Canvas.Brush.Color:= DayProductArray[i].Color;
    imgFats.Canvas.Rectangle(FatsStartWidth-1, 1,
      FatsStartWidth + FatsRecWidth, imgFats.Height);
    FatsStartWidth:=FatsStartWidth+ FatsRecWidth;

  end;

end;

function TCalculateForm.CarbonsIsFull(out SumProductWeigth:Real):Boolean;
var
  i: Integer;
begin
  SumProductWeigth:=0;
  for I := 0 to Length (DayProductArray) - 1 do
  begin
    SumProductWeigth:= SumProductWeigth + DayProductArray[i].Carbons;
  end;
  if SumProductWeigth < SelectedUserCarbons then
    Result:= False
  else
    Result:= True;
end;

function TCalculateForm.ProteinsIsFull(out SumProductWeigth:Real):Boolean;
var
  i: Integer;
begin
  SumProductWeigth:=0;
  for I := 0 to Length (DayProductArray) - 1 do
  begin
    SumProductWeigth:= SumProductWeigth + DayProductArray[i].Prots;
  end;
  if SumProductWeigth < SelectedUserProts then
    Result:= False
  else
    Result:= True;
end;

function TCalculateForm.FatsIsFull(out SumProductWeigth:Real):Boolean;
var
  i: Integer;
begin
  SumProductWeigth:=0;
  for I := 0 to Length (DayProductArray) - 1 do
  begin
    SumProductWeigth:= SumProductWeigth + DayProductArray[i].Fats;
  end;
  if SumProductWeigth < SelectedUserFats then
    Result:= False
  else
    Result:= True;
end;

function TCalculateForm.FindCarbonsVestige(SumProductWeigth:Real):Real;
begin
  Result:= FindProductVestige(SelectedUserCarbons, SumProductWeigth);
end;

function TCalculateForm.FindProteinsVestige(SumProductWeigth:Real):Real;
begin
  Result:= FindProductVestige(SelectedUserProts, SumProductWeigth);
end;

function TCalculateForm.FindFatsVestige(SumProductWeigth:Real):Real;
begin
  Result:= FindProductVestige(SelectedUserFats, SumProductWeigth);
end;

function TCalculateForm.FindProductVestige(MaxProductWeigth: Real;
  SumProductWeigth: Real):Real;
begin
  if SumProductWeigth < MaxProductWeigth then
    Result:= MaxProductWeigth - SumProductWeigth
  else
    Result:= 0;
end;

function TCalculateForm.CalculateNutrientNPortion ( NutrientWeigth: Real;
                                                    ProductCount: Integer): Real;
begin
  Result:= NutrientWeigth / ProductCount;
end;

function TCalculateForm.CalculateCarbonNPortion(ProductCount: Integer): Real;
begin
  Result:= CalculateNutrientNPortion( SelectedUserCarbons, ProductCount );
end;

function TCalculateForm.CalculateProtNPortion(ProductCount: Integer): Real;
begin
  Result:= CalculateNutrientNPortion( SelectedUserProts, ProductCount );
end;

function TCalculateForm.CalculateFatNPortion(ProductCount: Integer): Real;
begin
  Result:= CalculateNutrientNPortion( SelectedUserFats, ProductCount );
end;

end.
