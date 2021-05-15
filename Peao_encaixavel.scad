/*
OBS: valores da parametrização são limitados (caso se queira manter o modelo "funcional").
Quanto maior os valores inserido nos parâmetros "f" e "m", mais limitado será o valor do
parâmetro "x" para que  continue funcional, além de, para o mesmo fim, o valor ideal de "t"
deve ser um valor entre 0,5 e 1.
*/

$fn=100;
module peao_encaixavel(f, m, t, x){ //parametrizável: somente o bico
    f=f; //"esticagem" do bico
    m=m; //grossura do corpo do bico
    t=t; //largura do corpo do bico
    x=x; //tamanho do peão
    h=10;
    s=2;
    //bico
    module bico(){
        difference(){
            difference(){
                union(){
                    translate([0,0,h/2+m]){
                        cylinder (r1=s+x, r2=1+x, h=f, center=true);
                    }
                    translate([0,0,h/2+m/2]){
                        cylinder(r=s-t+x, h=m, center=true);
                    }
                }
                translate([0,0,h/2+m]){
                    cube([s/3+x/2,s*2+x*2,f+m], center=true);
                }
            }
            rotate([0,0,90]){
                translate([0,0,h/2+m]){
                    cube([s/3,s*2+x*2,f+m], center=true);
                }     
            }
        }
    }
    //parque que o bico encaixa
    module modelo_encaixe(){
        translate([0,0,h/2+m]){
            cylinder (r1=s+x+0.3, r2=1+x+0.3, h=f, center=true);
        }
        translate([0,0,h/2+m/2]){
            cylinder(r=s-t+x+0.1, h=m+0.1, center=true);
        }
    }

    //parte de cima do peão
    module metade_de_cima(x){
        translate([0,0,x/2]){
        cylinder(h=5,r1=1+x/2,r2=2+x/2, center = true);
        }
        rotate([180,0,90]){
            difference(){
                translate([0,0,5]){
                    sphere(r=5+x/2);
                }
                translate([0,0,35]){
                    cube(size=60,center=true);
                } 
            }
            bico();
        }
    }

    //parte de baixo do peão		
    module metade_de_baixo(x){
        translate([0,0,x/2]){
            difference(){
                cylinder (r=0, r2 = 5+x/2, h=h+x/2, center=true);
                translate([0,0,10.1+x/2]){
                    rotate([0,180,90]){
                       modelo_encaixe();
                    }
                }
            }
        }
    }

    translate([0,0,10+x/2])
        metade_de_cima(x);
    translate([0,0,-10-x/2])
        metade_de_baixo(x);
}

peao_encaixavel(2,3,0.5,0);