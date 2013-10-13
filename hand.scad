$fn=100;
//25
//30
//60
//120
module finger_tip(length=25){
cylinder(h = length, r=8);
difference(){
sphere(10);
#translate([-15,-15,-12])cube([30,30,5]);
}
translate([0,0,length])sphere(8);
}

module finger_bone(length=25){
cylinder(h = length, r=8);
difference(){
sphere(10);
#translate([-15,-15,-12])cube([30,30,5]);
}
//translate([0,0,length])sphere(10);
}

module joint(ball_size=10){
//cylinder(h = length, r=8);
difference(){
sphere(ball_size+1);
sphere(ball_size);
#translate([(-ball_size*4)/2,(-ball_size*1.8)/2,0])cube([ball_size*4,ball_size*1.8,ball_size*2]);
}
}

//translate([0,0,length])sphere(10);


//finger_tip(25);
union(){
finger_bone(30);
translate([0,0,39])joint(11);
}
//finger_bone(60);
