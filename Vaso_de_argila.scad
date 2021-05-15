$fn = 100;
module vaso(){
    //parte de baixo do corpo do vaso
    rotate_extrude(convexity = 10){
        translate([8,0,0])
            rotate([65,10,7])
            square([1,26], center = true);
    }
    //parte de cima do corpo do vaso
    rotate_extrude(convexity = 10){
        translate([7,8.2,0])
            rotate([-81,10,7])
            square([1,23], center = true);
    }
    //junção da parte de baixo do corpo do vaso com a parte de cima do corpo do vaso
    rotate_extrude(convexity = 10){
        translate([8.9,6,])
            circle(r = 1);
    }
    //topo do vaso
    rotate_extrude(convexity = 10){
        translate([6.9,10.95,0])
            rotate([85,15,10])
            square([1,18], center = true);
    }
    //base
    translate([0,0,-5.4])
        cylinder(0.5,6.6,7,center=true);
    
    //alça 1
    translate([8,0,1])
    rotate([90,103,0])
        rotate_extrude(angle = 180,convexity = 10){
            translate([3.5,0,11,])
                circle(r = 0.8);
    }
    //alça 2
    translate([-8,0,1])
    rotate([90,257,0])
        rotate_extrude(angle = 180,convexity = 10){
            translate([3.5,0,11,])
                circle(r = 0.8);
    }
}

vaso();