REM MANUAL ---
REM 1) Navicat off
REM Uninstall it with uninstall tool.

REM 2) Win + R, enter regedit, enter
REM Delete HKEY_CURRENT_USER\Software\PremiumSoft\Data
REM Expand HKEY_CURRENT_USER\Software\Classes\CLSID
REM Expand each subfolder. If it contains only one folder named Info, delete it

REM AUTO ---
REM This is cmd version but did not work for me. Remove by hand worked. You are welcome to develop and test it if you find errors.
@echo off

echo Delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration15XEN
echo waiting......
reg delete "HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration15XEN" /va /f
echo.

echo Delete Info folder under HKEY_CURRENT_USER\Software\Classes\CLSID
echo waiting......

for /f %%i in ('"REG QUERY "HKEY_CURRENT_USER\Software\Classes\CLSID" /s | findstr /E Info"') do (
    reg delete %%i /va /f
)

echo.
echo Finish

pause
