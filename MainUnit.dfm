object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1055#1086#1076#1089#1095#1077#1090' '#1077#1076#1099
  ClientHeight = 235
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnAddUser: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 49
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    WordWrap = True
    OnClick = btnAddUserClick
  end
  object btnAddFoodGroup: TButton
    Left = 8
    Top = 63
    Width = 113
    Height = 65
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091' '#1087#1088#1086#1076#1091#1082#1090#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    WordWrap = True
    OnClick = btnAddFoodGroupClick
  end
  object btnAddFood: TButton
    Left = 8
    Top = 134
    Width = 113
    Height = 43
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1076#1091#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    WordWrap = True
    OnClick = btnAddFoodClick
  end
  object btnCalcul: TButton
    Left = 8
    Top = 183
    Width = 113
    Height = 42
    Caption = #1055#1088#1086#1080#1079#1074#1077#1089#1090#1080' '#1088#1072#1089#1095#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    WordWrap = True
    OnClick = btnCalculClick
  end
end
