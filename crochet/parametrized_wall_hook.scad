width=15;
thick=10;
rad=26;
roundrad=3.5; //less than thick/2
height=50;
theight=15;
roundsegs=12;

sthick=thick-roundrad*2;

wall_hook();

module wall_hook()
{
	difference(){
    	translate([0,0,0.5])

	minkowski(){
	union() {
		// hook
		difference() {
			cylinder(h=width-1, r=rad+sthick/2);
			translate(v=[0,0,-1]) cylinder(h=width+1, r=rad-sthick/2);
			translate(v=[-rad-sthick,0,-1]) cube(size=[2*rad+2*sthick,rad+sthick,width+4]);
		}
// wall 
		translate(v=[-rad-sthick/2,0,0]) cube(size=[sthick,height,width-1]);
// end-tip
		translate(v=[rad-sthick/2,0,0]) cube(size=[sthick,theight,width-1]);
	}
	cylinder(h=1,r=roundrad,$fn=roundsegs,center=true);
}


			// screw hole
	translate(v=[-rad,height-10,width/2]) rotate(a=[0,90,0]) cylinder(h=15, r=2, $fn=12,center=true);
	// translate(v=[-rad+thick/2,height-10,width/2]) rotate(a=[0,90,0]) cylinder(h=5, r1=1.5, r2=6,$fn=12,center=true);
if (height>30) {
	translate(v=[-rad,theight,width/2]) rotate(a=[0,90,0]) cylinder(h=15, r=2, $fn=12,center=true);
	// translate(v=[-rad+thick/2,theight,width/2]) rotate(a=[0,90,0]) cylinder(h=5, r1=1.5, r2=6,$fn=12,center=true);

}
}
}



