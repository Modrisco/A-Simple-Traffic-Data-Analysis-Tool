@ECHO OFF

title local DNS server checker
color 3

For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a-%%b)

echo =========================Welocome to use local DNS server checker!========================
echo ==============================Writeen by: Meng  Version: 3.0==============================
echo Let's start our test

echo A test start on DATE: %mydate% TIME: %mytime% 
echo A test start on DATE: %mydate% TIME: %mytime% > result2.txt

echo ping to local DNS servers
for /f "usebackq tokens=1-4 delims=," %%a in ("locallist.csv") do (
echo ping to %%a Primary DNS Server
echo ping to %%a Primary DNS Server >> result2.txt
ping %%b -n 5 >> result2.txt
echo. >> result2.txt
echo ====================================================================== >> result2.txt
echo. >> result2.txt
echo ping to %%a Secondary DNS Server
echo ping to %%a Secondary DNS Server >> result2.txt
ping %%c -n 5 >> result2.txt
echo. >> result2.txt
echo ====================================================================== >> result2.txt
echo ====================================================================== >> result2.txt
echo. >> result2.txt)


For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime2=%%a-%%b)
echo A ping test end on DATE: %mydate% TIME: %mytime2% 
echo A ping test end on DATE: %mydate% TIME: %mytime2% >> result2.txt

exit