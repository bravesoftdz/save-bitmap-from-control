unit uControlCapture;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Controls, Graphs, LCLIntf, LCLType;

procedure SaveContainerAsImage(Container: TWinControl; Path: string);

implementation

procedure SaveContainerAsImage(Container: TWinControl; Path: string);
var
  MyDC: HDC;
  MyBitmap: TBitmap;
begin
  MyDC:= GetDC(Container.Handle);
  MyBitmap:= TBitmap.Create;
  try
    MyBitmap.LoadFromDevice(MyDC);
    MyBitmap.SaveToFile(Path);
  finally
    ReleaseDC(Container.Handle, MyDC);
    FreeAndNil(MyBitmap);
  end;
end;

end.
