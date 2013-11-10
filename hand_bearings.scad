$fn=100;
//25
//30
//60
//120
module finger_tip(length=15){

difference(){
translate([-10/2,-4.5,-5])cube([10,16,length]);
translate([-10/2,-2.5,-5])cube([10,12,length-10]);
#translate([-10,3.5,length-8])rotate([0,90,0])cylinder(r=3.1/2,h=30);
#translate([-10,12,length-4])rotate([0,90,0])cylinder(r=10/2,h=30);
#translate([-10,-5,length-4])rotate([0,90,0])cylinder(r=10/2,h=30);
#translate([-5,20,length-5])rotate([90,0,0])cylinder(r=10/2,h=30);
#translate([-6,3.5,length-20])rotate([0,0,0])cylinder(r=5/2,h=30);
#translate([6,3.5,length-20])rotate([0,0,0])cylinder(r=5/2,h=30);
}
translate([0,-4.5,-10])rotate([-90,0,0])outer_joint();
}





module inner_joint(inner=12,outer=16){
difference(){
cylinder(r=(inner+4)/2,h=outer);
#translate([0,0,2])cylinder(r=(inner+4)/2,h=inner);


}
#translate([0,0,0])cylinder(r=4.4/2,h=30);
}

module outer_joint(inner=12,outer=16){
difference(){
cylinder(r=inner/2,h=outer);
#translate([0,0,2])cylinder(r=inner/2,h=inner);
#translate([0,0,0])cylinder(r=4.4/2,h=30);



translate([5,-10,0])cube([5,25,30]);
translate([-10,-10,0])cube([5,25,30]);
}
//translate([-5/2,-10,0])cube([5,5,outer]);
}

module intermediate_bone(length=25){
difference(){
translate([-10/2,-4.5,-5])cube([10,16,length]);
translate([-10/2,-2.5,-5])cube([10,12,length-15]);
#translate([-10,3.5,length-8])rotate([0,90,0])cylinder(r=3.1/2,h=30);
#translate([0,-4.5,12])rotate([-90,0,0])inner_joint();


#translate([-6,3.5,length-20])rotate([0,0,0])cylinder(r=5/2,h=30);
#translate([6,3.5,length-20])rotate([0,0,0])cylinder(r=5/2,h=30);
}
translate([0,-4.5,-10])rotate([-90,0,0])outer_joint();
}



module proximal_bone(length=60){
difference(){
translate([-17/2,-2,-1])cube([17,5,length]);
#translate([-10,0.5,-length+50])rotate([0,25,0])cylinder(r=3.1/2,h=length);
#translate([10,0.5,length-50])rotate([0,-25,0])cylinder(r=3.1/2,h=length);
#translate([0,-3,length])rotate([-90,0,0])cylinder(r=13/2,h=7);

}
translate([0,-4.5,-10])rotate([-90,0,0])outer_joint();
translate([0,-2,length])rotate([-90,0,0])inner_joint();

}

module metacarpal_bone(length=60){
difference(){
translate([-17/2,-2,-1])cube([17,5,length]);
#translate([-10,0.5,-length+80])rotate([0,15,0])cylinder(r=3.1/2,h=length);
#translate([10,0.5,length-80])rotate([0,-15,0])cylinder(r=3.1/2,h=length);
#translate([0,-3,length])rotate([-90,0,0])cylinder(r=13/2,h=7);
}
translate([0,-4.5,-10])rotate([-90,0,0])outer_joint();
translate([0,-2,length])rotate([-90,0,0])inner_joint();

}

//rotate([0,90,0])metacarpal_bone(80);
//rotate([0,90,0])proximal_bone(50);


//translate([0,0,2])inner_joint();
//rotate([0,90,0])outer_joint();
//rotate([0,90,0])finger_tip();
rotate([0,90,0])intermediate_bone(22);