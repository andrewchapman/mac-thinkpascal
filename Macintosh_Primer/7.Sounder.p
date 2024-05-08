program Sounder;
    uses
        Sound;
    const
        BASE_RES ID = 400;
        SYNCHRONOUS = FALSE;
        ERROR_ALERT_ID = BASE_RES_ID + 1;
        CANT_LOAD_BEEP_SND = BASE_RES_ID;
        CANT_LOAD_MONKEY_SND = BASE_RES_ID + 1;
        CANT_LOAD_KLANK_SND = BASE_RES_ID + 2;
        CANT_LOAD_BOING_SND = BASE_RES_ID + 3;
        NIL_STRING = I I;
        HOPELESSLY_FATAL_ERROR = 'Game over, man!';
        BEEP_SND = 1;
        MONKEY_SND = 2;
        KLANK_SND = 3;
        BOING_SND = 4;

{----------------> ErrorHandler <--}
    procedure ErrorHandler (stringNum: INTEGER>;
        var
            errorStringH: StringHandle;
            dummy: INTEGER;
    begin
        errorStringH := GetString(stringNum);
        if errorStringH =nil then
            ParamText(HOPELESSLY_FATAL_ERROR, NIL_STRING, NIL_STRING, NIL_STRING)
        else
            ParamText(errorStringH^^, NIL_STRING, NIL_STRING, NIL_STRING);
        dummy := StopAlert(ERROR_ALERT_ID, nil);
        ExitToShell;
    end;

{----------------> MakeSound <--}
    procedure MakeSound;
        var
            soundHandle: Handle;
            dummy: OSErr;
    begin
        soundHandle := GetResource('snd ', BEEP_SND>;
        if soundHandle =nil then
            ErrorHandlerCCANT_LOAD_BEEP_SND);
        dummy := SndPlay(nil, soundHandle, SYNCHRONOUS);
        soundHandle := GetResource('snd ', MONKEY_SND);
        if soundHandle =nil then
            ErrorHandlerCCANT_LOAD_MONKEY_SND);
        dummy := SndPlay(nil, soundHandle, SYNCHRONOUS);
        soundHandle := GetResourceC'snd ', KLANK_SND);
        if soundHandle =nil then
            ErrorHandlerCCANT_LOAD_KLANK_SND);
        dummy := SndPlayCnil, soundHandle, SYNCHRONOUS);
        soundHandle := GetResource('snd ', BOING_SND);
        if soundHandle =nil then
            ErrorHandler(CANT_LOAD_BOING_SND);
        dummy.- SndPlay(nil, soundHandle, SYNCHRONOUS);
    end;
    
{----------------> Sounder <--}
begin
MakeSound;
end.
491