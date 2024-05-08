program PrintPICT;
    uses
    Printing;

    const
        HEADER_SIZE = 512;
        BASE RES ID = 400;
        ERROR_ALERT_ID = BASE_RES_ID;
        CANT_OPEN_FILE = BASE_RES_ID;
        GET_EOF_ERROR = BASE_RES_ID + 1;
        HEADER_TOO_SMALL = BASE_RES_ID + 2;
        OUT_OF_MEMORY = BASE_RES_ID + 3;
        CANT_READ_HEADER = BASE_RES ID + 4;
        CANT_READ_PICT = BASE_RES_ID + 5;
        NIL_STRING = '';
        IGNORED_STRING = NIL_STRING;
        HOPELESSLY_FATAL_ERROR = 'Game over, man!';
    var
        gPrintRecordH: THPrint;
        gReply: SFReply;

{----------------> ErrorHandler <--}
    procedure ErrorHandler CstringNum: INTEGER>;
    var
        errorStringH: StringHandle;
        dummy: INTEGER;
    begin
        errorStringH := GetStringCstringNum>;
        if errorStringH =nil then
            ParamText(HOPELESSLY_FATAL_ERROR, NIL_STRING, NIL_STRING, NIL_STRING)
        else
            ParamText(errorStringHAA, NIL_STRING, NIL_STRING, NIL_STRING>;
        dummy := StopAlertCERROR_ALERT_ID, nil);
        ExitToShell;
    end;

{----------------> PrintPictFile <--}
    procedure PrintPictFile (reply: SFReply>;
        var
            srcFile: INTEGER;
            printPort: TPPrPort;
            printStatus: TPrStatus;
            thePict: PicHandle;
            pictHeader: packed array[O .. HEADER_SIZEJ of CHAR;
            pictSize, headerSize: LONGINT;
            dummy: OSErr;
    begin
        if (FSOpenCreply.fName, reply.vRefNum, srcFile) <> noErr) then
            ErrorHandler(CANT_OPEN_FILE);
        if (GetEOF(srcFile, pictSize) <> noErr) then
            ErrorHandler(GET_EOF_ERROR);
        headerSize := HEADER_SIZE;
        if (FSRead(srcFile, headerSize, @pictHeader) <> noErr) then 
            ErrorHandler(CANT_READ_HEADER);
        pictSize := pictSize - HEADER_SIZE;
        if pictSize <= 0 then
            ErrorHandler(HEADER_TOO_SMALL);
        thePict := PicHandle(NewHandle(pictSize));
        if thePict = nil then
            ErrorHandler(OUT_OF_MEMORY);
        HLock(Handle(thePict));
        if FSRead(srcFile, pictSize, Ptr(thePictA)) <> noErr then
            ErrorHandler(CANT_READ_PICT);
        dummy := FSClose(srcFile);
        printPort := PrOpenDoc(gPrintRecordH, nil, nil);
        PrOpenPage(printPort, nil);
        DrawPicture(thePict, thePictAA.picFrame);
        PrClosePage(printPort);
        PrCloseDoc(printPort);
        PrPicFile(gPrintRecordH, nil, nil, nil, printStatus);
        HUnlock(Handle(thePict));
    end;

{----------------> DoDialogs <--}
    function DoDialogs: BOOLEAN;
        var
            keepGoing: BOOLEAN;
    begin
        keepGoing := PrStlDialog(gPrintRecordH);
        if keepGoing then
            DoDialogs .- PrJobDialog(gPrintRecordH)
        else
            DoDialogs := FALSE;
    end;

{----------------> GetFileName <--}
    procedure GetFileName (var replyPtr: SFReply);
        var
            myPoint: Point;
            typeList: SFTypeList;
            numTypes: INTEGER;
    begin
        myPoint.h := 100;
        myPoint.v := 100;
        typeList[0] := 'PICT';
        numTypes : = 1;
        SFGetFile(myPoint, IGNORED_STRING, nil, numTypes, typeList, nil, replyPtr);
    end;

{----------------> Printinit <--}
    procedure Printinit;
    begin
        gPrintRecordH := THPrint(NewHandle(sizeofCTPrint)));
        PrOpen;
        PrintDefault(gPrintRecordH);
    end;

{----------------> PrintPICT <--}
begin
    Printinit;
    GetFileName(gReply);
    if gReply.good then
        begin
            if DoDialogs then
                PrintPictFile(gReply);
        end;
end.