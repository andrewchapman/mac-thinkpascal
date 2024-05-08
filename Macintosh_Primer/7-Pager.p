program Pager;
    const
        BASE_RES_ID = 400;
        SCROLL_BAR_PIXELS = 16;
        MIN_SLEEP = 0;
        NIL_REF_CON = 0;
        WNE_TRAP_NUM = $60;
        UNIMPL_TRAP_NUM = $9F;
        ERROR_ALERT_ID = BASE_RES_ID + 1;
        NO_WIND = BASE_RES_ID;
        NO_PICTS = BASE_RES_ID + 1;
        CANT_LOAD_PICT = BASE_RES_ID + 2;
        NIL_STRING = '';
        NIL_TITLE = NIL_STRING;
        VISIBLE = TRUE;
        START_VALUE = 1;
        MIN_VALUE = 1;
        HOPELESSLY_FATAL_ERROR= 'Game over, man!'
    var
        gPictWindow: WindowPtr;
        gScrollBarHandle: ControlHandle;
        gDone, gWNEimplemented: BOOLEAN;
        gTheEvent: EventRecord;

{----------------> ErrorHandler <--}
    procedure ErrorHandler (stringNum: INTEGER);
        var
            errorStringH: StringHandle;
            dummy: INTEGER;
    begin
        errorStringH := GetString(stringNum>;
        if errorStringH =nil then
            ParamText(HOPELESSLY_FATAL_ERROR, NIL_STRING, NIL_STRING, NIL_STRING)
        else
            ParamText(errorStringHAA, NIL_STRING, NIL_STRING, NIL_ STRING ) ;
        dummy := StopAlertCERROR_ALERT_ID, nil);
        ExitToShell;
    end;

{----------------> CenterPict <--}
    procedure CenterPict (thePicture: PicHandle; var myRect: Rect);
        var
            windRect, pictureRect: Rect;
        begin
            windRect := myRect;
            pictureRect := thePictureAA.picFrame;
            myRect.top := (windRect.bottom - windRect.top - (pictureRect.bottom - 
                            pictureRect.top)) div 2 + windRect.top;
            myRect.bottom := myRect.top + (pictureRect.bottom - pictureRect.top);
            myRect.left := (windRect.right - windRect.left - (pictureRect.right - 
                            pictureRect.left)) div 2 + windRect.left;
            myRect.right .- myRect.left + CpictureRect.right - pictureRect.left);
        end;

{----------------> UpdateMyWindow <--}
    procedure UpdateMyWindow (drawingWindow: WindowPtr);
        var
            currentPicture: PicHandle;
            drawingClipRect, myRect: Rect;
            tempRgn: RgnHandle;
            tempRgn := NewRgn;
    begin
        GetClip(tempRgn);
        myRect := drawingWindowA.portRect;
        myRect.right := myRect.right - SCROLL_BAR_PIXELS;
        EraseRect(myRect);
        currentPicture := PicHandle(GetlndResource('PICT', 
                                    GetCtlValue(gScrollBarHandle)));
        if currentPicture =nil then
            ErrorHandler(CANT_LOAD_PICT);
        CenterPict(currentPicture, myRect);
        drawingClipRect := drawingWindowA.portRect;
        drawingClipRect.right := drawingClipRect.right - SCROLL_BAR_PIXELS;
        ClipRect(drawingClipRect);
        DrawPicture(currentPicture, myRect);
        SetClip(tempRgn);
        DisposeRgn(tempRgn);
    end;

{----------------> ScroLLProc <--}
    procedure ScroLLProc (theControl: ControLHandle; theCode:INTEGER);
        var
            curControLValue, maxControLValue, minControLValue: INTEGER;
    begin
        maxControLValue .- GetCtLMax(theControl);
        curControLValue .- GetCtLValue(theControl);
        minControLValue .- GetCtLMin(theControl);
        case theCode of
            inPageDown, inDownButton:
                if curControLValue < maxControLValue then
                    curControLValue := curControLValue + 1;
            inPageUp, inUpButton:
                if curControLValue > minControLValue then
                    curControLValue := curControLValue - 1;
        end;
        SetCtLValue(theControl, curControLValue);
    end;

{----------------> SetUpScroLLBar <--}
    procedure SetUpScroLLBar;
    var
        vScroLLRect: Rect;
        numPictures: INTEGER;
    begin
        numPictures := CountResources('PICT');
        if numPictures <= 0 then
            ErrorHandlerCNO_PICTS);
        vScroLLRect := gPictWindowA.portRect;
        vScroLLRect.top := vScroLLRect.top - 1;
        vScroLLRect.bottom := vScroLLRect.bottom + 1;
        vScroLLRect.Left := vScroLLRect.right -
        SCROLL_BAR_PIXELS + 1;
        vScroLLRect.right := vScroLLRect.right + 1;
        gScroLLBarHandle := NewControl(gPictWindow, vScrollRect, NIL_TITLE,
                                    VISIBLE, START_VALUE, MIN_VALUE, numPictures,
                                    scroLLBarProc, NIL_REF_CON);
    end;

{----------------> HandleMouseDown <--}
    procedure HandleMouseDown;
    var
        whichWindow: WindowPtr;
        thePart: INTEGER;
        thePoint: Point;
        theControl: ControLHandle;
    begin
        thePart := FindWindowCgTheEvent.where, whichWindow>;
        case thePart of
            inSysWindow:
                SystemCLick(gTheEvent, whichWindow);
            inDrag:
                DragWindow(whichWindow, gTheEvent.where, screenBits.bounds);
            inContent:
                begin
                    thePoint := gTheEvent.where;
                    GlobaLTolocaL(thePoint); .
                    thePart := FindControL(thePoint, whichWindow, theControl);
                    if theControl = gScroLLBarHandle then
                        begin
                            if thePart = inThumb then
                                begin
                                thePart := TrackControl(theControl, thePoint, nil);
                                UpdateMyWindow(whichWindow);
                                end
                            else
                                begin
                                thePart := TrackControl (theControl, thePoint, 
                                            @ScroLLProc);
                                UpdateMyWindow(whichWindow);
                                end;
                        end;
                end;
            inGoAway:
                gDone .- TRUE;
        end;            
    end;

{----------------> HandleEvent <--}
    procedure HandleEvent;
        var
            dummy: BOOLEAN;
    begin
        if gWNEimplemented then
            dummy := WaitNextEvent(everyEvent, gTheEvent, MIN_SLEEP, nil)
        else
            begin
                SystemTask;
                dummy := GetNextEventCeveryEvent, gTheEvent);
            end;
        case gTheEvent.what of
            mouseDown:
                HandleMouseDown;
            updateEvt:
                begin
                    BeginUpdateCWindowPtr(gTheEvent.message));
                    DrawControls(WindowPtr(gTheEvent.message));
                    UpdateMyWindow(WindowPtr(gTheEvent.message));
                    EndUpdate(WindowPtr(gTheEvent.message));
                end;
        end;
    end;

{----------------> MainLoop <--}
    procedure MainLoop;
    begin
        gDone := FALSE;
        gWNEimplemented := (NGetTrapAddress(WNE_TRAP_NUM, ToolTrap) <> NGetTrapAddress
                            CUNIMPL_TRAP_NUM, ToolTrap));
        while (gDone = FALSE) do
            HandleEvent;
    end;

{----------------> Windowlnit <--}
procedure Windowlnit;
    begin
        gPictWindow := GetNewWindow(BASE_RES_ID, nil, WindowPtr(-1));
        if gPictWindow =nil then
            ErrorHandler(NO_WIND);
        SelectWindow(gPictWindow);
        ShowWindow(gPictWindow);
        SetPort(gPictWindow);
    end;

{----------------> Pager <--}
begin
    Windowlnit;
    SetUpScroLLBar;
    Mainloop;
end.