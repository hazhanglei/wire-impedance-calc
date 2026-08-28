@echo off
chcp 65001 >nul
echo ============================================
echo TH2512+ 插拔测试程序
echo ============================================
echo.
echo 使用方法:
echo   TH2512_PlugTest.exe --port COM4
echo.
echo 按 Ctrl+C 停止测试
echo ============================================
echo.

"E:\Hermes\00-配置档案总库\默认配置\04-成品导出目录\TH2512_PlugTest.exe" --port COM4

pause
