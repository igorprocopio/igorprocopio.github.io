@echo off
setlocal enabledelayedexpansion

set "PASTA_SITE=D:\000-Site_pessoal\igorprocopio"
cd /d "%PASTA_SITE%"

echo ============================================
echo   Publicando alteracoes do site do Igor
echo   Pasta: %PASTA_SITE%
echo ============================================
echo.

git add -A

set "msg=Atualizacao do site"
set /p "msg=Mensagem do commit (Enter para usar padrao): "
if "%msg%"=="" set "msg=Atualizacao do site"

git commit -m "%msg%"
if errorlevel 1 (
    echo.
    echo Nenhuma alteracao nova para commitar. Verificando se ha commits pendentes para enviar...
    echo.
)

echo.
echo Enviando para o GitHub...
git push origin main

echo.
echo ============================================
echo   Concluido! O site sera atualizado em
echo   alguns minutos em:
echo   https://igorprocopio.github.io
echo ============================================
echo.
pause
