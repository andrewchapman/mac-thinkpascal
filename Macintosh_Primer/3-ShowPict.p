program ShowPICT;
    const
        BASE RES ID = 400;
    var
        gPictureWindow: WindowPtr;
 
{----------------> CenterPict <--}
    procedure CenterPict (thePicture: PicHandle; var myRect: Rect);
        var
            windRect, pictureRect: Rect;
    begin
        windRect := myRect;
        pictureRect := thePictureAA.picFrame;
        myRect.top := (windRect.bottom - windRect.top -
                                (pictureRect.bottom - pictureRect.top))
                                div 2 + windRect.top;
        myRect.bottom := myRect.top + CpictureRect.bottom - pictureRect.top);
        myRect.left := CwindRect.right - windRect.left -
                                (pictureRect.right - pictureRect.left))
                                div 2 + windRect.left;
        myRect.right := myRect.left + (pictureRect.right - pictureRect.left);
    end;

{----------------> DrawMyPicture <--}
    procedure DrawMyPicture (pictureWindow: WindowPtr>;
        var
            myRect: Re ct;
            thePicture: PicHandle;
    begin
        myRect := pictureWindowA.portRect;
        thePicture := GetPicture(BASE_RES_ID);
        CenterPict(thePicture, myRect>;
        DrawPicture(thePicture, myRect);
    end;

{----------------> Windowlnit <--}
    procedure Windowlnit;
    begin
        gPictureWindow := GetNewWindow(BASE_RES_ID, nil, WindowPtr(-1 )) »;
        ShowWindow(gPictureWindow>;
        SetPortCgPictureWindow);
    end;

{----------------> ShowPICT <--}
begin
    Windowinit;
    DrawMyPicture(gPictureWindow);
    while (not Button) do
        begin
        end;    
end.