object AddFoodForm: TAddFoodForm
  Left = 0
  Top = 0
  Caption = 'AddFoodForm'
  ClientHeight = 291
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblFoodGroup: TLabel
    Left = 8
    Top = 211
    Width = 70
    Height = 13
    Caption = #1058#1080#1087' '#1087#1088#1086#1076#1091#1082#1090#1072
  end
  object lbledtFoodName: TLabeledEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    EditLabel.Width = 125
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1076#1091#1082#1090#1072
    TabOrder = 0
  end
  object lbledtProts: TLabeledEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = #1041#1077#1083#1082#1080
    TabOrder = 1
  end
  object lbledtFats: TLabeledEdit
    Left = 8
    Top = 104
    Width = 121
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = #1046#1080#1088#1099
    TabOrder = 2
  end
  object lbledtCarbons: TLabeledEdit
    Left = 8
    Top = 144
    Width = 121
    Height = 21
    EditLabel.Width = 51
    EditLabel.Height = 13
    EditLabel.Caption = #1059#1075#1083#1077#1074#1086#1076#1099
    TabOrder = 3
  end
  object lbledtKCal: TLabeledEdit
    Left = 8
    Top = 184
    Width = 121
    Height = 21
    EditLabel.Width = 43
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1072#1083#1086#1088#1080#1080
    TabOrder = 4
  end
  object cbbFoodGroup: TComboBox
    Left = 8
    Top = 230
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object btnAddFood: TButton
    Left = 127
    Top = 257
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1076#1091#1082#1090
    TabOrder = 6
    OnClick = btnAddFoodClick
  end
  object rgRatio: TRadioGroup
    Left = 135
    Top = 8
    Width = 105
    Height = 61
    Caption = #1044#1086#1083#1103
    ItemIndex = 0
    Items.Strings = (
      #1053#1072' 1 '#1075#1088#1072#1084#1084
      #1053#1072' 100 '#1075#1088#1072#1084#1084)
    TabOrder = 7
  end
  object conMSSQL: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=FoodProj;Data Source=DENIS\MSSQL14DD'
    Provider = 'SQLOLEDB.1'
    Left = 176
    Top = 80
  end
  object cmdMSSQL: TADOCommand
    Connection = conMSSQL
    Parameters = <>
    Left = 216
    Top = 80
  end
end
