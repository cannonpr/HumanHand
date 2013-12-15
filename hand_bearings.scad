$fn=100;
//25
//30
//60
//120
module finger_tip(length=20){
difference(){
union(){
//fingertip shape
difference(){
hull(){
translate([-10/2,-4.5,-5])cube([10,16,length-10]);
translate([0,3.5,-5])cylinder(r=11/2,h=length);
#translate([7,-2.5,4])cylinder(r=4/2,h=length-10);
#translate([7,9.5,4])cylinder(r=4/2,h=length-10);
#translate([-1,3.5,14])sphere(4);
}
#translate([-7,-10,-10])cube([2,50,50]);
}
}
//tendon paths
#translate([6,3.5,-4])cylinder(r=4/2,h=length+10);
#translate([-2,3.5,-4.5])cylinder(r=4/2,h=length+10);
translate([-10/1,-2.5,-5.1])cube([23,12,length/5]);
//translate([0,-4.5,length-11])rotate([-90,0,0])inner_joint();
//Tightening holes
//#translate([-15,3.5,length-length*0.35])rotate([0,90,0])cylinder(r=3.3/2,h=30);
}
translate([0,-4.5,-8])rotate([-90,0,0])outer_joint();
}

module inner_carpal_joint(inner=12,outer=16,displace=-2,displace2=4,displace3=2){
difference(){
translate([displace3,-1.5,-1])cylinder(r=(inner+5)/2,h=outer+2);
translate([displace3,0,2.5])cylinder(r=(inner+5)/2,h=inner-1);
}
translate([displace3,displace,0])cylinder(r=3.3/2,h=30);
difference(){
translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=9/2,h=inner-4);
translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=6/2,h=inner-4);
}

difference(){
translate([7.5,-20,8])rotate([-90,0,0])cylinder(r=4/2,h=300);
translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=5/2,h=inner-4);
}
difference(){
translate([-3.5,-20,8])rotate([-90,0,0])cylinder(r=4/2,h=300);
translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=6/2,h=inner-4);
}


difference(){
union(){
hull(){
translate([-20,-5,8])rotate([0,90,0])cylinder(r=6.5/2,h=100);
translate([-20,6,8])rotate([0,90,0])cylinder(r=5/2,h=100);
}
}
#translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=6/2,h=inner-4);
}
}



module inner_joint(inner=12,outer=16,displace=-2,displace2=4,displace3=2){
difference(){
translate([displace3,-1.5,-1])cylinder(r=(inner+5)/2,h=outer+2);
translate([displace3,0,2.5])cylinder(r=(inner+5)/2,h=inner-1);
}
translate([displace3,displace,0])cylinder(r=3.3/2,h=30);
difference(){
translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=9/2,h=inner-4);
translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=6/2,h=inner-4);
}
difference(){
#translate([5,-20,8])rotate([-90,0,0])cylinder(r=3.5,h=300);
translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=6/2,h=inner-4);
}
difference(){
translate([0,-20,8])rotate([-90,0,0])cylinder(r=3.5,h=300);
translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=6/2,h=inner-4);
}


difference(){
union(){
hull(){
translate([-20,-5,8])rotate([0,90,0])cylinder(r=6.5/2,h=100);
translate([-20,6,8])rotate([0,90,0])cylinder(r=5/2,h=100);
}
}
#translate([displace3,displace,displace2])rotate([0,0,0])cylinder(r=6/2,h=inner-4);
}
}

module outer_joint(inner=12,outer=16){
difference(){
cylinder(r=inner/1.8,h=outer);
translate([2,0,2])cylinder(r=inner/1.3,h=inner);
translate([2,1,0])cylinder(r=3.3/2,h=30);
//translate([5,-10,0])cube([5,25,30]);
translate([-10,-10,0])cube([5,25,30]);
}

}

module finger(length=25){
translate([9.3,5.5,length-19])rotate([90,0,0])cylinder(r=1,h=4);
difference(){
union(){
translate([-10/2,-4.5,-5])cube([10,16,length]);
translate([4.6,3.5,-5])cylinder(r=11/2,h=length);
}
translate([-10/1,-2.5,-5.1])cube([23,12,length/5]);
#translate([0,-4.5,length-11])rotate([-90,0,0])inner_joint();
//Tightening holes
translate([-10,3.5,length-23])rotate([0,90,0])cylinder(r=3.3/2,h=30);
}


translate([0,-4.5,-8])rotate([-90,0,0])outer_joint();
}


module intermediate_bone(length=25){
finger(length);
}



module proximal_bone(length=60){
finger(length);
}

module metacarpal_bone(length=20){

difference(){
union(){
translate([-10/2,-4.5,-5])cube([10,12,length]);
translate([0,-6,6])rotate([-2,0,0])cylinder(r=10/2,h=length-20);
translate([0,9,6])rotate([2,0,0])cylinder(r=10/2,h=length-20);
}
translate([-10/1,-2.5,-5.1])cube([23,8,length/5]);
translate([0,-5,-0])rotate([-90,0,0])cylinder(r=3.3/2,h=30);
translate([0,-6,6])rotate([-2,0,0])cylinder(r=7/2,h=300);
translate([0,9,6])rotate([2,0,0])cylinder(r=7/2,h=300);

//Tightening holes
translate([-15,1.5,60])rotate([0,90,0])cylinder(r=9/2,h=30);
translate([-15,1.5,50])rotate([0,90,0])cylinder(r=9/2,h=30);
translate([-15,1.5,40])rotate([0,90,0])cylinder(r=9/2,h=30);
translate([-15,1.5,30])rotate([0,90,0])cylinder(r=9/2,h=30);
translate([-15,1.5,20])rotate([0,90,0])cylinder(r=9/2,h=30);
#translate([-15,1.5,70])rotate([0,90,0])cylinder(r=3/2,h=30);

}

}

module metacarpal_joint(length=20){
length = length - 60;
difference(){
union(){
cube([12,25,10]);

}
translate([-0.5,15,6])cube([15,16,13]);
translate([-0.5,15,-6])cube([15,16,13]);
translate([-2,5.5,7])rotate([0,90,0])inner_carpal_joint();
//translate([5,24,-2.5])rotate([0,0,0])cylinder(r=12,h=15);

}
translate([6,27,5])rotate([90,0,0])cylinder(h=13,r=3);
translate([6,27,5])sphere(6);
}



module metacarpal_ball(length=20){
length = length - 60;
difference(){
union(){
//translate([0,0,0])cylinder(h=6,r=6);
cube([12,8,8]);
}
//translate([0,0,0])cylinder(h=6,r=5);
#translate([6,14,4])rotate([90,0,0])cylinder(r=3.4/2,h=25);
#translate([-5,4,4])rotate([0,90,0])cylinder(r=3.4/2,h=25);

}
}

module wrist(){
difference(){
union(){
translate([0,0,0])rotate([0,0,0])cube([70,15,30]);
//translate([18,0,35])rotate([-90,0,0])cylinder(r=20,h=15);
//translate([52,0,35])rotate([-90,0,0])cylinder(r=20,h=15);
}
#translate([0,15/2,8])rotate([0,90,0])cylinder(r=3.4/2,h=81);
#translate([53,0,45])rotate([-90,0,0])sphere(12);
#translate([17,0,45])rotate([-90,0,0])sphere(12);
//translate([35,0,35])rotate([-90,0,0])cylinder(r=8.4/2,h=15);
#translate([0,0,0])rotate([0,0,0])cube([10,15,20]);
#translate([20,0,0])rotate([0,0,0])cube([10,15,20]);
#translate([40,0,0])rotate([0,0,0])cube([10,15,20]);
#translate([60,0,0])rotate([0,0,0])cube([10,15,20]);
}
}

module wrist_upper(){
difference(){
union(){
translate([0,0,0])rotate([0,0,0])cube([80,15,50]);
translate([66,15/2,40])rotate([0,0,90])cylinder(r=28/2,h=10);
translate([14,15/2,40])rotate([0,0,90])cylinder(r=28/2,h=10);
}
translate([66,15/2,35])rotate([0,0,90])cylinder(r=22/2,h=12);
translate([66,15/2,35])rotate([0,0,90])cylinder(r=14/2,h=15);

translate([14,15/2,35])rotate([0,0,90])cylinder(r=22/2,h=12);
translate([14,15/2,35])rotate([0,0,90])cylinder(r=14/2,h=15);

translate([5,0,0])rotate([0,0,0])cube([70,15,40]);
#translate([0,15/2,10])rotate([0,90,0])cylinder(r=3.4,h=100);

}
}

module wrist_universal_link(){
difference(){
union(){
translate([0,0,4])rotate([0,0,90])cylinder(r=28/2,h=10);
translate([0,-8,0])rotate([90,0,0])cylinder(r=28/2,h=10);
translate([0,18,0])rotate([90,0,0])cylinder(r=28/2,h=10);
}
translate([0,0,0])rotate([0,0,90])cylinder(r=22.2/2,h=12);
translate([0,0,0])rotate([0,0,90])cylinder(r=8.4/2,h=15);

#translate([0,-7,0])rotate([90,0,0])cylinder(r=13.2/2,h=9);
#translate([0,-8,0])rotate([90,0,0])cylinder(r=7/2,h=10);
#translate([0,16,0])rotate([90,0,0])cylinder(r=13.2/2,h=9);
#translate([0,18,0])rotate([90,0,0])cylinder(r=7/2,h=10);


//#translate([0,15/2,10])rotate([0,90,0])cylinder(r=3.4,h=100);

}
}

module upper_finger(length=20){
difference(){
hull(){
translate([-4,3.5,1])rotate([0,0,0])cylinder(r=11/2,h=length);
translate([-4,7.5,length])rotate([90,0,0])cylinder(r=11/2,h=8);
}
#translate([-4,3.5,8])rotate([0,-90,0])cylinder(r=3.4/2,h=12);
translate([-4,-2.5,1])rotate([0,0,0])cube([12,12,length+10]);
}

}

module roundness(radious=8){
difference(){
sphere(radious);
translate([0,0,-radious/2])sphere(radious);
}
}


//translate([0,0,2])inner_joint();
//rotate([0,90,0])outer_joint();

//rotate([0,90,0])finger_tip(20);
//translate([-20,0,0])rotate([0,90,0])intermediate_bone(20);
//translate([-70,0,0])rotate([0,90,0])proximal_bone(50);
//translate([-150,0,0])rotate([0,90,0])metacarpal_bone(80);

//translate([0,0,])rotate([0,-90,0])finger_tip(20);
//translate([0,20,0])rotate([0,-90,0])intermediate_bone(30);
//translate([0,40,0])rotate([0,-90,0])proximal_bone(50);
//translate([0,60,0])rotate([0,-90,0])metacarpal_bone(80);
//translate([0,80,0])rotate([0,-90,0])metacarpal_joint(80);

rotate([90,0,0])wrist();
//rotate([180,0,0])wrist_upper();
//translate([1,110,0])rotate([0,90,0])metacarpal_joint(80);
//rotate([0,90,0])upper_finger();
//wrist_universal_link();
//translate([-18,107.5,-5])rotate([0,0,0])metacarpal_ball(50);
//translate([0,110,0])rotate([0,90,0])metacarpal_bone(80);