program FlyingLine;
    const
        NUM_LINES = 50;
        NIL_STRING = '';
        NIL_TITLE = '';
        VISIBLE = TRUE;
        NO_GO_AWAY = FALSE;
        NIL_REF_CON = O;
    type
        IntPtr = ^INTEGER;
    var
        gLineWindow: WindowPtr;
        gLines: array[1 .. NUM_LINES] of Rect;
        gDeltaTop, gDeltaBottom: INTEGER;
        gDeltaLeft, gDeltaRight: INTEGER;
        gOldMBarHeight: INTEGER;
        gMBarHeightPtr: IntPtr;

{----------------> DrawLine <--}
    procedure DrawLine (i: INTEGER);
    begin
        MoveTo(gLines[iJ.Left, gLines[iJ.top);
        LineTo(gLines[iJ.right, gLines[iJ.bottom);
    end;

{----------------> RecalcLine <--}
    procedure RecalcLine (i: INTEGER);
    begin
        gLines[iJ.top := gLines[iJ.top + gDeltaTop;
        if ((glines[iJ.top < glineWindowA.portRect.top) |
            (glines[iJ.top > glineWindowA.portRect.bottom)) then
            gDeltaTop := gDeltaTop * (-1);
        glines[iJ.top := glines[iJ.top + 2 * gDeltaTop;
        gLines[iJ.bottom := glines[iJ.bottom + gDeltaBottom;
        if ((glines[iJ.bottom < gLineWindowA.portRect.top) |
            (glines[iJ.bottom > gLineWindowA.portRect.bottom)) then 
            gDeltaBottom := gDeltaBottom * (-1);
        glines[iJ.bottom := glines[iJ.bottom + 2 * gDeltaBottom;
        glines[iJ.Left := glines[iJ.Left + gDeltaleft;
        if ((glines[iJ.Left < glineWindowA.portRect.Left) |
            (glines[iJ.Left > glineWindowA.portRect.right)) then
            gDeltaleft := gDeltaleft * (-1);
        glines[iJ.Left := glines[iJ.Left + 2 * gDeltaleft;
        glines[iJ.right := glines[iJ.right + gDeltaRight;
        if ((glines[iJ.right < glineWindowA.portRect.Left) |
            (glines[iJ.right > glineWindowA.portRect.right)) then 
            gDeltaRight := gDeltaRight * (-1);
        glines[iJ.right := glines[iJ.right + 2 * gDeltaRight;
    end;

{----------------> Mainloop <--}
    procedure Mainloop;
        var
            i: INTEGER;
    begin
        while (not Button) do
            begin
                Drawline(NUM_LINES);
                for i := NUM_LINES downto 2 do
                    glines[iJ := glines[i - 1J;
                Recalcline(1);
                Drawline(1);
                gMBarHeightPtrA .- gOldMBarHeight;
            end;
    end;

{----------------> Randomize <--}
    function Randomize (range: INTEGER): INTEGER;
        var
            rawResult: LONGINT;
    begin
        rawResult .- Random;
        rawResult .- abs(rawResult);
        Randomize .- (rawResult * range) div 32768;
    end;

{----------------> RandomRect <--}
    procedure RandomRect (var myRect: Rect; boundingWindow: WindowPtr);
    begin
        myRect.left := Randomize(boundingWindowA.portRect.right - 
                                boundingWindowA.portRect.left);
        myRect.right := Randomize(boundingWindowA.portRect.right -
                                boundingWindowA.portRect.left);
        myRect.top := Randomize(boundingWindowA.portRect.bottom -
                                boundingWindowA.portRect.top);
        myRect.bottom := Randomize(boundingWindowA.portRect.bottom -
                                boundingWindowA.portRect.top);
    end;

{----------------> Lineslnit <--}
    procedure Lineslnit;
        var
            i: INTEGER;
    begin
        gDeltaTop := 3;
        gDeltaBottom := 3;
        gDeltaleft := 2;
        gDeltaRight := 6;
        HideCursor;
        GetDateTime(randSeed);
        RandomRect(glines[1J, glineWindow);
        DrawlineC1>;
        for i := 2 to NUM_LINES do
            begin
                glines[iJ := glines[i - 1J;
                RecalclineCi>;
                Drawline(i);
            end;
    end;

{----------------> Windowinit <--}
    procedure Windowinit;
        var
            totaLRect, mBarRect: Rect;
            mBarRgn: RgnHandle;
    begin
        gMBarHeightPtr := IntPtr($baa);
        gOldMBarHeight := gMBarHeightPtrA;
        gMBarHeightPtrA := O;
        gLineWindow := NewWindow(nil, screenBits.bounds, NIL_TITLE, VISIBLE, 
                                plainDBox, WindowPtr(-1), NO_GO_AWAY, 
                                NIL_REF_CON);
        SetRect(mBarRect, screenBits.bounds.Left,
        screenBits.bounds.top, screenBits.bounds.right,
        screenBits.bounds.top + gOLdMBarHeight);
        mBarRgn := NewRgn;
        RectRgn(mBarRgn, mBarRect);
        UnionRgn(gLineWindowA.visRgn, mBarRgn,
        gLineWindowA.visRgn);
        DisposeRgn(mBarRgn);
        SetPort(gLineWindow);
        FiLLRect(gLineWindowA.portRect, black);
{ Change black to LtGray, }
        PenMode(patXor); { <-- and comment out this Line }
    end;
{----------------> FlyingLine <--}
begin
    Windowinit;
    Linesinit;
    MainLoop;
end.    