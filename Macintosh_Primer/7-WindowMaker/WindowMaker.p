program WindowMaker;
    const
        BASE_RES_ID = 400;
        APPLE_MENU_ID = 400;
        FILE_MENU_ID = 401;
        EDIT MENU_ID = 402;
        ABOUT _ITEM = 1;
        ABOUT_ALERT = 400;
        ERROR_ALERT_ID = 401;
        NO_MBAR = BASE_RES_ID;
        NO MENU = BASE_RES_ID + 1;
        NO PICTURE = BASE_RES ID + 2;
        NO_WIND = BASE_RES ID + 3;
        NEW_ITEM = 1;
        CLOSE_ITEM = 2;
        QUIT_ITEM = 3;
        UNDO_ITEM = 1;
        CUT_ITEM = 3;
        COPY_ITEM = 4;
        PASTE_ITEM = 5;
        CLEAR_ITEM = 6;
        EDGE THRESHOLD = 30;
        WINDOW_HOME_LEFT = 5;
        WINDOW_HOME_TOP = 45;
        NEW_WINDOW_OFFSET = 20;
        MIN_SLEEP = 60;
        LEAVE_WHERE_IT_IS = FALSE;
        WNE_TRAP_NUM = $60;
        UNIMPL_TRAP_NUM = $9F;
        NIL_STRING = I I;
        HOPELESSLY_FATAL_ERROR = 'Game over, man!';
    var
        gDone, gWNEimplemented: Boolean;
        gTheEvent: EventRecord;
        gNewWindowLeft, gNewWindowTop: INTEGER;
{----------------> ErrorHandler <--}
    procedure ErrorHandler (stringNum: INTEGER);
        var
            errorStringH: StringHandle;
            dummy: INTEGER;
    begin
        errorStringH := GetString(stringNum);
        if errorStringH = nil then
            ParamText(HOPELESSLY_FATAL_ERROR, NIL_STRING, NIL_STRING, NIL_STRING)
        else
            ParamText(errorStringHAA, NIL_STRING, NIL_STRING, NIL_STRING);
        dummy := StopAlert(ERROR_ALERT_ID, nil);
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
        myRect.right .- myRect.left + (pictureRect.right - pictureRect.left);
    end;

{----------------> DrawMyPicture <--}
    procedure DrawMyPicture (pictureWindow: WindowPtr);
        var
            myRect: Rect;
            thePicture: PicHandle;
    begin
        myRect := pictureWindowA.portRect;
        thePicture := GetPicture(BASE_RES_ID);
        if thePicture = nil then
            ErrorHandler(NO_PICTURE);
        CenterPict(thePicture, myRect);
        SetPort(pictureWindow);
        DrawPicture(thePicture, myRect);
    end;

{----------------> CreateWindow <--}
    procedure CreateWindow;
        var
            theNewestWindow: WindowPtr;
    begin
        theNewestWindow := GetNewWindow(BASE_RES_ID, nil, WindowPtr(-1));
        if theNewestWindow =nil then
            ErrorHandler(NO_WIND);
        if ((screenBits.bounds.right - gNewWindowLeft) < EDGE_THRESHOLD) or 
           ((screenBits.bounds.bottom - gNewWindowTop) < EDGE_THRESHOLD) then
            begin
                gNewWindowLeft := WINDOW_HOME_LEFT;
                gNewWindowTop := WINDOW_HOME_TOP;
            end;
        MoveWindow(theNewestWindow, gNewWindowLeft, gNewWindowTop, LEAVE_WHERE_IT_IS);
        gNewWindowLeft := gNewWindowLeft + NEW_WINDOW_OFFSET;
        gNewWindowTop := gNewWindowTop + NEW_WINDOW_OFFSET;
        ShowWindow(theNewestWindow);
    end;

{----------------> HandleEditChoice <--}
    procedure HandleEditChoice Ctheitem: INTEGER);
        var
            dummy: Boolean;
    begin
        dummy := SystemEdit(theitem - 1);
    end;

{----------------> HandleFileChoice <--}
    procedure HandleFileChoice (theitem: INTEGER);
        var
            whichWindow: WindowPtr;
    begin
        case theltem of
            NEW_ITEM:
                CreateWindow;
            CLOSE_ITEM:
                begin
                    whichWindow := FrontWindow;
                    if whichWindow <>nil then
                        DisposeWindow(whichWindow);
                end;
            QUIT ITEM:
                gDone := TRUE;
    end;

{----------------> HandleAppleChoice <--}
    procedure HandleAppleChoice (theltem: INTEGER>;
        var
            accName: Str255;
            accNumber, itemNumber, dummy: INTEGER;
            aMenu: MenuHandle;
    begin
        case theitem of
            ABOUT_ITEM:
                dummy := NoteAlert(ABOUT_ALERT, nil);
        otherwise
            begin
                aMenu := GetMHandle(APPLE_MENU_ID);
                Getitem(aMenu, theitem, accName);
                accNumber .- OpenDeskAcc(accName);
            end;
        end;
    end;

{----------------> HandleMenuChoice <--}
    procedure HandleMenuChoice (menuChoice: LONGINT>;
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
                    EDIT_MENU_ID:
                        HandleEditChoice(theitem);
                end;
                HiLiteMenu(0);
            end;
    end;

{----------------> IsDAWindow <--}
    function IsDAWindow (whichWindow: WindowPtr): BOOLEAN;
        begin
            if whichWindow =nil then
                IsDAWindow := FALSE
            else
                IsDAWindow := (WindowPeek<whichWindow)A.windowKind < Q);
        end;
    
{----------------> AdjustMenus <--}
    procedure AdjustMenus;
        var
            aMenu: MenuHandle;
    begin
        aMenu := GetMHandleCFILE_MENU_ID);
        if FrontWindow =nil then
            DisableltemCaMenu, CLOSE_ITEM)
        else
            EnableltemCaMenu, CLOSE_ITEM);
        aMenu := GetMHandle(EDIT_MENU_ID);
        if IsDAWindowCFrontWindow) then
            begin
                Enableltem(aMenu, UNDO_ITEM);
                Enableltem(aMenu, CUT_ITEM);
                Enableltem(aMenu, COPY_ITEM);
                Enableltem(aMenu, PASTE_ITEM);
                Enableltem(aMenu, CLEAR_ITEM);
            end;
        else
            begin
                Disableltem(aMenu, UNDO_ITEM);
                Disableltem(aMenu, CUT_ITEM);
                Disableltem(aMenu, COPY_ITEM);
                Disableltem(aMenu, PASTE_ITEM);
                Disableltem(aMenu, CLEAR_ITEM);
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
                    AdjustMenus;
                    menuChoice := MenuSelect(gTheEvent.where);
                    HandleMenuChoice(menuChoice);
                end;
            inSysWindow:
                SystemCLick(gTheEvent, whichWindow);
            inDrag:
                DragWindow(whichWindow, gTheEvent.where, screenBits.bounds);
            inGoAway:
                DisposeWindow(whichWindow);
            inContent:
                SelectWindow(whichWindow);
        end;
    end;

{----------------> HandleEvent <--}
    procedure HandleEvent;
        var
            theChar: CHAR;
            dummy: BOOLEAN;
            oldPort: GrafPtr;
    begin
        if gWNEimplemented then
            dummy := WaitNextEvent(everyEvent, gTheEvent, MIN_SLEEP, nil)
        else
            begin
                SystemTask;
                dummy := GetNextEvent(everyEvent, gTheEvent);
            end;
        case gTheEvent.what of
            mouseDown:
                HandleMouseDown; 
            keyDown, autoKey:
                begin
                    theChar := CHRCBitAnd(gTheEvent.message, charCodeMask));
                    if CBitAnd(gTheEvent.modifiers, cmdKey) <> Q) then
                        begin
                            AdjustMenus;
                            HandleMenuChoice(MenuKey(theChar));
                        end;
                end;
            updateEvt:
                if not IsDAWindowCWindowPtr(gTheEvent.message)) then
                    begin
                        GetPort(oldPort);
                        SetPort(WindowPtr(gTheEvent.message));
                        BeginUpdateCWindowPtr(gTheEvent.message));
                        DrawMyPictureCWindowPtr(gTheEvent.message));
                        EndUpdate(WindowPtr(gTheEvent.message));
                        SetPort(oldPort);
                    end;
        end;
    end;

{----------------> MainLoop <--}
    procedure MainLoop;
    begin
        gDone := FALSE;
        gNewWindowLeft := WINDOW_HOME_LEFT;
        gNewWindowTop := WINDOW_HOME_TOP;
        gWNEimplemented := (NGetTrapAddress(WNE_TRAP_NUM, ToolTrap) <> NGetTrapAddress
                            (UNIMPL_TRAP_NUM, ToolTrap));
        while CgDone = FALSE) do
            HandleEvent;
    end;

{----------------> MenuBarlnit <--}
    procedure MenuBarlnit;
        var
            myMenuBar: Handle;
            aMenu: MenuHandle;
    begin            
        myMenuBar := GetNewMBar(BASE_RES_ID);
        if myMenuBar = nil then
            ErrorHandler(NO_MBAR);
        SetMenuBar(myMenuBar);
        aMenu := GetMHandle(APPLE_MENU_ID);
        if aMenu = nil then
            ErrorHandler(NO_MENU>;
        AddResMenu(aMenu, 'DRVR');
        aMenu := GetMHandle(EDIT_MENU_ID);
        if aMenu = nil then
            ErrorHandler(NO_MENU);
        aMenu := GetMHandle(FILE_MENU_ID);
        if aMenu = nil then
            ErrorHandler(NO_MENU);
        DrawMenuBar;
    end;
{----------------> WindowMaker <--}
begin
    MenuBarinit;
    Mainloop;
end.                               