program ShowClip;
    const
        BASE_RES_ID = 400;
        ERROR_ALERT_ID = BASE RES ID + 1;
        NO_WIND = BASE_RES_ID;
        EMPTY_SCRAP = BASE_RES_ID + 1;
        NIL_STRING = '';
        HOPELESSLY_FATAL_ERROR ='Game over, man!'; 
    var
        gClipWindow: WindowPtr;
{----------------> ErrorHandler <--}
    procedure ErrorHandler CstringNum: INTEGER);
        var
            errorStringH: StringHandle;
            dummy: INTEGER;
    begin
        errorStringH := GetStringCstringNum>;
        if errorStringH =nil then
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
        pictureRect := thePicture^^.picFrame;
        myRect.top := (windRect.bottom - windRect.top - (pictureRect.bottom - 
                        pictureRect.top))   div 2 + windRect.top;
        myRect.bottom := myRect.top + (pictureRect.bottom - pictureRect.top);
        myRect.left := (windRect.right - windRect.left - (pictureRect.right - 
                        pictureRect.left)) div 2 + windRect.left;
        myRect.right .- myRect.left + (pictureRect.right - pictureRect.left);
    end;

{----------------> MainLoop <--}
    procedure MainLoop;
        var
            myRect : Rect ;
            clipHandle: Handle;
            length, offset: LONGINT;
    begin
        clipHandle := NewHandle(Q);
        length := GetScrap(clipHandle, 'TEXT', offset);
        if length < 0 then
            begin
                length := GetScrap(clipHandle, 'PICT', offset);
                if length < 0 then
                    ErrorHandler(EMPTY_SCRAP)
                else
                    begin
                        myRect := gClipWindowA.portRect;
                        CenterPict(PicHandle(clipHandle), myRect);
                        DrawPicture(PicHandleCclipHandle), myRect);
                    end; 
            end;
        else
            begin
                HLock(clipHandle);
                TextBox(Ptr(clipHandle^), length, thePortA.portRect, teJustLeft);
                HUnlock(clipHandle);
            end;
        while not Button do
            begin
            end;
    end;

{----------------> Window!nit <--}
    procedure WindowInit;
    begin
        gClipWindow := GetNewWindow(BASE_RES_ID, nil, WindowPtr (-1));
        if gClipWindow =nil then
            ErrorHandler(NO_WIND);
        ShowWindow(gClipWindow);
        SetPort(gClipWindow);
    end;
{----------------> ShowClip <--}
begin
    WindowInit;
    MainLoop;
end.