program Timer;
    const
        BASE_RES_ID = 400;
        PLAIN = [J;
        PLAIN_ITEM = 1;
        BOLD_ITEM = 2;
        ITALIC_ITEM = 3;
        UNDERLINE_ITEM = 4;
        OUTLINE_ITEM = 5;
        SHADOW_ITEM = 6;
        INCLUDE_SECONDS = TRUE;
        ADD_CHECK_MARK = TRUE;
        REMOVE_CHECK_MARK = FALSE;
        SLEEP = 60;
        WNE_TRAP_NUM = $60;
        UNIMPL_TRAP_NUM = $9F;
        QUIT_ITEM = 1;
        ABOUT_ITEM = 1;
        NOT_A_NORMAL_MENU = -1;
        APPLE_MENU_ID = BASE_RES_ID;
        FILE_MENU_ID = BASE_RES_ID + 1;
        FONT_MENU_ID = 100;
        STYLE_MENU_ID = 101;
        CLOCK_LEFT = 12;
        CLOCK_TOP = 25;
        CLOCK_SIZE = 24;
        ABOUT_ALERT = 400;
    var
        gClockWindow: WindowPtr;
        gDone, gWNEimplemented: BOOLEAN;
        gCurrentTime, gOldTime: LONGINT;
        gTheEvent: EventRecord;
        gLastFont: INTEGER;
        gCurrentStyle: Style;

{----------------> HandleStyleChoice <--}
    procedure CheckStyles;
        var
            styleMenu: MenuHandle;
    begin
        styleMenu := GetMHandleCSTYLE_MENU_ID);
        Checkitem(styleMenu, PLAIN_ITEM, (gCurrentStyle = PLAIN));
        Checkitem(styleMenu, BOLD_ITEM, (bold in gCurrentStyle));
        Checkitem(styleMenu, ITALIC_ITEM, (italic in gCurrentStyle));
        CheckitemCstyleMenu, UNDERLINE_ITEM, (underline in gCurrentStyle));
        CheckitemCstyleMenu, OUTLINE_ITEM, (outline in gCurrentStyle));
        CheckltemCstyleMenu, SHADOW_ITEM, (shadow in gCurrentStyle));
    end;

{----------------> HandleStyleChoice <--}
    procedure HandleStyleChoice Ctheltem: INTEGER);
        begin
            case theltem of
                PLAIN_ITEM:
                    gCurrentStyle := PLAIN;
                BOLD_ITEM:
                    if bold in gCurrentStyle then
                        gCurrentStyle .- gCurrentStyle - [bold]
                    else
                        gCurrentStyle .- gCurrentStyle + CboldJ;
                ITALIC_ITEM:
                    if italic in gCurrentStyle then
                        gCurrentStyle .- gCurrentStyle - [italic]
                    else
                        gCurrentStyle := gCurrentStyle + [italic];
                UNDERLINE ITEM:
                    if underline in gCurrentStyle then
                        gCurrentStyle .- gCurrentStyle - [underline]
                    else
                        gCurrentStyle := gCurrentStyle + [underline];
                OUTLINE ITEM:
                    if outline in gCurrentStyle then
                        gCurrentStyle .- gCurrentStyle - [outline]
                    else
                        gCurrentStyle := gCurrentStyle + [outline];
                SHADOW_ITEM:
                    if shadow in gCurrentStyle then
                        gCurrentStyle .- gCurrentStyle - [shadow]
                    else
                        gCurrentStyle .- gCurrentStyle + [shadow];
            end;
            CheckStyles;
            TextFace(gCurrentStyle>;
        end;

{----------------> HandleFontChoice <--}
    procedure HandleFontChoice Ctheltem: INTEGER);
        var
            fontNumber: INTEGER;
            fontName: Str255;
            fontMenu: MenuHandle;
    begin
        fontMenu := GetMHandle(FONT_MENU_ID);
        Checkitem(fontMenu, glastFont, REMOVE_CHECK_MARK);
        Checkitem(fontMenu, theitem, ADD_CHECK_MARK);
        glastFont := theitem;
        Getitem(fontMenu, theitem, fontName);
        GetFNum(fontName, fontNumber);
        TextFont(fontNumber);
    end;

{----------------> HandleFileChoice <--}
    procedure HandleFileChoice Ctheitem: INTEGER>;
    begin
        case theitem of
            QUIT_ITEM:
                gDone : = TRUE;
        end;
    end;

{----------------> HandleAppleChoice <--}
    procedure HandleAppleChoice Ctheitem: INTEGER>;
        var
            accName: Str255;
            accNumber, itemNumber, dummy: INTEGER;
            appleMenu: MenuHandle;
    begin
        case theitem of
            ABOUT_ITEM:
                dummy := NoteAlertCABOUT_ALERT, nil);
        otherwise
            begin
                appleMenu := GetMHandle(APPLE_MENU_ID);
                Getitem(appleMenu, theitem, accName);
                accNumber := OpenDeskAcc(accName);
            end;
    end;

{----------------> HandleMenuChoice <--}
    procedure HandleMenuChoice CmenuChoice: LONGINT);
        var
            theMenu, theitem: INTEGER;
    begin
        if menuChoice <> 0 then
            begin
                theMenu := HiWord(menuChoice);
                theitem := LoWord(menuChoice);
                case theMenu of
                    APPLE_MENU_ID:
                        HandleAppleChoice(theitem);
                    FILE_MENU_ID:
                        HandleFileChoice(theitem);
                    FONT MENU ID:
                        HandleFontChoice(theitem);
                    STYLE_MENU_I D:
                        HandleStyleChoice(theitem);
                end;
                HiliteMenu(O);
            end;
    end;

{----------------> HandleMouseDown <--}
    procedure HandleMouseDown;
        var
            whichWindow: WindowPtr;
            thePart: INTEGER;
            menuChoice, windSize: LONGINT;
    begin
            thePart := FindWindow(gTheEvent.where, whichWindow);
            case thePart of
                inMenuBar:
                    begin
                        menuChoice := MenuSelect(gTheEvent.where);
                        HandleMenuChoice(menuChoice);
                    end;
                inSysWindow:
                    SystemClick(gTheEvent, whichWindow);
                inDrag:
                    DragWindow(whichWindow, gTheEvent.where, screenBits.bounds);
                inGoAway:
                    gDone := TRUE;
            end;
    end;

{----------------> DrawClock <--}
    procedure DrawClock CtheWindow: WindowPtr);
        var
            myTimeString: Str255;
    begin  
        IUTimeString(gCurrentTime, INCLUDE_SECONDS, myTimeString);
        EraseRect(theWindowA.portRect);
        MoveTo(CLOCK_LEFT, CLOCK_TOP);
        DrawString(myTimeString);
        gOldTime .- gCurrentTime;
    end;

{----~---~-------> HandleNull <--}
    procedure HandleNull;
    begin
        GetDateTime(gCurrentTime);
        if gCurrentTime <> gOldTime then
            DrawClock(gClockWindow);
    end;

{----------------> HandleEvent <--}
    procedure HandleEvent;
        var
            theChar: CHAR;
            dummy: BOOLEAN;
    begin
        if gWNEimplemented then
            dummy := WaitNextEvent(everyEvent, gTheEvent, SLEEP, nil)
        else
            begin
                SystemTask;
                dummy := GetNextEvent(everyEvent, gTheEvent);
            end;
        case gTheEvent.what of
            nullEvent:
                HandleNull;
            mouse Down:
                HandleMouseDown;
            keyDown, autoKey:
                begin
                    theChar := CHR(BitAnd(gTheEvent.message, charCodeMask));
                    if (BitAnd(gTheEvent.modifiers, cmdKey) <> Q) then
                        HandleMenuChoice(MenuKey(theChar));
                end;
            updateEvt:
                begin    
                    BeginUpdateCWindowPtrCgTheEvent.message));
                    EndUpdateCWindowPtrCgTheEvent.message>>;
                end;
        end;
    end;

{----------------> Mainloop <--}
    procedure MainLoop;
    begin
        gDone := FALSE;
        gWNEimplemented := (NGetTrapAddress(WNE_TRAP_NUM, ToolTrap) <>
                            NGetTrapAddress(UNIMPL_TRAP_NUM, Tool Trap));
        while CgDone =FALSE) do
            HandleEvent;
    end;

{----------------> MenuBarinit <--}
    procedure MenuBarinit;
        var
            myMenuBar: Handle;
            aMenu: MenuHandle;
    begin
        myMenuBar := GetNewMBar(BASE_RES_ID);
        SetMenuBar(myMenuBar);
        DisposHandle(myMenuBar);
        aMenu := GetMHandleCAPPLE_MENU_ID);
        AddResMenu(aMenu, 'DRVR');
        aMenu := GetMenu(FONT_MENU_ID);
        InsertMenu(aMenu, NOT_A_NORMAL_MENU);
        ddResMenu(aMenu, 'FONT');
        aMenu := GetMenu(STYLE_MENU_ID);
        InsertMenu(aMenu, NOT_A_NORMAL_MENU);
        Checkitem(aMenu, PLAIN_ITEM, TRUE);
        DrawMenuBar;
        gLastFont := 1;
        gCurrentStyle := PLAIN;
        HandleFontChoice(gLastFont);  
    end;

{----------------> Windowlnit <--}
    procedure Windowlnit;
        begin
            gClockWindow := GetNewWindow(BASE_RES_ID, nil, WindowPtr(-1));
            SetPort(gClockWindow);
            ShowWindow(gClockWindow);
            TextSize(CLOCK_SIZE);
        end;

{----------------> Timer <--}
begin
    Windowlnit;
    MenuBarlnit;
    MainLoop;
end.