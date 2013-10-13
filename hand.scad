$fn=100;
//25
//30
//60
//120
module finger_tip(length=25){
cylinder(h = length, r=4);

sphere(4);

difference(){
translate([0,0,length])sphere(5);
#translate([-4,-4,29])cube([8,8,5]);
}
}


module finger_bone(length=25){
cube([4,4,length]);

difference(){

//translate([0,8/2,0])rotate([0,90,0])cylinder(h = 8, r=8);

}
translate([2,2,0])sphere(5);
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
sphere(ball_size);
sphere(ball_size-1);
#translate([-15,-15,-2])cube([30,30,20]);



}
}

//translate([0,0,length])sphere(10);


finger_tip(25);
union(){
//finger_bone(30);
//translate([2,2,34])joint_sphere(5);
}
//finger_bone(60);
//translate([2,2,64])joint_sphere(5);
