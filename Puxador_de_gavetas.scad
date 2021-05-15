//OBS: a maçaneta retangular não é parametrizável

$fn = 100;
module puxador_de_gaveta_circular(largura, grossura){
    rotate_extrude(angle = 180,convexity = 10, $fn = 100){
        translate([largura,0,0]){
            circle(r = grossura);
        }
    }           
}

module puxador_de_gaveta_retangular(){
    //curva 1
    translate([4,0,0]){
        rotate_extrude(angle = 90,convexity = 10, $fn = 100){
            translate([0.8,0,0]){
                circle(r = 0.8);
            }
        }
    }           
    //curva 2
    translate([-4,0,0]){
        rotate([0,0,90]){
            rotate_extrude(angle = 90,convexity = 10, $fn = 100){
                translate([0.8,0,0]){
                    circle(r = 0.8);
                }
            }
        }
    }
    //corpo do puxador
    rotate([90,0,90]){
        translate([0.8,0,0]){
            cylinder(h=8,r1=0.8,r2=0.8, center = true);
        }
    }
    //lateral 1
        rotate([90,0,0]){
            translate([0.8*6,0,2]){
            cylinder(h=4,r1=0.8,r2=0.8, center = true);
        }
    }
    //lateral 2
        rotate([90,0,0]){
            translate([-0.8*6,0,2]){
            cylinder(h=4,r1=0.8,r2=0.8, center = true);
        }
    }
}

puxador_de_gaveta_retangular();
translate([12,-3,0]){
    puxador_de_gaveta_circular(4,0.8);
}