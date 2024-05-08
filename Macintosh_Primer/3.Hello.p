program Hello2;
    const
        BASE_RES_ID = 400;
        HORIZONTAL_PIXEL = 30;
        VERTICAL_PIXEL = 50;
{- -------------> Windowlnit <--}
procedure Windowlnit;
    var
        helloWindow: WindowPtr;
begin
    helloWindow := GetNewWindow<BASE_RES_ID, nil,
    WindowPtr(-1));
    ShowWindow(helloWindow);
    SetPort(helloWindow);
    MoveTo(HORIZONTAL_PIXEL, VERTICAL_PIXEL);
    DrawString('Hello, world!');
end;
{----------------> Hello2 <--}
begin
    Windowlnit;
    while (not Button) do
    begin
    end;
end.