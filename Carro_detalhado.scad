$fn = 200;
module carro(){
    difference(){
        union(){
            //corpo de baixo
            cube([60,20,10],center=true);
            //corpo do topo
            translate([5,0,10 - 0.001])
                cube([30,20,10],center=true);
            //roda frente esquerda
            translate([-20,-15,0])
                rotate([90,0,0])
                    cylinder(h=3,r=8,center=true);
            //roda frente direita
            translate([-20,15,0])
                rotate([90,0,0])
                    cylinder(h=3,r=8,center=true);
            //eixo da roda esquerda
            translate([20,-15,0])
                rotate([90,0,0])
                    cylinder(h=3,r=8,center=true);
            //eixo da roda direita
            translate([20,15,0])
                rotate([90,0,0])
                    cylinder(h=3,r=8,center=true);
            //eixo frontal
            translate([-20,0,0])
                rotate([90,0,0])
                    cylinder(h=30,r=2,center=true);
            //eixo traseiro
            translate([20,0,0])
                rotate([90,0,0])
                    cylinder(h=30,r=2,center=true);
            //cano 1
            translate([30,6,2])
                rotate([0,60,0])
                    cylinder(h=11,r=1.5,center=true);     
            //cano 2
            translate([30,-6,2])
                rotate([0,60,0])
                    cylinder(h=11,r=1.5,center=true);
                
            // detalhe roda da frente direita
            translate([-20,15,0])
                rotate([90,0,0])
                    cylinder(h=5,r=5,center=true);
                
            //detalhe da roda da frente esquerda
            translate([-20,-15,0])
                rotate([90,0,0])
                    cylinder(h=5,r=5,center=true);
                
            //detalhe da roda de trás direita
            translate([20,-15,0])
                rotate([90,0,0])
                    cylinder(h=5,r=5,center=true);
            // detalhe da roda de trás esquerda
            translate([20,15,0])
                rotate([90,0,0])
                    cylinder(h=5,r=5,center=true);       
            //detalhe capô
            translate([0,0,0.5])
                cube([61,2 ,10.2],center=true);                          
            //placa frontal
            translate([-30,0,0 - 0.001])
                cube([2,10,5],center=true);
            //placa traseira
            translate([30,0,0 - 0.001])
                cube([2,8,5],center=true);             
            //maçanetas
            translate([-2,0,1 - 0.001])
                rotate([0,90,0])
                cube([0.5,21,4],center=true);
            //faróis direita
            translate([0,7,-2])
                rotate([0,90,0])
                cylinder(h=63,r=1.5,center=true);             
            //faróis esquerda
            translate([0,-7,-2])
                rotate([0,90,0])
                cylinder(h=63,r=1.5,center=true);
            //decoração
            translate([10,0,0]){
                rotate([45,-60,0]){
                pontos = [[0,0,0], [10,0,0], [0,12,0], [0, 0, 12]];
                faces = [[0, 1, 2], [2, 1, 3], [0, 3, 1], [0, 2, 3]];
                translate([12,0,0])polyhedron(pontos, faces, 10);                  
                }
            }
            //janela frontal
            translate([-10,0,5])
                rotate(a=[90,-90,0])
                    linear_extrude(height = 18, center = true, convexity = 10, twist = 0)
                        polygon(points=[[0,0],[9.1,0],[0,5]], paths=[[0,1,2]]);
            //janela traseira
            translate([20,0,5])
                rotate(a=[90,-90,180])
                    linear_extrude(height = 18, center = true, convexity = 10, twist = 0)
                        polygon(points=[[0,0],[9.1,0],[0,5]], paths=[[0,1,2]]);
        }
        union(){
            //vazio da janela 1
            translate([12,0,10 - 0.001])
              cube([12,21,8],center=true);
            //vazio da janela 2
            translate([-2,0,10 - 0.001])
              cube([12,21,8],center=true);
            //vazio do corpo do topo do carro
            translate([5,0,10 - 2.001])
              cube([29,19,12],center=true);
            //vazio do corpo de baixo do carro
            cube([27,19,9],center=true);
            //vazio da janela frontal
            translate([-8.5,0,4])
              rotate(a=[90,-90,0])
                  linear_extrude(height = 17, center = true, convexity = 10, twist = 0)
                      polygon(points=[[0,0],[10.1,0],[0,5]], paths=[[0,1,2]]);
            //vazio da janela traseira
            translate([18.5,0,4])
              rotate(a=[90,-90,180])
                  linear_extrude(height = 17, center = true, convexity = 10, twist = 0)
                      polygon(points=[[0,0],[10.1,0],[0,5]], paths=[[0,1,2]]);
          }
     }
}

carro();