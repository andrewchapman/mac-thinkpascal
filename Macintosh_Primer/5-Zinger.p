program Zinger;
    const
        BASE_RES_ID = 400;
        SLEEP = 60;
        DRAG_THRESHOLD = 30;
        WNE_TRAP_NUM = $60;
        UNIMPL_TRAP_NUM = $9F;
        POPUP_MENU_ID = BASE_RES_ID;
        NOT_A_NORMAL_MENU = -1;
        POPUP_LEFT = 100;
        POPUP_TOP = 35;
        POPUP_RIGHT = 125;
        POPUP_BOTTOM = 52;
        SHADOW_PIXELS = 1;
        RIGHT_MARGIN = 5;
        BOTTOM_MARGIN = 4;
        LEFT_MARGIN = 5;
        PIXEL_FOR_TOP_LINE = 1;
        gDone, gWNEimplemented: BOOLEAN;
        gPopUpltem, gPopUpLabelWidth: INTEGER;
        gPopUpMenu: MenuHandle;
        gTheEvent: EventRecord;
        gPopUpRect, gLabelRect, gDragRect: Rect;
        gPopUpLabelH: StringHandle;

{----------------> DrawPopUpNumber <--}
    procedure DrawPopUpNumber;
        var
            menuItem: Str255;
            itemLeftMargin: INTEGER;
    begin
        GetItem(gPopUpMenu, gPopUpitem, menuItem);
        itemLeftMargin := (gPopUpRect.right - gPopUpRect.left -
        StringWidth(menuItem)) div 2;
        MoveToCgPopUpRect.left + itemLeftMargin,
        gPopUpRect.bottom - BOTTOM_MARGIN);
        DrawString(menuItem);
    end;

{----------------> DrawPopUp <--}
    procedure DrawPopUp;
    begin
        SetRect(gPopUpRect, POPUP_LEFT, POPUP_TOP, POPUP_RIGHT, POPUP_BOTTOM);
        FrameRect(gPopUpRect);
        MoveTo(gPopUpRect.left + SHADOW_PIXELS, gPopUpRect.bottom);
        LineTo(gPopUpRect.right, gPopUpRect.bottom);
        LineTo(gPopUpRect.right, gPopUpRect.top + SHADOW_PIXELS);
        MoveTo(gPopUpRect.left - gPopUpLabelWidth - RIGHT_MARGIN,
                                gPopUpRect.bottom - BOTTOM_MARGIN);
        HLock(Handle(gPopUpLabelH));
        DrawString(gPopUpLabeLHAA);
        HUnlock(Handle(gPopUpLabelH));
        gLabelRect.top := gPopUpRect.top + PIXEL_FOR_TOP_LINE;
        gLabelRect.left := gPopUpRect.left - gPopUpLabelWidth - LEFT_MARGIN - 
                            RIGHT_MARGIN;
        gLabelRect.right := gPopUpRect.left;
        gLabelRect.bottom .- gPopUpRect.bottom;
        DrawPopUpNumber;
    end;

{----------------> HandleMouseDown <--}
    procedure HandleMouseDown;
        var
            whichWindow: WindowPtr;
            thePart, i: INTEGER;
            theChoice: LONGINT;
            myPoint, popUpUpperLeft: Point;
    begin
        thePart := FindWindowCgTheEvent.where, whichWindow>;
        case thePart of
            inContent:
                begin
                    myPoint := gTheEvent.where;
                    GlobalToLocal(myPoint);
                    if PtlnRect(myPoint, gPopUpRect) then
                        begin
                            InvertRect(gLabelRect);
                            popUpUpperLeft.v := gPopUpRect.top +
                                                PIXEL_FOR_TOP_LINE;
                            popUpUpperLeft.h := gPopUpRect.left;
                            LocalToGlobal(popUpUpperLeft);
                            theChoice := PopUpMenuSelect(gPopUpMenu,
                                        popUpUpperLeft.v, popUpUpperLeft.h,
                                        gPopUpltem);
                            InvertRect(gLabelRect);
                            if LoWord(theChoice) > 0 then
                                begin
                                    gPopUpltem := LoWord(theChoice);
                                    DrawPopUpNumber;
                                    for i := 0 to gPopUpltem - 1 do SysBeep(20);
                                end;
                        end;
                end;
            inSysWindow:
                SystemClickCgTheEvent, whichWindow);
            inDrag:
                DragWindow(whichWindow, gTheEvent.where, screenBits.bounds);
            inGoAway:
                gDone := TRUE;
{----------------> HandleEvent <--}
    procedure HandleEvent;
        var
            dummy: BOOLEAN;
    begin
        if gWNEimplemented then
            dummy .- WaitNextEvent(everyEvent, gTheEvent, SLEEP, nil)
        else
            begin
                SystemTask;
                dummy := GetNextEvent(everyEvent, gTheEvent);
            end;
        case gTheEvent.what of
            mouse Down:
                HandleMouseDown;
            updateEvt:
                begin
                    BeginUpdate(WindowPtr(gTheEvent.message));
                    DrawPopUp;
                    EndUpdate(WindowPtr(gTheEvent.message));
                end;
        end;
    end;

{----------------> MainLoop <--}
    procedure MainLoop;
    begin
        gDone := FALSE;
        gWNEimplemented := (NGetTrapAddress(WNE_TRAP_NUM, TooLTrap) <>
                            NGetTrapAddress(UNIMPL_TRAP_NUM, Tool Trap));
        while gDone = FALSE do
            HandleEvent;
    end;

{----------------> MenuBarlnit <--}
    procedure MenuBarlnit;
    begin
        gPopUpMenu := GetMenu(POPUP_MENU_ID);
        InsertMenu(gPopUpMenu, NOT_A_NORMAL_MENU);
        gPopUpLabelH := GetString(BASE_RES_ID);
        HLock(Handle(gPopUpLabelH));
        gPopUpLabelWidth := StringWidth(gPopUpLabeLHAA);
        HUnlock(Handle(gPopUpLabelH));
        gPopUpitem := 1;
    end;

{----------------> Windowinit <--}
    procedure Windowinit;
        var
            popUpWindow: WindowPtr;
    begin
        popUpWindow := GetNewWindowCBASE_RES_ID, nil, WindowPtr(-1));
        SetPortCpopUpWindow);
        ShowWindowCpopUpWindow);
        Textfont(systemfont>;
        TextModeCsrcCopy>;
    end;
{----------------> Zinger <--}
begin
    Windowinit;
    MenuBarinit;
    DrawPopUp;
    MainLoop;
end.