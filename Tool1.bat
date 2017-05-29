@ECHO OFF

title trafficdatacatcher_version3.0
color 3

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a-%%b)

echo =========================Welocome to use the traffic data catcher!========================
echo ==============================Writeen by: Meng  Version: 3.0==============================
echo Let's start our test

echo First, let's get the configuration of your network adapter
ipconfig /all
ipconfig /all > result1.txt

echo ping to DNS servers
for /f "usebackq tokens=1-4 delims=," %%a in ("list.csv") do (
echo ping to %%a Primary DNS Server
echo ping to %%a Primary DNS Server >> result1.txt
ping %%b -n 5 >> result1.txt
echo. >> result1.txt
echo ====================================================================== >> result1.txt
echo. >> result1.txt
echo ping to %%a Secondary DNS Server
echo ping to %%a Secondary DNS Server >> result1.txt
ping %%c -n 5 >> result1.txt
echo. >> result1.txt
echo ====================================================================== >> result1.txt
echo ====================================================================== >> result1.txt
echo. >> result1.txt)

echo ping to IP addresses
for /f %%i in (iplist.txt) do (
echo ping to %%i
echo ping to %%i >> result1.txt
ping -w 1 -n 5 %%i >> result1.txt
echo ====================================================================== >> result1.txt
echo. >> result1.txt)
echo ====================================================================== >> result1.txt
echo ====================================================================== >> result1.txt
echo. >> result1.txt

echo trace to IP addresses
echo trace to www.bupt.edu.cn
echo trace to www.bupt.edu.cn >> result1.txt
tracert www.bupt.edu.cn >> result1.txt
echo. >> result1.txt 
echo ====================================================================== >> result1.txt
echo ====================================================================== >> result1.txt

For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime2=%%a-%%b)
echo A ping test end on DATE: %mydate% TIME: %mytime2% 
echo A ping test end on DATE: %mydate% TIME: %mytime2% >> result1.txt

exit