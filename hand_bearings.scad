$fn=100;
//25
//30
//60
//120
module finger_tip(length=20){

difference(){
union(){


//fingertip shape
hull(){
translate([-10/2,-4.5,-5])cube([10,16,length-10]);
translate([0,3.5,-5])cylinder(r=11/2,h=length);
#translate([7,-2.5,4])cylinder(r=4/2,h=length-10);
#translate([7,9.5,4])cylinder(r=4/2,h=length-10);
#translate([-1,3.5,14])sphere(4);
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
translate([2,0,2])cylinder(r=inner/1.4,h=inner);
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
translate([0,-4.5,length-11])rotate([-90,0,0])inner_joint();

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

module metacarpal_bone(length=60){
finger(length);
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

translate([0,0,24])rotate([0,180,0])finger_tip(20);
translate([0,20,34])rotate([0,180,0])intermediate_bone(30);
translate([0,40,54])rotate([0,180,0])proximal_bone(50);
translate([0,60,84])rotate([0,180,0])metacarpal_bone(80);

