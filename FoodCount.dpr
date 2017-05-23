program FoodCount;

uses
  Vcl.Forms,
  AddUser in 'AddUser.pas' {AddUserForm},
  AddFood in 'AddFood.pas' {AddFoodForm},
  MainUnit in 'MainUnit.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAddUserForm, AddUserForm);
  Application.CreateForm(TAddFoodForm, AddFoodForm);
  Application.Run;
end.
