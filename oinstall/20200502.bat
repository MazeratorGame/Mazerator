@echo off

echo Select an install method:
echo [7z] 7zip file (Will also download 7za to extract) (127mb) [exe] Installer (Requires admin) (145mb) [zip] Zip File (Will also download 7za to extract) (187mb) [port] Portable version (137mb)
set /P install="Choose a method [7z]: "
cls
if [%install%]==[] goto 202005027z
if %install%==7z goto 202005027z
if %install%==exe goto 20200502exe
if %install%==zip goto 20200502zip
if %install%==port goto 20200502port

:202005027z
set /P location="Where would you like to put it. Please note that directory must exist EXCEPT if you're using the default one. Also note that Mazerator 20200502 WILL be added at the end (except if kept blank) [C:\Mazerator\Mazerator 20200502\]: "
cls
if [%location%]==[] goto 202005027zB
goto 20200527zI

:202005027zB
cd C:\
mkdir Mazerator
cd Mazerator
cls
curl -LJO https://github.com/Awesome-Arcade/Mazerator-old/releases/download/Nightly-20200502/Mazerator.20200502.7z
cls
curl https://gitlab.com/awesome-arcade/waterbug-studios/mazerator/-/raw/master/7za.exe --output 7za.exe
7za e Mazerator.20200502.7z -spf
del 7za.exe
del Mazerator.20200502.7z
exit

:20200527zI
cd %location%
cls
curl -LJO https://github.com/Awesome-Arcade/Mazerator-old/releases/download/Nightly-20200502/Mazerator.20200502.7z
cls
curl https://gitlab.com/awesome-arcade/waterbug-studios/mazerator/-/raw/master/7za.exe --output 7za.exe
7za e Mazerator.20200502.7z -spf
del 7za.exe
del Mazerator.20200502.7z
exit

:20200502exe
cd /D %temp%
cls
curl -LJO https://github.com/Awesome-Arcade/Mazerator-old/releases/download/Nightly-20200502/Mazerator.20200502.exe
start Mazerator.20200502.exe
del Mazerator.20200502.exe
exit

:20200502zip
set /P location="Where would you like to put it. Please note that directory must exist EXCEPT if you're using the default one. Also note that Mazerator 20200502 WILL be added at the end (except if kept blank) [C:\Mazerator\Mazerator 20200502\]: "
cls
if [%location%]==[] goto 20200502zipB
goto 2020052zipI

:20200502zipB
cd C:\
mkdir Mazerator
cd Mazerator
cls
curl -LJO https://github.com/Awesome-Arcade/Mazerator-old/releases/download/Nightly-20200502/Mazerator.20200502.zip
cls
curl https://gitlab.com/awesome-arcade/waterbug-studios/mazerator/-/raw/master/7za.exe --output 7za.exe
7za e Mazerator.20200502.zip -spf
del 7za.exe
del Mazerator.20200502.zip
exit

:2020052zipI
cd %location%
cls
curl -LJO https://github.com/Awesome-Arcade/Mazerator-old/releases/download/Nightly-20200502/Mazerator.20200502.zip
cls
curl https://gitlab.com/awesome-arcade/waterbug-studios/mazerator/-/raw/master/7za.exe --output 7za.exe
7za e Mazerator.20200502.zip -spf
del 7za.exe
del Mazerator.20200502.zip
exit

:20200502port
cd /D %temp%
cls
curl -LJO https://github.com/Awesome-Arcade/Mazerator-old/releases/download/Nightly-20200502/MazeratorNightlyPortable_Nightly_20200502_English.paf.exe
start MazeratorNightlyPortable_Nightly_20200502_English.paf.exe
del MazeratorNightlyPortable_Nightly_20200502_English.paf.exe
exit