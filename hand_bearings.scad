$fn=100;
//25
//30
//60
//120
module finger_tip(length=15){
difference(){
hull(){
translate([-17/2,-2,-1])cube([17,5,length]);
translate([0,-2,length])rotate([-90,0,0])inner_joint();
}
#translate([-10,0.5,length-4])rotate([0,90,0])cylinder(r=3.3/2,h=30);
translate([0,-4.5,-10])rotate([-90,0,0])outer_joint();
}
translate([0,-4.5,-10])rotate([-90,0,0])outer_joint();

}





module inner_joint(bearing_size=13,bearing_width=5){
difference(){
cylinder(r=(bearing_size+4)/2,h=bearing_width);
cylinder(r=bearing_size/2,h=bearing_width);
}
translate([-5/2,7,0])cube([5,5,5]);
}

module outer_joint(bearing_size=13,bearing_width=5){
difference(){
cylinder(r=(bearing_size+8)/2,h=bearing_width+5);
cylinder(r=4.4/2,h=30);
#translate([0,0,1.5])cylinder(r=9/2,h=7);
translate([0,3,2])cylinder(r=(bearing_size+12)/2,h=6);
translate([0,0,2.5])inner_joint();
#translate([8.5,-10,0])cube([5,25,10]);
#translate([-13.5,-10,0])cube([5,25,10]);
}
//translate([-5/2,-14.5,2])cube([5,5,5]);
}

module intermediate_bone(length=25){
union(){
difference(){
translate([-17/2,-2,-1])cube([17,5,length]);
#translate([-10,0.5,length-10])rotate([0,90,0])cylinder(r=3.3/2,h=30);
#translate([0,-3,length])rotate([-90,0,0])cylinder(r=13/2,h=7);
}

translate([0,-2,length])rotate([-90,0,0])inner_joint();
}
translate([0,-4.5,-9])rotate([-90,0,0])outer_joint();
}

module proximal_bone(length=60){
difference(){
translate([-17/2,-2,-1])cube([17,5,length]);
#translate([-10,0.5,length-10])rotate([0,90,0])cylinder(r=3.3/2,h=30);
#translate([0,-3,length])rotate([-90,0,0])cylinder(r=13/2,h=7);

}
translate([0,-4.5,-10])rotate([-90,0,0])outer_joint();
translate([0,-2,length])rotate([-90,0,0])inner_joint();

}

module metacarpal_bone(length=60){
difference(){
translate([-17/2,-2,-1])cube([17,5,length]);
#translate([-10,0.5,length-10])rotate([0,90,0])cylinder(r=3.3/2,h=30);
#translate([0,-3,length])rotate([-90,0,0])cylinder(r=13/2,h=7);
}
translate([0,-4.5,-10])rotate([-90,0,0])outer_joint();
translate([0,-2,length])rotate([-90,0,0])inner_joint();

}

//rotate([0,90,0])metacarpal_bone(80);
//rotate([0,90,0])proximal_bone(50);
//rotate([0,90,0])intermediate_bone(25);
rotate([0,90,0])finger_tip();
//translate([0,0,2])inner_joint();
//rotate([0,90,0])outer_joint();