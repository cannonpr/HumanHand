$fn=100;
//25
//30
//60
//120
module finger_tip(length=25){
cylinder(h = length, r=6);

sphere(8);

difference(){
translate([0,0,length])sphere(6);
#translate([-6,-6,29])cube([12,12,5]);
}
}


module finger_bone(length=25,sphere_size){
cube([6,6,length]);

difference(){

//translate([0,8/2,0])rotate([0,90,0])cylinder(h = 8, r=8);

}
translate([3,3,0])sphere(sphere_size);
}

module joint(bearing_size=10,bearing_width=5){
//cylinder(h = length, r=8);
difference(){
rotate([0,90,0]){cylinder(h = bearing_width+5, r=(bearing_size/2)+2);}
#translate([1,0,0])rotate([0,90,0])cylinder(h = (bearing_width)+0.5+2, r=(bearing_size/2)+0.5);

#translate([2.5,-25,-5])cube([bearing_width,50,25]);
}
}

module joint_sphere(ball_size=10){

difference(){
sphere(ball_size+2);
sphere(ball_size+0.5);
#translate([-15,-15,-4])cube([30,30,20]);



}
}

//translate([0,0,length])sphere(10);


//finger_tip(25);
module middle_bone(){
union(){
finger_bone(30,6);
translate([3,3,37])joint_sphere(6);
}
}
module lower_bone(){
union(){
finger_bone(60);
translate([3,3,68.5])joint_sphere(8);
}
}

middle_bone();