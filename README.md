# Druck Automation für beschriftete Modelle
 
## Voraussetzungen

### OpenSCAD
- Installation von OpenSCAD https://openscad.org/downloads.html
- Eintragen von OpenSCAD in die PATH Umgebungsvariable des Benutzers.

### PrusaSlicer
- Installation von OpenSCAD https://www.prusa3d.com/page/prusaslicer_424/#_ga=2.216823574.1054343035.1662462029-1966612289.1661154430
- Eintragen von PrusaSlicer in die PATH Umgebungsvariable des Benutzers.

Mit diesen beiden Tools wird die Generierung einer STL sowie gcode realisiert.

# Benutzung Skripte
Für das Schreiben von individuellem Text auf ein Modell wird OpenSCAD benutzt, hierfür muss für das bestimmte Modell eine *.scad Datei erstellt werden.
Diese Datei beschreibt, wo sich der Text auf dem Modell befindet. Mithilfe dieser *.scad Datei und dem BATCH Skript wird eine *.stl Datei generiert, 
welche dann mithilfe des PrusaSlicer commandLine Interfaces für 3D-Drucker vorbereitet werden kann.

## Beispiel Aufruf Skript - Zweizeilig
- <em>**.\createPrintTwoLine.bat** .\scad\twoLineSign.scad Moritz Vogt</em>
## Beispiel Aufruf Skript - Einzeilig
- <em>**.\createPrintOneLine.bat** .\scad\oneLineSign.scad Moritz</em>
