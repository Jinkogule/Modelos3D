$fn = 100;
module seila(){
    cube([15, 15, 15], center = true);
    sphere(r = 10);    
    difference(){cube([40, 40, 40], center = true);sphere(r = 28);}
    square([40,40], center=true);

    module cilindros(){
        rotate([0,0,0])
        cylinder(h=40,r1=3,r2=3, center = true);
        rotate([-45,0,0])
        cylinder(h=50,r1=3,r2=3, center = true);
        rotate([45,0,0])
        cylinder(h=50,r1=3,r2=3, center = true);
        rotate([90,0,0])
        cylinder(h=40,r1=3,r2=3, center = true);
    }
    cilindros();
    rotate([0,90,0])cilindros();
    rotate([0,0,90])cilindros();
}

seila();