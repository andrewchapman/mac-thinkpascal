program Mondrian;
    const
        BASE_RES ID = 400;
    var
        gDrawWindow: WindowPtr;
        gfillColor: LONGINT;

{-----------------> Randomize <--}
    function Randomize (range: INTEGER): INTEGER;
        var
            rawResult: LONGINT;
    begin
        rawResult := Random;
        rawResult .- abs(rawResult);
        Randomize .- (rawResult * range) div 32768;
    end;

{----------------> RandomRect <--}
    procedure RandomRect (var myRect: Rect; boundingWindow: WindowPtr);
        begin
            myRect.Left := Randomize(boundingWindowA.portRect.right -
            boundingWindowA.portRect.Left);
            myRect.right := Randomize(boundingWindowA.portRect.right -
            boundingWindowA.portRect.Left);
            myRect.top := Randomize(boundingWindowA.portRect.bottom -
            boundingWindowA.portRect.top);
            myRect.bottom := Randomize(boundingWindowA.
                                        portRect.bottom -
                                        boundingWindowA.
                                        portRect.top);
        end;

{----------------> DrawRandomRect <--}
    procedure DrawRandomRect;
        var
            myRect: Rect;
    begin
        RandomRect(myRect, gDrawWindow);
        ForeColor(gfiLLColor);
        PaintOval(myRect);
    end;

 {----------------> Mainloop <--}
    procedure Mainloop;
    begin
        GetDateTime(randSeed);
        gFillColor := blackColor;
        while (not Button) do
            begin
                DrawRandomRect;
                if CgFillColor = blackColor) then
                    gFillColor := whiteColor
                else
                    gFillColor .- blackColor
            end;
    end;

{----------------> Windowlnit <--}
    procedure Windowlnit;
    begin
        gDrawWindow := GetNewWindowCBASE_RES_ID, nil,
        WindowPtr(-1));
        ShowWindowCgDrawWindow);
        SetPort(gDrawWindow);
    end;

{----------------> Mondrian <--}
begin
    Windowlnit;
    Main loop;
end.   