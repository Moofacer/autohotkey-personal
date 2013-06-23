@ECHO off
SETLOCAL EnableDelayedExpansion

SET firstNagle=0
SET state=1
SET doend=0
REM Just toggle nagle on all devices
for /f %%i in ('reg query HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces') do call :nagle %%i
if %doend% == 1 exit /B 1

REM Check MSMQ out, too
reg query HKLM\SOFTWARE\Microsoft\MSMQ\Parameters >nul 2>nul
if "%ERRORLEVEL%" == "1" goto :noMSMQ
reg add HKLM\SOFTWARE\Microsoft\MSMQ\Parameters /v TCPNoDelay /t REG_DWORD /d %state% /f >nul 2>nul

:noMSMQ
if %state% == 1 echo Nagle has been disabled successfully.
if %state% == 0 echo Nagle has been enabled successfully.

choice /M "Restart computer? (Not necessary for Vista SP1 or higher)" /D N /T 5
if "%ERRORLEVEL%" == "1" shutdown /r /t 0

:end
ENDLOCAL
goto :eof

:nagle Finds if nagle is set for given key and toggles it
REM Note this assumes it's a DWORD if it's already made
SET key=%1
SET key=HKLM\%key:~19%
if %doend% == 1 exit /B 1
if %firstNagle% == 0 (
  call :findState %key%
  SET firstNagle=1
)
reg add %key% /v TcpAckFrequency /t REG_DWORD /d %state% /f >nul 2>nul
if "%ERRORLEVEL%" == "1" (
  echo ERROR: Please run %~nx0 as administrator!
  SET doend=1
  exit /B 1
)
exit /B 0

:findState
reg query %key% /v TcpAckFrequency >nul 2>nul
if "%ERRORLEVEL%" == "1" (
	SET state=1
) else (
  for /f "skip=2 tokens=3" %%i in ('reg query %1 /v TcpAckFrequency') do (
	if "%%i" == "0x0" SET state=1
    if "%%i" == "0x1" SET state=0
  )
)
exit /B 0