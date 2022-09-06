// OpenSCAD Datei um ein Schild zwei Zeilig zu bedrucken 
// 
// ACHTUNG: Der Text darf nicht mehr als 15 Zeichen haben.

import("./../stl/Schild.stl");

fontToUse = "Liberation Sans";
fontSize = 8;
textToPrintLineOne = "Lorem ipsum dol";
textToPrintLineTwo = "Lorem ipsum dol";

// Text 1
translate([50, - 12, 5]) {
    linear_extrude(height = 1.5) {
        text(textToPrintLineOne, size = fontSize, font = fontToUse, halign = "center", valign = "center");
    }
}

// Text 2
translate([50, - 27, 5]) {
    linear_extrude(height = 1.5) {
        text(textToPrintLineTwo, size = fontSize, font = fontToUse, halign = "center", valign = "center")  ;
    }
}
