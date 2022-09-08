@ECHO OFF
:: Skript zur automatischen Erstellung einer STL Datei mit einem bestimmten Text. 
::
:: Parameter 1 - OpenScad Datei auf welche der Text platziert werden soll.
:: Parameter 2 - Text der auf auf das Modell gedruckt werden soll.         - Optional

echo:
echo Skript zur automatischen Erstellung einer STL Datei mit einem bestimmten Text. 
echo:
echo -----------------------------------------------------------------------------
echo Parameter 1 - OpenScad Datei auf welche der Text platziert werden soll.
echo Parameter 2 - Text der auf auf das Modell gedruckt werden soll. (Optional)
echo:
echo Beispiel Aufruf:
echo:
echo createPrintOneLine.bat ./scad/Schild.scad Moritz
echo -----------------------------------------------------------------------------
echo:

:: Prüfe ob Parameter 1 gegeben ist, falls ja werden Paramter gesetzt.
IF "%~1" == "" GOTO setParameters

:: Label zum Setzen der Parameter
:setParameters
set scadFile=%1
set textToPrint=%2

:: Prüfen ob die OpenScad Datei existiert, falls nicht wird das Programm beendet.
IF NOT EXIST "%scadFile%" (
    echo Datei %scadFile% existiert nicht.
    EXIT /B
)

echo Model wird mit folgenden Text bedruckt: %textToPrint%
echo:

:: Rufe OpenScad auf um die STL Datei zu genrieren.
set outputFileName=%textToPrint%.stl
set outputFilePath=./stl/generated/%outputFileName%
openscad -o %outputFilePath% %scadFile% -D "textToPrintLineOne = ""%textToPrint%"""

echo -----------------------------------------------------------------------------
echo:

:: Prüfen ob die STL Datei generiert worden ist.
IF EXIST %outputFilePath% (
    echo Model wurde erfolgreich bedruckt.
) ELSE (
    echo Beim Modellierungsvorgang ist ein Fehler aufgetreten.
    EXIT /B
)

:: Slicen wird von einer anderen Datei übernommen.
echo Starte generierung des GCODES.
call ./generateGCode.bat %outputFilePath%
