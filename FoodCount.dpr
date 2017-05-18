program FoodCount;

uses
  Vcl.Forms,
  AddUser in 'AddUser.pas' {AddUserForm},
  AddFood in 'AddFood.pas' {AddFoodForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAddUserForm, AddUserForm);
  Application.CreateForm(TAddFoodForm, AddFoodForm);
  Application.Run;
end.
