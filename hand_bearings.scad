$fn=100;
//25
//30
//60
//120
module finger_tip(length=20){
finger(length);
}





module inner_joint(inner=12,outer=16){
difference(){
translate([0,0,-1])cylinder(r=(inner+5)/2,h=outer+2);
translate([0,0,2.5])cylinder(r=(inner+5)/2,h=inner-1);
}
#translate([3,-3,0])cylinder(r=3.3/2,h=30);
difference(){
#translate([3,-3,4])rotate([0,0,0])cylinder(r=9/2,h=inner-4);
#translate([3,-3,4])rotate([0,0,0])cylinder(r=5/2,h=inner-4);
}
}

module outer_joint(inner=12,outer=16){
difference(){
cylinder(r=inner/2,h=outer);
#translate([0,0,2])cylinder(r=inner/2,h=inner);
#translate([0,1,0])cylinder(r=3.3/2,h=30);
translate([5,-10,0])cube([5,25,30]);
//translate([-10,-10,0])cube([5,25,30]);
}

}

module finger(length=25){
difference(){
union(){
translate([-10/2,-4.5,-5])cube([10,16,length]);
translate([4.6,3.5,-5])cylinder(r=11/2,h=length);
}
translate([-10/2,-2.5,-5.1])cube([18,12,length/4]);
#translate([0,-4.5,length-11])rotate([-90,0,0])inner_joint();
//#translate([0,3.5,length-15])roundness(15);

//Tightening holes
//#translate([-10,0,length-20])rotate([0,90,0])cylinder(r=2.1/2,h=30);
#translate([-10,3.5,length-length*0.65])rotate([0,90,0])cylinder(r=3.3/2,h=30);
//#translate([-10,7,length-20])rotate([0,90,0])cylinder(r=2.1/2,h=30);

//upper
//#translate([-3,0,-10])rotate([0,0,0])cylinder(r=2/2,h=length+40);
#translate([-1,3.5,-10])rotate([0,0,0])cylinder(r=4/2,h=length+40);
//#translate([-3,7,-10])rotate([0,0,0])cylinder(r=2/2,h=length+40);

//lower
#translate([7,3.5,-10])rotate([0,0,0])cylinder(r=4/2,h=length+40);
//#translate([3,3.5,-10])rotate([0,0,0])cylinder(r=2/2,h=length+40);
//#translate([3,7,-10])rotate([0,0,0])cylinder(r=2/2,h=length+40);
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

//rotate([0,90,0])finger_tip();
//translate([-20,0,0])rotate([0,90,0])intermediate_bone(22);
//translate([-66,0,0])rotate([0,90,0])proximal_bone(50);
//translate([-142,0,0])rotate([0,90,0])metacarpal_bone(80);

translate([0,0,24])rotate([0,180,0])finger_tip(24);
translate([0,20,34])rotate([0,180,0])intermediate_bone(34);
translate([0,40,54])rotate([0,180,0])proximal_bone(54);
translate([0,60,84])rotate([0,180,0])metacarpal_bone(84);

