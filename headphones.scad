// dual-sided cubicle convenience hook
// for coats and headphones

wall   = 65;  // how deep is the wall we are hanging over
width  = 36;  // how wide is the strip
height = 40;  // how far down do the sides hang
thick  = 4;   // how thick are the strips
pinch  = 1.5; // slight "pinch" into the walls, in degrees
headphone = 40; // depth of the headphone side
coathook  = 20; // depth of the coat hook side

module hook(height, width, depth, thick) {
    intersection() {
        difference(){
            union() {
                cube([thick, height, width]);
                translate([0, height+0.66*width, width/2]) rotate([0, 90, 0])
                    cylinder(h=depth, r=width, center=false, $fn=96);
                translate([depth, height+0.66*width, width/2]) rotate([0, 90, 0])
                        cylinder(h=thick, r=width+thick, center=false, $fn=96);
            }
            translate([0, height+0.66*width, width/2]) rotate([0, 90, 0])
                cylinder(h=depth+thick+10, r=width-thick, center=false, $fn=96);
        }
        cube([depth+thick, height, width]);
    }
}

// top
cube([wall, thick, width]);

// headphone hook
translate([wall, 0, 0])
rotate([0, 0, pinch])
    hook(height, width, headphone, thick);

// coat hook
translate([0, 0, width])
rotate([0, 180, -pinch])
    hook(height, width, coathook, thick);
