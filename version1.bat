@ECHO OFF

title trafficdatacatcher_version1.0
color 3

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a-%%b)

echo =========================Welocome to use the traffic data catcher!========================
echo ================================Writer: Meng  Version: 1.0================================
echo Let's start our test, please press any key
pause
echo A test start on DATE: %mydate% TIME: %mytime% 
echo A test start on DATE: %mydate% TIME: %mytime% > ping_result_%ComputerName%_%mydate%_%mytime%.txt

echo First, let's get the configeration of your network adapter
ipconfig /all
ipconfig /all > ping_result_%ComputerName%_%mydate%_%mytime%.txt
pause

echo ping to DNS servers
for /f "usebackq tokens=1-4 delims=," %%a in ("list.csv") do (
echo ping to %%a Primary DNS Server
echo ping to %%a Primary DNS Server >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
ping %%b -n 5 >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ping to %%a Secondary DNS Server
echo ping to %%a Secondary DNS Server >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
ping %%c -n 5 >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt)
pause

echo ping to IP addresses
for /f %%i in (iplist.txt) do (
echo ping to %%i
echo ping to %%i >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
ping -w 1 -n 5 %%i >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt)
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt

echo trace to IP addresses
for /f %%i in (iplist.txt) do (
echo trace to %%i
echo trace to %%i >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
tracert -d %%i >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt)
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo ====================================================================== >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
echo. >> ping_result_%ComputerName%_%mydate%_%mytime%.txt

For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime2=%%a-%%b)
echo A ping test end on DATE: %mydate% TIME: %mytime2% 
echo A ping test end on DATE: %mydate% TIME: %mytime2% >> ping_result_%ComputerName%_%mydate%_%mytime%.txt
pause


start   "C:\Program Files\Internet Explorer\IEXPLORE.EXE" www.ipip.net
exit