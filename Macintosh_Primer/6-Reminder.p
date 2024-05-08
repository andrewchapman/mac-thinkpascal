program Reminder;
    uses
        Notification;
    const
        BASE_RES_ID = 400;
        ABOUT_ALERT = 401;
        BAD_SYS_ALERT = 402;
        SLEEP = 60;
        SAVE BUTTON = 1;
        CANCEL_BUTTON = 2;
        TIME_FIELD = 4;
        S_OR_M_FIELD = 5;
        SOUND_ON_BOX = 6;
        ICON_ON_BOX = 7;
        ALERT_ON_BOX = 8;
        SECS_RADIO = 10;
        MINS_RADIO = 11;
        DEFAULT_SECS_ID = 401;
        DEFAULT_MINS ID = 402;
        ON = 1;
        OFF = O;
        SECONDS_PER_MINUTE = 60;
        TOP = 25;
        LEFT = 12;
        MARK_APPLICATION = 1;
        APPLE_MENU_ID = BASE_RES_ID;
        FILE_MENU_ID = BASE_RES ID + 1;
        ABOUT_ITEM = 1;
        CHANGE_ITEM = 1;
        START_STOP_ITEM = 2;
        KILL_ITEM = 3;
        QUIT_ITEM = 4;
        SYS_VERSION = 2;
    type
        settings = record
                        timeString: Str255;
                        sound, icon, alert, secsRadio, minsRadio: INTEGER;
        end;
    var
        gSettingsDialog: DialogPtr;
        gDone, gCounting, gNotify_set: BOOLEAN;
        gSeconds_or_minutes: (seconds, minutes);
        gNotifyStrH, gDefaultSecsH, gDefaultMinsH: StringHandle;
        gMyNMRec: NMRec;
        gTheEvent: EventRecord;
        savedSettings: settings;

    procedure HandleEvent;
    forward;

{----------------> SetNotification <--}
    procedure SetNotification;
        var
            itemType: INTEGER;
            itemRect: Rect;
            itemHandle: Handle;
            dummy: OSErr;
            fileMenu: MenuHandle;
    begin
        if gNotify_set then
            begin
                dummy := NMRemoveCQElemPtr(@gMyNMRec));
                HUnlock(Handle(gNotifyStrH));
            end;
        GetDitem(gSettingsDialog, ICON_ON_BOX, itemType, itemHandle, itemRect);
        if GetCtlValue(ControlHandle(itemHandle)) = ON then
            gMyNMRec.nmSIcon .- GetResource('SICN', BASE RES ID)
        else
            gMyNMRec.nmSicon := nil;
        GetDitem(gSettingsDialog, SOUND_ON_BOX, itemType, itemHandle, itemRect);
        if GetCtlValue(ControlHandle(itemHandle)) = ON then
            gMyNMRec.nmSound .- GetResource('snd ', BASE_RES ID)
        else
            gMyNMRec.nmSound :=nil;
        GetDitem(gSettingsDialog, ALERT_ON_BOX, itemType, itemHandle, itemRect);
        if GetCtlValue(ControlHandleCitemHandle)) = ON then
            begin
                MoveHHi(Handle(gNotifyStrH));
                HLock(Handle(gNotifyStrH));
                gMyNMRec.nmStr := gNotifyStrH^;
            end;
        else
            gMyNMRec.nmStr :=nil;
        dummy := NMinstall(QElemPtr(@gMyNMRec));
        fileMenu := GetMHandleCFILE_MENU_ID);
        Enableitem(fileMenu, KILL_ITEM);
        gNotify_set := TRUE;
    end;

{----------------> CountDown <--}
    procedure CountDown CnumSecs: LONGINT);
        var
            myTime, oldTime, difTime: LONGINT;
            myTimeString: Str255;
            countDownWindow: WindowPtr;
    begin
        countDownWindow := GetNewWindowCBASE_RES_ID, nil, WindowPtr(-1));
        SetPortCcountDownWindow);
        ShowWindowCcountDownWindow);
        TextFace([bold]);
        TextSize(24);
        GetDateTime(myTime);
        oldTime := myTime;
        if gSeconds_or_minutes = minutes then
            numSecs := numSecs * SECONDS_PER_MINUTE;
        gCounting := TRUE;
        while CnumSecs > 0) and gCounting do
            begin
                HandleEvent;
                if gCounting then
                    begin
                        MoveTo(LEFT, TOP);
                        GetDateTime(myTime);
                        if myTime <> oldTime then
                            begin
                                difTime := myTime - oldTime;
                                numSecs := numSecs - difTime;
                                oldTime := myTime;
                                NumToString(numSecs, myTimeString);
                                EraseRect(countDownWindow^.portRect);
                                DrawString(myTimeString);
                            end;
                    end;
            end;
            if gCounting then
                SetNotification;
            gCounting := FALSE;
            DisposeWindow(countDownWindow);
    end;

{----------------> RestoreSettings <--}
    procedure RestoreSettings;
        var
            itemType: INTEGER;
            itemRect: Rect;
            itemHandle: Handle;
    begin
        GetDitem(gSettingsDialog, TIME_FIELD, itemType, itemHandle, itemRect);
        SetIText(itemHandle, savedSettings.timeString);
        GetDitem(gSettingsDialog, SOUND_ON_BOX, itemType, itemHandle, itemRect);
        SetCtlValue(ControlHandle(itemHandle), savedSettings.sound);
        GetDitem(gSettingsDialog, ICON_ON_BOX, itemType, itemHandle, itemRect);
        SetCtlValue(ControlHandle(itemHandle), savedSettings.icon);
        GetDitem(gSettingsDialog, ALERT_ON_BOX, itemType, itemHandle, itemRect);
        SetCtlValue(ControlHandle(itemHandle), savedSettings.alert);
        GetDitem(gSettingsDialog, SECS_RADIO, itemType, itemHandle, itemRect);
        SetCtlValue(ControlHandle(itemHandle), savedSettings.secsRadio);
        GetDitem(gSettingsDialog, MINS_RADIO, itemType, itemHandle, itemRect);
        SetCtlValue(ControlHandle(itemHandle), savedSettings.minsRadio);
        if savedSettings.secsRadio = ON then
            begin
                GetDitem(gSettingsDialog, S_OR_M_FIELD, itemType, itemHandle, itemRect);
                SetIText(itemHandle, 'seconds');
            end
        else
            begin
                GetDitem(gSettingsDialog, S_OR_M_FIELD, itemType, itemHandle, itemRect);
                SetIText(itemHandle, 'minutes');
            end;
    end;

{----------------> SaveSettings <--}
    procedure SaveSettings;
        var
            itemType: INTEGER;
            itemRect: Rect;
            itemHandle: Handle;
    begin
        GetDitem(gSettingsDialog, TIME_FIELD, itemType, itemHandle, itemRect);
        GetIText(itemHandle, savedSettings.timeString);
        GetDitem(gSettingsDialog, SOUND_ON_BOX, itemType, itemHandle, itemRect);
        savedSettings.sound := GetCtlValue(ControlHandle(itemHandle));
        GetDitem(gSettingsDialog, ICON_ON_BOX, itemType, itemHandle, itemRect);
        savedSettings.icon := GetCtlValue(ControlHandleCitemHandle>>;
        GetDitem(gSettingsDialog, ALERT_ON_BOX, itemType, itemHandle, itemRect);
        savedSettings.alert := GetCtlValue(ControlHandleCitemHandle));
        GetDitem(gSettingsDialog, SECS_RADIO, itemType, itemHandle, itemRect>;
        savedSettings.secsRadio := GetCtlValue(ControlHandleCitemHandle));
        GetDitem(gSettingsDialog, MINS_RADIO, itemType, itemHandle, itemRect);
        savedSettings.minsRadio := GetCtlValue(ControlHandle(itemHandle));
    end;

{----------------> HandleDialog <--}
    procedure HandleDialog;
        var
            dialogDone: BOOLEAN;
            itemHit, itemType: INTEGER;
            alarmDelay: LONGINT;
            delayString: Str255;
            itemRect: Rect;
            itemHandle: Handle;
    begin
        ShowWindow(gSettingsDialog);
        SaveSettings;
        dialogDone := FALSE;
        while dialogDone = FALSE do
            begin
                ModalDialog(nil, itemHit);
                case itemHit of
                    SAVE_BUTTON:
                        begin
                            HideWindow(gSettingsDialog);
                            dialogDone := TRUE;
                        end;
                    CANCEL_BUTTON:
                        begin
                            HideWindow(gSettingsDialog);
                            RestoreSettings;
                            dialogDone .- TRUE;
                        end;
                    SOUND_ON_BOX:
                        begin
                            GetDitem(gSettingsDialog, SOUND_ON_BOX, itemType,
                                    itemHandle, itemRect);
                            if GetCtlValue(ControLHandle(itemHandle)) = ON then
                                SetCtlValue(ControlHandle(itemHandle), OFF)
                            else
                                SetCtlValue(ControlHandle(itemHandle), ON);
                        end;
                    ICON_ON_BOX:
                        begin
                            GetDitem(gSettingsDialog, ICON_ON_BOX, itemType,
                                        itemHandle, itemRect);
                            if GetCtlValue(ControlHandle(itemHandle)) = ON then
                                SetCtlValue(ControlHandle(itemHandle), OFF)
                            else
                                SetCtlValue(ControlHandle(itemHandle), ON);
                    ALERT_ON_BOX:
                        begin
                            GetDitem(gSettingsDialog, ALERT_ON_BOX, itemType,
                                        itemHandle, itemRect);
                            if GetCtlValue(ControlHandle(itemHandle)) = ON then
                                SetCtlValue(ControlHandle(itemHandle), OFF)
                            else
                                SetCtlValue(ControlHandle(itemHandle), ON);
                        end;
                    SECS_RADIO:
                        begin
                            gSeconds_or_minutes := seconds;
                            GetDitem(gSettingsDialog, MINS_RADIO, itemType,
                                        itemHandle, itemRect);
                            SetCtLValue(ControLHandle(itemHandle), OFF);
                            GetDitemCgSettingsDialog, SECS_RADIO, itemType,
                                        itemHandle, itemRect);
                            SetCtLValue(ControLHandle(itemHandle), ON);
                            GetDitem(gSettingsDialog, S_OR_M_FIELD, itemType,
                                        itemHandle, itemRect);
                            SetIText<itemHandle, 'seconds');
                            GetDitem(gSettingsDialog, TIME_FIELD, itemType,
                                        itemHandle, itemRect);
                            SetIText(itemHandle, gDefaultSecsH^^);
                        end;
                    MINS_RADI0:
                        begin
                            gSeconds_or_minutes := minutes;
                            GetDitem(gSettingsDialog, SECS_RADIO, itemType,
                                        itemHandle, itemRect);
                            SetCtLValue(ControLHandle(itemHandle), OFF);
                            GetDitem(gSettingsDialog, MINS_RADIO, itemType,
                                        itemHandle, itemRect);
                            SetCtLValue(ControLHandle(itemHandle), ON);
                            GetDitem(gSettingsDialog, S_OR_M_FIELD, itemType,
                                        itemHandle, itemRect);
                            SetIText(itemHandle, 'minutes');
                            GetDitem(gSettingsDialog, TIME_FIELD, itemType,
                                        itemHandle, itemRect);
                            SetIText(itemHandle, gDefaultMinsH^^);
                        end;
                end;
            end;
    end;

{----------------> HandleFileChoice <--}
    procedure Handle FileChoice (theitem: INTEGER);
        var
            timeString: Str255;
            countDownTime: LONGINT;
            itemType: INTEGER;
            itemRect: Rect;
            itemHandle: Handle;
            dummy: OSErr;
            fileMenu: MenuHandle;
    begin
        fileMenu := GetMHandleCFILE_MENU_ID);
        case theltem of
            CHANGE_ITEM:
                HandleDialog;
            START_STOP_ITEM:
                if gCounting then
                    begin
                        gCounting := FALSE;
                        Setitem(fileMenu, theitem, 'Start Countdown'>;
                    end
                else
                    begin
                        HiliteMenu(0);
                        GetDitem(gSettingsDialog, TIME_FIELD, itemType, itemHandle, 
                                itemRect);
                        GetIText(itemHandle, timeString);
                        StringToNum(timeString, countDownTime);
                        Disableitem(fileMenu, CHANGE_ITEM);
                        Setitem(fileMenu, theitem, 'Stop Countdown');
                        CountDown(countDownTime);
                        Enableitem(fileMenu, CHANGE_ITEM);
                        Setitem(fileMenu, theitem, 'Start Countdown');
                    end;
            KILL ITEM:
                begin
                    dummy := NMRemove(QElemPtr(@gMyNMRec));
                    HUnlock(Handle(gNotifyStrH));
                    Disableitem(fileMenu, KILL_ITEM);
                    gNotify_set := FALSE;
                end;
            QUIT_ITEM:
                begin
                    gCounting := FALSE;
                    gDone := TRUE;
                end;
        end;
    end;
{----------------> HandleAppleChoice <--}
    procedure HandleAppleChoice (theitem: INTEGER);
        var
            accName: Str255;
            accNumber, itemNumber, dummy: INTEGER;
            appleMenu: MenuHandle;
    begin
        case theitem of
            ABOUT _ITEM:
                dummy := NoteAlert(ABOUT_ALERT, nil);
            otherwise
                begin
                    appleMenu := GetMHandleCAPPLE_MENU_ID);
                    Getitem(appleMenu, theitem, accName);
                    accNumber .- OpenDeskAcc(accName);
                end;
        end;
    end;

{----------------> HandleMenuChoice <--}
    procedure HandleMenuChoice (menuChoice: LONGINT);
        var
            theMenu, theitem: INTEGER;
    begin
        if menuChoice <> 0 then
            begin
                theMenu := HiWord(menuChoice>;
                theitem := LoWord(menuChoice);
                case theMenu of
                    APPLE_MENU_ID:
                        HandleAppleChoice(theitem);
                    FILE_MENU_ID:
                        HandleFileChoice(theitem);
                end;
                HiliteMenu(Q);
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

{----------------> HandleEvent <--}
    procedure HandleEvent;
        var
            theChar: CHAR;
            dummy: BOOLEAN;
    begin
        dummy := WaitNextEvent(everyEvent, gTheEvent, SLEEP, nil);
        case gTheEvent.what of
            mouseDown:
                HandleMouseDown;
            keyDown, autoKey:
                begin
                    theChar := CHR(BitAnd(gTheEvent.message, charCodeMask));
                    if (BitAnd(gTheEvent.modifiers, cmdKey) <> Q) then
                        HandleMenuChoice(MenuKey(theChar));
                end;
        end;
    end;

{----------------> MainLoop <--}
    procedure MainLoop;
    begin

        gDone := FALSE;
        gCounting := FALSE;
        gNotify_set := FALSE;
        while gDone =FALSE do
            HandleEvent;
    end;

{----------------> Notifylnit <--}
    procedure Notifyinit;
    begin
        gNotifyStrH := GetString(BASE_RES_ID);
        gMyNMRec.qType := nmType;
        gMyNMRec.nmMark := MARK_APPLICATION;
        gMyNMRec.nmResp := nil;
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
        aMenu := GetMHandle(APPLE_MENU_ID);
        AddResMenu(aMenu, 'DRVR');
        DrawMenuBar;
    end;

{----------------> Dialoglnit <--}
    procedure Dialoglnit;
        var
            itemType: INTEGER;
            itemRect: Rect;
            itemHandle: Hand~e;
    begin
        gDefaultSecsH := GetString(DEFAULT_SECS_ID);
        gDefaultMinsH := GetString(DEFAULT_MINS_ID);
        gSettingsDialog := GetNewDialog(BASE_RES_ID, nil, WindowPtr(-1));
        GetDitem(gSettingsDialog, SECS_RADIO, itemType, itemHandle, itemRect);
        SetCtlValue(ControlHandle(itemHandle), ON);
        GetDitem(gSettingsDialog, SOUND_ON_BOX, itemType, itemHandle, itemRect);
        SetCtlValue(ControlHandle(itemHandle), ON);
        GetDitem(gSettingsDialog, ICON_ON_BOX, itemType, itemHandle, itemRect);
        SetCtlValue(ControlHandle(itemHandle), ON);
        GetDltem(gSettingsDialog, ALERT_ON_BOX, itemType, itemHandle, itemRect);
        SetCtlValue(ControlHandle(itemHandle), ON);
        gSeconds_or_minutes := seconds;
    end;

{----------------> Sys60rLater <--}
    function Sys60rLater: BOOLEAN;
        var
            status: OSErr;
            SysEnvData: SysEnvRec;
            dummy: INTEGER;
    begin
        status := SysEnvironsCSYS_VERSION, SysEnvData);
        if (status <> noErr) or CSysEnvData.systemVersion < $0600) then
            begin
                dummy := StopAlertCBAD_SYS_ALERT, nil);
                Sys60rLater := FALSE;
            end
        else
            Sys60rLater := TRUE;
    end;

{----------------> Reminder <--}
begin
    if Sys60rLater then
        begin
            Dialoglnit;
            MenuBarlnit;
            Notifylnit;
            MainLoop;
        end;
end.