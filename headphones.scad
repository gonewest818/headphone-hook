// dual-sided cubicle convenience hook
// for coats and headphones

wall   = 65;  // how deep is the wall we are hanging over
width  = 36;  // how wide is the strip
height = 40;  // how far down do the sides hang
thick  = 4;   // how thick are the strips
block  = 200;

difference() {
    union() {
        // top
        cube([wall, thick, width]);

        // sides
        translate([-thick, 0, 0])
            cube([thick, height, width]);
        translate([wall, 0, 0])
            cube([thick, height, width]);

        // headphone hook
        translate([wall, height+0.66*width, width/2]) rotate([0, 90, 0])
            cylinder(h=40, r=width, center=false, $fn=96);
        translate([wall+40, height+0.66*width, width/2]) rotate([0, 90, 0])
            cylinder(h=thick, r=width+thick, center=false, $fn=96);

        // coat hook
        translate([0, height+0.66*width, width/2]) rotate([0, -90, 0])
            cylinder(h=20, r=width, center=false, $fn=96);
        translate([-20, height+0.66*width, width/2]) rotate([0, -90, 0])
            cylinder(h=thick, r=width+thick, center=false, $fn=96);
    }
    // clipping the edges with big cubes
    translate([-60, 0,  width]) cube([block,block,block]);
    translate([-60, 0, -block]) cube([block,block,block]);
    translate([-60, height, 0]) cube([block,block,width]);
    translate([-60, height+0.66*width+thick, width/2]) rotate([0, 90, 0])
        cylinder(h=block, r=width, center=false, $fn=96);
}
