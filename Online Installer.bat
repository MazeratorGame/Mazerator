@echo off

echo Welcome to the online installer! To start, please choose an install method:
echo [20200502] Nightly 20200502 [20200428] Nightly 20200428 [20200420] Nightly 20200420 [20200410] Nightly 20200410 [20200328] Nightly 20200328 [20200321] Nightly 20200321
set /P version="Choose a version [20200502]: "
cls
if [%version%]==[] goto 20200502
if %version%==20200321 goto 20200502

:20200502
curl "https://gitlab.com/api/v4/projects/18898692/repository/files/oinstall%2f20200502.bat/raw?ref=master" --output "20200502.bat"
cls
cmd /c "20200502.bat"
del "20200502.bat"
cls
exit