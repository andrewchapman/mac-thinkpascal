program EventTutor;
    const
        BASE_RES_ID = 400;
        LEAVE_WHERE_IT_IS = FALSE;
        NORMAL_UPDATES = TRUE;
        SLEEP = 60;
        WNE_TRAP_NUM = $60;
        UNIMPL_TRAP_NUM = $9F;
        SUSPEND_RESUME_BIT = $0001;
        ACTIVATING = 1;
        RESUMING = 1;
        TEXT_FONT_SIZE = 12;
        DRAG_THRESHOLD = 30;
        MIN_WINDOW_HEIGHT = 50;
        MIN_WINDOW_WIDTH = 50;
        SCROLL_BAR_PIXELS = 15;
        ROWHEIGHT = 15;
        LEFTMARGIN = 10;
        STARTROW = O;
        HORIZONTAL_OFFSET = 0;
    var
        gPictWindow, gEventWindow: WindowPtr;
        gDone, gWNEimplemented: BOOLEAN;
        gTheEvent: EventRecord;
        gCurRow, gMaxRow: INTEGER;
        gSizeRect: Rect;

{----------------> CenterPict <--}
    procedure CenterPict (thePicture: PicHandle; var myRect: Rect);
        var
            windRect, pictureRect: Rect;
    begin
        windRect := myRect;
        pictureRect := thePictureAA.picFrame;
        myRect.top := (windRect.bottom - windRect.top - CpictureRect.bottom - 
                        pictureRect.top)) div 2 + windRect.top;
        myRect.bottom := myRect.top + CpictureRect.bottom - pictureRect.top);
        myRect.left := (windRect.right - windRect.left - (pictureRect.right - 
                        pictureRect.left)) div 2 + windRect.left;
        myRect.right .- myRect.left + CpictureRect.right - pictureRect.left);
    end;
{----------------> DrawMyPicture <--}
    procedure DrawMyPicture (drawingWindow: WindowPtr);
        var
            drawingClipRect, myRect: Rect;
            oldPort: GrafPtr;
            tempRgn: RgnHandle;
            thePicture: PicHandle;
    begin
        GetPort(oldPort);
        SetPort(drawingWindow);
        tempRgn := NewRgn;
        GetCLip(tempRgn);
        EraseRect(drawingWindowA.portRect);
        DrawGrowlcon(drawingWindow);
        drawingCLipRect := drawingWindowA.portRect;
        drawingCLipRect.right := drawingCLipRect.right -
        SCROLL_BAR_PIXELS;
        drawingCLipRect.bottom := drawingCLipRect.bottom -
        SCROLL_BAR_PIXELS;
        myRect := drawingWindowA.portRect;
        thePicture := GetPicture(BASE_RES_ID);
        CenterPict(thePicture, myRect);
        ClipRect(drawingCLipRect);
        DrawPicture<thePicture, myRect);
        SetCLip(tempRgn);
        DisposeRgn(tempRgn);
        SetPort(oldPort);
    end;

{----------------> HandleMouseDown <--}
    procedure HandleMouseDown;
    var
        whichWindow: WindowPtr;
        thePart: INTEGER;
        windSize: LONGINT;
        oldPort: Graf Ptr;
    begin
        thePart := FindWindow(gTheEvent.where, whichWindow);
        case thePart of
            inSysWindow:
                SystemCLick(gTheEvent, whichWindow);
            inDrag:
                DragWindow(whichWindow, gTheEvent.where, screenBits.bounds);
            inContent:
                if whichWindow <> FrontWindow then
                    SelectWindow(whichWindow);
            inGrow:
                begin
                    windSize := GrowWindow(whichWindow, gTheEvent.where,
                                            gSizeRect);
                    if (windSize <> Q) then
                        begin
                            GetPort(oldPort);
                            SetPort<whichWindow);
                            EraseRect(whichWindowA.portRect);
                            SizeWindow<whichWindow, LoWord(windSize),
                                        HiWord(windSize), NORMAL_UPDATES);
                            InvalRect(whichWindowA.portRect);
                            SetPort(oldPort);
                        end;
                end;
            inGoAway:
                gDone := TRUE;
            inZoomin, inZoomOut:
                if TrackBox(whichWindow, gTheEvent.where, thePart) then
                    begin
                        GetPort(oldPort);
                        SetPort(whichWindow);
                        EraseRect(whichWindowA.portRect);
                        ZoomWindow(whichWindow, thePart, LEAVE_WHERE_IT_IS);
                        InvalRect(whichWindowA.portRect);
                        SetPort(oldPort);
                    end;
        end;
    end;

{----------------> ScrollWindow <--}
    procedure ScrollWindow;
        var
            tempRgn: RgnHandle;
    begin
        tempRgn := NewRgn;
        ScrollRect(gEventWindowA.portRect, HORIZONTAL_OFFSET, - ROWHEIGHT, 
                    tempRgn);
        DisposeRgn(tempRgn);
    end;

{----------------> DrawEventString <--}
    procedure DrawEventString Cs: Str255);
    begin
        if (gCurRow > gMaxRow) then
            ScrollWindow
        else
            gCurRow := gCurRow + ROWHEIGHT;
        MoveTo(LEFTMARGIN, gCurRow);
        DrawString(s);
    end;

{----------------> HandleEvent <--}
    procedure HandleEvent;
        var
            gotOne: BOOLEAN;
    begin
        if gWNEimplemented then
            gotOne .- WaitNextEvent(everyEvent, gTheEvent, SLEEP, nil)
        else
            begin
                SystemTask;
                gotOne .- GetNextEvent(everyEvent, gTheEvent);
            end;
        if gotOne then
            case gTheEvent.what of
                nullEvent:
                    begin
                        { DrawEventString('nullEvent');
                        { Uncomment the previous line for a burst of flavor!}
                    end;
                mouseDown:
                    begin
                        DrawEventString('mouseDown');
                        HandleMouseDown;
                    end;
                mouseUp:
                    DrawEventString('mouseUp');
                key Down:
                    DrawEventString('keyDown');
                keyUp:
                    DrawEventString( 'keyUp' );
                autoKey:
                    DrawEventString('autoKey');
                updateEvt:
                    if (WindowPtr(gTheEvent.message) = gPictWindow) then 
                        begin
                            DrawEventString('updateEvt: gPictWindow');
                            BeginUpdate(WindowPtr(gTheEvent.message));
                            DrawMyPicture(WindowPtr(gTheEvent.message));
                            EndUpdate(WindowPtr(gTheEvent.message));
                        end
                    else
                        begin
                            DrawEventString('updateEvt: gEventWindow');
                            BeginUpdateCWindowPtr
                            CgTheEvent.message));
{ We won't handle updates to gEventWindow, }
{ but we still need to empty the gEventWindow }
{ Update Region so the Window Manager will stop }
{ queing UpdateEvts. We do this with calls to }
{ BeginUpdate and EndUpdate. }
                            EndUpdateCWindowPtr(gTheEvent.message));
                        end;
                diskEvt:
                    DrawEventString('diskEvt');
                activateEvt:
                    if (WindowPtr(gTheEvent.message) = gPictWindow) then 
                        begin
                            DrawGrowicon(WindowPtr(gTheEvent.message));
                            if (BitAnd(gTheEvent.modifiers,activeFlag) = 
                                        ACTIVATING) then
                                DrawEventString
                                    ('activateEvt: activating gPictWindow')
                            else
                                DrawEventString
                                    ('activateEvt: deactivating gPictWindow');
                        end
                    else
                        begin 
                            if (BitAnd(gTheEvent.modifiers, activeFlag) = 
                                ACTIVATING) then
                                DrawEventString
                                    ('activateEvt: activating gEventWindow');
                            else
                                DrawEventString
                                    ('activateEvt: deactivating gEventWindow');
                        end;
                networkEvt:
                    DrawEventString('networkEvt');
                driverEvt:
                    DrawEventString('driverEvt'); 
                app1Evt:
                    DrawEventStringC'app1Evt'>;
                app2Evt:
                    DrawEventStringC'app2Evt');
                app3Evt:
                    DrawEventStringC'app3Evt'>;
                app4Evt:
                    if (BitAndCgTheEvent.message, SUSPEND_RESUME_BIT) = 
                        RESUMING) then
                        DrawEventStringC'Resume event')
                    else
                        DrawEventStringC'Suspend event'>;
            end;
    end;

{----------------> MainLoop <--}
    procedure MainLoop;
        begin
            gDone := FALSE;
            gWNEimplemented := (NGetTrapAddress(WNE_TRAP_NUM,ToolTrap) <>
                                NGetTrapAddress(UNIMPL_TRAP_NUM,Tool Trap));
            while gDone = FALSE do
                HandleEvent;
        end;

{----------------> SetUpSizeRect <--}
    procedure SetUpSizeRect;
        begin
            gSizeRect.top := MIN_WINDOW_HEIGHT;
            gSizeRect.left := MIN_WINDOW_WIDTH;
            gSizeRect.bottom := 32767;
            gSizeRect.right := 32767;
        end;

{----------------> SetupEventWindow <--}
    procedure SetupEventWindow;
        var
            eventRect: Rect;
            fontNum: INTEGER;
    begin
        eventRect := gEventWindowA.portRect;
        gMaxRow := eventRect.bottom - eventRect.top - ROWHEIGHT;
        gCurRow := STARTROW;
        SetPort(gEventWindow);
        GetFNum('monaco', fontNum>;
        TextFont(fontNum>;
        TextSize(TEXT_FONT_SIZE);
    end;

{----------------> Windowlnit <--}
procedure Windowlnit;
    begin
        gPictWindow := GetNewWindow(BASE_RES_ID, nil, WindowPtr(-1));
        gEventWindow := GetNewWindow(BASE_RES_ID + 1, nil, WindowPtr(-1));
        SetupEventWindow;
        ShowWindow(gEventWindow);
        ShowWindowCgPictWindow>;
    end;

{----------------> EventTutor <--}
begin
    Windowlnit;
    SetUpSizeRect;
    MainLoop;
end.