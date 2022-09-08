@ECHO OFF
:: Skript zur automatischen Erstellung einer gcode.
::
:: Parameter 1 - *.stl Datei welche gesliced werden soll.
:: Prüfe ob Parameter 1 gegeben ist, falls ja werden Parameter gesetzt.
IF "%~1" == "" GOTO setParameters

:: Label zum Setzen der Parameter
:setParameters
set stlFile=%1
set configFile=./config/config.ini

:: Prüfe ob benötigte Dateien vorhanden sind (*.stl, config.ini)
:: *.stl
IF NOT EXIST "%stlFile%" (
    echo Datei %stlFile% existiert nicht.
    EXIT /B
)

:: config.ini
IF NOT EXIST "%configFile%" (
    echo Datei %configFile% existiert nicht.
    EXIT /B
)

:: Hole Namen für die gCode Datei.
set outputFile=%stlFile:~0,-4%
set outputFile=%outputFile:~16%

:: *.stl Datei wird nun gesliced
prusa-slicer -g %stlFile% --load %configFile% --output ./output/%outputFile%.gcode

:: Prüfen ob die gCode Datei generiert worden ist.
IF EXIST ./output/%outputFile%.gcode (
    echo Model wurde gesliced und ist unter ./output/%outputFile%.gcode zu finden.
) ELSE (
    echo Beim slicen ist ein Fehler aufgetreten.
    EXIT /B
)

echo:
echo -----------------------------------------------------------------------------
echo:
