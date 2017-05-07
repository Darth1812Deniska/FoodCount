object AddUserForm: TAddUserForm
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 368
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpAddInfo: TGroupBox
    Left = 8
    Top = 8
    Width = 153
    Height = 352
    Caption = #1042#1074#1086#1076' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
    TabOrder = 0
    object lblActKof: TLabel
      Left = 3
      Top = 268
      Width = 141
      Height = 13
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1086#1076#1074#1080#1078#1085#1086#1089#1090#1080
    end
    object lblAge: TLabel
      Left = 3
      Top = 130
      Width = 40
      Height = 13
      Caption = #1042#1086#1079#1088#1072#1089#1090
    end
    object lblHeight: TLabel
      Left = 3
      Top = 176
      Width = 23
      Height = 13
      Caption = #1056#1086#1089#1090
    end
    object lblName: TLabel
      Left = 3
      Top = 16
      Width = 93
      Height = 13
      Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    end
    object lblWeight: TLabel
      Left = 3
      Top = 222
      Width = 17
      Height = 13
      Caption = #1042#1077#1089
    end
    object btnSolve: TButton
      Left = 73
      Top = 314
      Width = 75
      Height = 25
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100
      TabOrder = 6
      OnClick = btnSolveClick
    end
    object cbbActKof: TComboBox
      Left = 3
      Top = 287
      Width = 145
      Height = 21
      TabOrder = 5
      Text = '1'
      Items.Strings = (
        '1'
        '1,2'
        '1,37'
        '1,45'
        '1,55'
        '1,65'
        '1,725'
        '1,9')
    end
    object edtAge: TEdit
      Left = 3
      Top = 149
      Width = 121
      Height = 21
      TabOrder = 2
      TextHint = #1042#1086#1079#1088#1072#1089#1090
    end
    object edtHeight: TEdit
      Left = 3
      Top = 195
      Width = 121
      Height = 21
      TabOrder = 3
      TextHint = #1056#1086#1089#1090
    end
    object edtName: TEdit
      Left = 3
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 0
      TextHint = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    end
    object edtWeight: TEdit
      Left = 3
      Top = 241
      Width = 121
      Height = 21
      TabOrder = 4
      TextHint = #1042#1077#1089
    end
    object rgSex: TRadioGroup
      Left = 3
      Top = 62
      Width = 121
      Height = 62
      Caption = #1055#1086#1083
      ItemIndex = 0
      Items.Strings = (
        #1052#1091#1078#1089#1082#1086#1081
        #1046#1077#1085#1089#1082#1080#1081)
      TabOrder = 1
    end
  end
  object grpResults: TGroupBox
    Left = 167
    Top = 8
    Width = 202
    Height = 352
    Caption = #1042#1072#1096#1080' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099
    TabOrder = 1
    object lblBaseCalories: TLabel
      Left = 3
      Top = 16
      Width = 159
      Height = 13
      Caption = #1041#1072#1079#1086#1074#1099#1081' '#1086#1073#1098#1077#1084' '#1082#1072#1083#1086#1088#1080#1081' '#1074' '#1076#1077#1085#1100
    end
    object lblRequiredCal: TLabel
      Left = 3
      Top = 62
      Width = 186
      Height = 13
      Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1099#1081' '#1086#1073#1098#1077#1084' '#1082#1072#1083#1086#1088#1080#1081' '#1074' '#1076#1077#1085#1100
    end
    object lblWLoss: TLabel
      Left = 3
      Top = 108
      Width = 178
      Height = 13
      Caption = #1054#1073#1098#1077#1084' '#1082#1072#1083#1086#1088#1080#1081' '#1076#1083#1103' '#1089#1085#1080#1078#1077#1085#1080#1103' '#1074#1077#1089#1072
    end
    object lblProteins: TLabel
      Left = 3
      Top = 154
      Width = 30
      Height = 13
      Caption = #1041#1077#1083#1082#1080
    end
    object lblFats: TLabel
      Left = 3
      Top = 200
      Width = 30
      Height = 13
      Caption = #1046#1080#1088#1099
    end
    object lblCarbons: TLabel
      Left = 3
      Top = 246
      Width = 51
      Height = 13
      Caption = #1059#1075#1083#1077#1074#1086#1076#1099
    end
    object btnSaveResults: TButton
      Left = 58
      Top = 314
      Width = 135
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1099
      TabOrder = 6
    end
    object edtBaseCalories: TEdit
      Left = 3
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtRequiredCal: TEdit
      Left = 3
      Top = 81
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtWLoss: TEdit
      Left = 3
      Top = 127
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtProteins: TEdit
      Left = 3
      Top = 173
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtFats: TEdit
      Left = 3
      Top = 219
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edtCarbons: TEdit
      Left = 3
      Top = 265
      Width = 121
      Height = 21
      TabOrder = 5
    end
  end
  object conMSSQL: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=FoodProj;Data Source=DENIS\MSSQL14DD'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 336
    Top = 24
  end
  object qryMSSQL: TADOQuery
    Connection = conMSSQL
    Parameters = <>
    Left = 335
    Top = 72
  end
end
