$fn=100;
//25
//30
//60
//120
module finger_tip(length=15){

difference(){
translate([-14/2,-4.5,-1])cube([14,20,length]);
#translate([-10,4.5,length-5])rotate([0,90,0])cylinder(r=3.1/2,h=30);

}
translate([0,-4.5,-10])rotate([-90,0,0])outer_joint();

}





module inner_joint(bearing_size=13,bearing_width=5){
difference(){
union(){
hull(){
cylinder(r=(bearing_size+4)/2,h=bearing_width);
translate([0,0,5])cylinder(r=(bearing_size-5)/2,h=bearing_width);
}
hull(){
translate([0,0,10])cylinder(r=(bearing_size+4)/2,h=bearing_width);
translate([0,0,5])cylinder(r=(bearing_size-5)/2,h=bearing_width);
}
}
#translate([0,0,-1])cylinder(r=4/2,h=20);
translate([7,-19,0])cube([5,25,30]);
translate([-12,-10,0])cube([5,25,30]);
}
}

module outer_joint(bearing_size=13,bearing_width=5){
difference(){
cylinder(r=(bearing_size+8)/2,h=bearing_width+15);
#translate([0,2,0])cylinder(r=4.4/2,h=30);
translate([0,0,2.5])cylinder(r=22/2,h=15);


translate([7,-10,0])cube([5,25,30]);
translate([-12,-10,0])cube([5,25,30]);
}
translate([-5/2,-14.5,0])cube([5,5,20]);
}

module intermediate_bone(length=25){
union(){
difference(){
translate([-17/2,-2,-1])cube([14,20,length]);
#translate([-8,8,length-25])rotate([0,0,0])cylinder(r=4/2,h=30);
#translate([5,8,length-25])rotate([0,-0,0])cylinder(r=4/2,h=30);

}

translate([-1.5,0.5,length+6.5])rotate([-90,0,0])inner_joint();
translate([-1.5,-2,-9])rotate([-90,0,0])outer_joint();
}

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
//rotate([0,90,0])intermediate_bone(22);
rotate([0,90,0])finger_tip();
//translate([0,0,2])inner_joint();
//rotate([0,90,0])outer_joint();