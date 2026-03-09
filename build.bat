@echo off
setlocal enabledelayedexpansion

set TEXINPUTS=.\cls//;%TEXINPUTS%
set BSTINPUTS=.\cls//;%BSTINPUTS%
set BUILD_SUCCESS=1

echo ========== Compiling ==========

xelatex -interaction=nonstopmode thesis
if errorlevel 1 (
    echo [ERROR] xelatex first pass failed
    set BUILD_SUCCESS=0
    goto :end
)

biber thesis
if errorlevel 1 (
    echo [ERROR] biber failed
    set BUILD_SUCCESS=0
    goto :end
)

xelatex -interaction=nonstopmode thesis
if errorlevel 1 (
    echo [ERROR] xelatex second pass failed
    set BUILD_SUCCESS=0
    goto :end
)

xelatex -interaction=nonstopmode thesis
if errorlevel 1 (
    echo [ERROR] xelatex third pass failed
    set BUILD_SUCCESS=0
    goto :end
)

echo ========== Cleaning intermediate files ==========

if exist thesis.aux del /f /q thesis.aux
if exist thesis.log del /f /q thesis.log
if exist thesis.toc del /f /q thesis.toc
if exist thesis.lot del /f /q thesis.lot
if exist thesis.lof del /f /q thesis.lof
if exist thesis.out del /f /q thesis.out
if exist thesis.bbl del /f /q thesis.bbl
if exist thesis.blg del /f /q thesis.blg
if exist thesis.bcf del /f /q thesis.bcf
if exist thesis.run.xml del /f /q thesis.run.xml
if exist thesis.fls del /f /q thesis.fls
if exist thesis.fdb_latexmk del /f /q thesis.fdb_latexmk
if exist thesis.synctex.gz del /f /q thesis.synctex.gz
if exist thesis.xdv del /f /q thesis.xdv
if exist thesis.nls del /f /q thesis.nls
if exist thesis.nlo del /f /q thesis.nlo
if exist thesis.glo del /f /q thesis.glo
if exist thesis.gls del /f /q thesis.gls
if exist thesis.idx del /f /q thesis.idx
if exist thesis.ilg del /f /q thesis.ilg
if exist thesis.ind del /f /q thesis.ind
if exist thesis.thm del /f /q thesis.thm
if exist thesis.nav del /f /q thesis.nav
if exist thesis.snm del /f /q thesis.snm
if exist thesis.vrb del /f /q thesis.vrb
del /f /q chapters\*.aux 2>nul

:end
if "!BUILD_SUCCESS!"=="1" (
    echo ========== Build complete! ==========
    echo Output: thesis.pdf
) else (
    echo ========== Build FAILED! ==========
    echo Check thesis.log for error details.
    echo Intermediate files NOT cleaned for debugging.
)

endlocal
