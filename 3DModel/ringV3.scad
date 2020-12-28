smooth = 60;
$fn=smooth;
pad=0.01;
pad2=0.011;
ringDepth = 22;
ringWidth = 30;
ringHeight = 38;

fingerRadius = 11;
joystickWidth = 11;

IRLEDradius = 3.5;
channelWidth = joystickWidth;

channelRadius = fingerRadius*1.35;
channelInnerRadius = fingerRadius*1.08;
vibratorRadius = 5;
controllerHeight = 15;
controllerWidth = 27;
controllerDepth = 20;

ringTopHeight = controllerHeight+6;

lidThickness = 2.5;
sliderWidth = 1;

roundJointRadius = 2;
roundJointRadius2 = roundJointRadius+1;


offsetZcontroller = 0;
offsetZjoystick = -15;

offsetLidY = 2;
lidHeight = controllerHeight/2+abs(offsetZjoystick)-joystickWidth/2;

module smoothBox(box_w,box_l,box_h,round_r)
{
	difference() {
		cube([box_l, box_w, box_h], center = true);

		translate([0, -box_w/2+round_r, box_h/2-round_r]) {
			difference() {
				translate([0,-round_r-pad,round_r+pad])
					cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
				rotate(a=[0,90,0])
					cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}
		translate([0, box_w/2-round_r, box_h/2-round_r]) {
			difference() {
				translate([0,round_r+pad,round_r+pad])
					cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
				rotate(a=[0,90,0])
					cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}
		translate([0, -box_w/2+round_r, -box_h/2+round_r]) {
			difference() {
				translate([0,-round_r-pad,-round_r-pad])
					cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
				rotate(a=[0,90,0])
					cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}
		translate([0, box_w/2-round_r, -box_h/2+round_r]) {
			difference() {
				translate([0,round_r+pad,-round_r-pad])
					cube([box_l+2*pad, round_r*2+pad, round_r*2+pad], center = true);
				rotate(a=[0,90,0])
					cylinder(box_l+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}

	// ----

		translate([-box_l/2+round_r, box_w/2-round_r, 0]) {
			difference() {
				translate([-round_r-pad,round_r+pad,0])
					cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
				cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}
		translate([box_l/2-round_r, box_w/2-round_r, 0]) {
			difference() {
				translate([round_r+pad,round_r+pad,0])
					cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
				cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}

		translate([-box_l/2+round_r, -box_w/2+round_r, 0]) {
			difference() {
				translate([-round_r-pad,-round_r-pad,0])
					cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
				cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}
		translate([box_l/2-round_r, -box_w/2+round_r, 0]) {
			difference() {
				translate([round_r+pad,-round_r-pad,0])
					cube([round_r*2+pad, round_r*2+pad, box_h+2*pad], center = true);
				cylinder(box_h+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}

	// ----

		translate([-box_l/2+round_r, 0, box_h/2-round_r]) {
			difference() {
				translate([-round_r-pad, 0, round_r+pad])
					cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
				rotate(a=[0,90,90])
					cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}
		translate([box_l/2-round_r, 0, box_h/2-round_r]) {
			difference() {
				translate([round_r+pad, 0, round_r+pad])
					cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
				rotate(a=[0,90,90])
					cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}
		translate([-box_l/2+round_r, 0, -box_h/2+round_r]) {
			difference() {
				translate([-round_r-pad, 0, -round_r-pad])
					cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
				rotate(a=[0,90,90])
					cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}
		translate([box_l/2-round_r, 0, -box_h/2+round_r]) {
			difference() {
				translate([round_r+pad, 0, -round_r-pad])
					cube([round_r*2+pad, box_w+2*pad, round_r*2+pad], center = true);
				rotate(a=[0,90,90])
					cylinder(box_w+4*pad,round_r,round_r,center=true,$fn=smooth);
			}
		}

	// ----

		translate([box_l/2-round_r, box_w/2-round_r, box_h/2-round_r]) {
			difference() {
				translate([round_r+pad, round_r+pad, round_r+pad])
					cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
				sphere(round_r,center=true,$fn=smooth);
			}
		}
		translate([-box_l/2+round_r, box_w/2-round_r, box_h/2-round_r]) {
			difference() {
				translate([-round_r-pad, round_r+pad, round_r+pad])
					cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
				sphere(round_r,center=true,$fn=smooth);
			}
		}
		translate([box_l/2-round_r, -box_w/2+round_r, box_h/2-round_r]) {
			difference() {
				translate([round_r+pad, -round_r-pad, round_r+pad])
					cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
				sphere(round_r,center=true,$fn=smooth);
			}
		}
		translate([-box_l/2+round_r, -box_w/2+round_r, box_h/2-round_r]) {
			difference() {
				translate([-round_r-pad, -round_r-pad, round_r+pad])
					cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
				sphere(round_r,center=true,$fn=smooth);
			}
		}

		translate([box_l/2-round_r, box_w/2-round_r, -box_h/2+round_r]) {
			difference() {
				translate([round_r+pad, round_r+pad, -round_r-pad])
					cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
				sphere(round_r,center=true,$fn=smooth);
			}
		}
		translate([-box_l/2+round_r, box_w/2-round_r, -box_h/2+round_r]) {
			difference() {
				translate([-round_r-pad, round_r+pad, -round_r-pad])
					cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
				sphere(round_r,center=true,$fn=smooth);
			}
		}
		translate([box_l/2-round_r, -box_w/2+round_r, -box_h/2+round_r]) {
			difference() {
				translate([round_r+pad, -round_r-pad, -round_r-pad])
					cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
				sphere(round_r,center=true,$fn=smooth);
			}
		}
		translate([-box_l/2+round_r, -box_w/2+round_r, -box_h/2+round_r]) {
			difference() {
				translate([-round_r-pad, -round_r-pad, -round_r-pad])
					cube([round_r*2+pad, round_r*2+pad, round_r*2+pad], center = true);
				sphere(round_r,center=true,$fn=smooth);
			}
		}
	}
}




module smoothCube(width, depth, height, bevel)
{
	hull()
	{
		translate([ -width/2, -depth/2, -height/2 ])
		{
		sphere(bevel);
		}
		translate([ width/2, -depth/2,  -height/2 ])
		{
		sphere(bevel);
		}
		translate([ -width/2, depth/2,  -height/2 ])
		{
		sphere(bevel);
		}
		translate([ width/2, depth/2,  -height/2 ])
		{
		sphere(bevel);
		}
		translate([ -width/2, -depth/2, height/2 ])
		{
		sphere(bevel);
		}
		translate([ width/2, -depth/2,  height/2 ])
		{
		sphere(bevel);
		}
		translate([ -width/2, depth/2,  height/2 ])
		{
		sphere(bevel);
		}
		translate([ width/2, depth/2,  height/2 ])
		{
		sphere(bevel);
		}
	}	
}

//smoothBox(10.0,50.0,50.0,2.0);
//smoothCube(50.0,10.0,10.0,2.0);
//ring();
//ch = 15;
//cr = 20;
//ct = 2;
//r = 4;
//smooth = 36;	// Number of facets of rounding cylinder
	// Bottom Round
module smoothRoundedEdge(bevel, circleRadius, up, out)
{
	cr= circleRadius;
	r= bevel;
	difference() {
		rotate_extrude(convexity=10)
			translate([cr-r+pad,-pad,0])
				square(r+pad,r+pad);
		rotate_extrude(convexity=10)
			translate([cr-(r*out),r*up,0])
				circle(r=r,$fn=smooth);
	}
}

module smoothRoundedCubeCutout(bevel,h)
{
	difference()
	{
		linear_extrude(height = 2*h) square(bevel,center=true);
		translate([bevel/2,bevel/2,-pad])
		{
			linear_extrude(height = 1+3*h) circle(r=bevel,center=true);
		}
	}
}

module smoothRoundedCube(w, d, h, bevel)
{
	translate([0,0,-h/2])
	{
		difference() 
		{
			linear_extrude(height = h) square([w,d], center = true);
			smoothRoundedCubeFourCutouts(w, d, h, bevel);
		}
	}	
}
module smoothRoundedCubeFourCutouts(w, d, h, bevel)
{
	union() 
	{
		translate([-pad-w/2+bevel/2,-pad-d/2+bevel/2,-pad])
		{
			smoothRoundedCubeCutout(bevel,h);
		}
		
		translate([+pad+w/2-bevel/2,-pad-d/2+bevel/2,-pad])
		{
			rotate([0,0,90])
			{
				smoothRoundedCubeCutout(bevel,h);
			}
		}
		translate([+pad+w/2-bevel/2,+pad+d/2-bevel/2,-pad])
		{
			rotate([0,0,180])
			{
				smoothRoundedCubeCutout(bevel,h);
			}
		}
		translate([-pad-w/2+bevel/2,+pad+d/2-bevel/2,-pad])
		{
			rotate([0,0,270])
			{
				smoothRoundedCubeCutout(bevel,h);
			}
		}
	}
}
module smoothRoundedCubeTwoCutouts(w, d, h, bevel)
{
	union() 
	{
		translate([-pad-w/2+bevel/2,-pad-d/2+bevel/2,-pad])
		{
			smoothRoundedCubeCutout(bevel,h);
		}
		
		translate([+pad+w/2-bevel/2,-pad-d/2+bevel/2,-pad])
		{
			rotate([0,0,90])
			{
		//		smoothRoundedCubeCutout(bevel,h);
			}
		}
		translate([+pad+w/2-bevel/2,+pad+d/2-bevel/2,-pad])
		{
			rotate([0,0,180])
			{
		//		smoothRoundedCubeCutout(bevel,h);
			}
		}
		translate([-pad-w/2+bevel/2,+pad+d/2-bevel/2,-pad])
		{
			rotate([0,0,270])
			{
				smoothRoundedCubeCutout(bevel,h);
			}
		}
	}
}
module smoothRoundedCubeTwoCutouts2(w, d, h, bevel)
{
	union() 
	{
		translate([-pad-w/2+bevel/2,-pad-d/2+bevel/2,-pad])
		{
			//smoothRoundedCubeCutout(bevel,h);
		}
		
		translate([+pad+w/2-bevel/2,-pad-d/2+bevel/2,-pad])
		{
			rotate([0,0,90])
			{
				smoothRoundedCubeCutout(bevel,h);
			}
		}
		translate([+pad+w/2-bevel/2,+pad+d/2-bevel/2,-pad])
		{
			rotate([0,0,180])
			{
				smoothRoundedCubeCutout(bevel,h);
			}
		}
		translate([-pad-w/2+bevel/2,+pad+d/2-bevel/2,-pad])
		{
			rotate([0,0,270])
			{
			//	smoothRoundedCubeCutout(bevel,h);
			}
		}
	}
}
//smoothRoundedEdge(2,20,0,0);
module smoothRoundedEdgeCylinder(height, radius, bevel)
{
	
	difference()
	{
		cylinder(height,radius,radius,center = true);
		translate([0,0,-height/2-pad])
		{
			smoothRoundedEdge(bevel,radius,1,1);
		}
		translate([0,0,height/2-bevel+pad])
		{
			smoothRoundedEdge(bevel,radius,0,1);
		}
	}
}
module smoothRoundedOutEdgeCylinder(height, radius, bevel)
{
	
	union()
	{
		cylinder(height,radius,radius,center = true);
		translate([0,0,-height/2-pad])
		{
			smoothRoundedEdge(bevel,radius+bevel-2*pad,1,0);
		}
		translate([0,0,height/2-bevel+pad])
		{
			smoothRoundedEdge(bevel,radius+bevel-2*pad,0,0);
		}

	}
}
module smoothTube(length, bevel)
{
	hull()
	{
		translate([0,-length/2+bevel,0])
		{
			sphere(bevel,center=true);
		}
		translate([0,length/2-bevel,0])
		{
			sphere(bevel,center=true);
		}
	}
	
}

//smoothRoundedEdgeCylinder(30,20,2);
//smoothRoundedOutEdgeCylinder(30,20,2);
module roundCableChannel()
{		
	rotate([90,0,0])
	{
		difference()
		{	
			union()
			{
				translate([ 0, channelRadius/2, 0.0 ])
				{
					cube([channelRadius*2,channelRadius,channelWidth],center=true);
				}					
				cylinder(channelWidth,channelRadius,channelRadius, center = true);
			}
			cylinder(channelWidth+pad,channelInnerRadius,channelInnerRadius, center = true);
			
			translate([ channelRadius, 0.0, 0.0 ]) //left half
			{
				cube(channelRadius*2+pad, center = true);
			}
			translate([ 0 , -channelRadius, 0.0 ]) //bottom half
			{
				cube(channelRadius*2+pad, center = true);
			}
			translate([ 10 , channelRadius, 0.0 ])
			{
				//cube(channelRadius*2, center = true);
			}
			
		}
	}
	
}
module lid(cutout = true)
{
	
	lidCutoutPartWidth = (ringDepth-joystickWidth)/2-offsetLidY;
	lidCutoutWidth = joystickWidth+lidCutoutPartWidth;
	difference()
	{
		union()
		{
			cube([lidThickness/2+pad,ringDepth+pad,lidHeight+sliderWidth*2+pad], center = true);
			translate([-lidThickness/2,0,0])
			{
				cube([lidThickness/2+pad,ringDepth+pad,lidHeight+pad], center = true);
			}
		}
		if(cutout == true)
		{
			translate([-0,-(ringDepth-lidCutoutWidth)/2,-lidHeight/2-sliderWidth/2-pad])
			{
				cube([lidThickness/2+pad2*2,lidCutoutWidth+pad2,sliderWidth], center = true);
			}	
		}
		else
		{
			translate([0,(-ringDepth+lidCutoutPartWidth)/2,-lidHeight/2-sliderWidth/2-pad])
			{
				cube([lidThickness/2+pad2,lidCutoutPartWidth+pad2,sliderWidth], center = true);
			}	
		}
			
	}
}
module ring()
{	
	union()
	{
		difference() 
		{
			difference() //raw shape
			{
				//cube([ringWidth,ringDepth,ringHeight], center = true);
				union()
				{
					hull()
					{
						difference()
							{
							translate([ringWidth/4,0,0])
							{
								
									cube([ringWidth/2,ringDepth,ringTopHeight], center = true);
								
								
							}
							translate([0,0,-ringHeight])
							{
								smoothRoundedCubeTwoCutouts2(ringWidth,ringDepth,ringHeight,roundJointRadius2);
							}
						}
						translate([ringWidth/2-1,0,-ringTopHeight/2])
						{
						/*
							rotate([90,0,0])
							{
								cylinder(ringDepth,roundJointRadius2,roundJointRadius2,center= true);
							}						*/
							
							smoothTube(ringDepth,roundJointRadius2);	
						}					
					}
					hull()
					{
						translate([-ringWidth/4,0,0])
						{
							cube([ringWidth/2,ringDepth,ringTopHeight], center = true);
						}
						translate([-ringWidth/2+roundJointRadius2,0,-ringTopHeight/2-joystickWidth])
						{
							rotate([90,0,0])
							{
								cylinder(ringDepth,roundJointRadius2,roundJointRadius2,center= true);
							}						
						}					
					}
				}
				translate([0,0,-ringHeight])
				{
					smoothRoundedCubeTwoCutouts(ringWidth,ringDepth,ringHeight,roundJointRadius2);
				}				
			}
			/*
			translate([-fingerRadius-1,0,3.5])
			{
				union()
				{
					translate([ 1.5, 0, 3  ]) // controller to joystick channel
					{
						cube([7,joystickWidth,6+pad], center= true);
					}
					translate([ 0, 0.0, -ringHeight/6 ])
					{				
						cube([4,joystickWidth,ringHeight/3+2], center= true);
					}
				}
			}*/
						
			translate([ringWidth/2-roundJointRadius2,0,-ringTopHeight/2])
			{
				rotate([90,0,0])
				{
					union()
					{
						cylinder(joystickWidth,roundJointRadius2+0.2,roundJointRadius2+0.2,center=true);
						cylinder(ringWidth+pad,1.4,1.4,center=true);
						rotate([0,0,45])
						{
							translate([0,-2,0])
							{
								cube([5,5,joystickWidth],center=true);
							}
						}
					}
				}				
			}
			
			
			translate([ 0.0, 0.0, offsetZcontroller ]) //controller
			{
				cube([controllerWidth,controllerDepth,controllerHeight], center = true);
				translate([ 12.0, 7.0, 1.0 ]) //battery hole
				{
					cube([12,3,5], center = true);
				}
				translate([ 7.0, 2.0, ringTopHeight/2 ]) //LED hole
				{
					cube([3,3,10], center = true);
				}
				translate([ 0.0, 0.0, ringTopHeight/2 ]) //IRLED hole
				{
					cylinder(10,IRLEDradius,IRLEDradius, center = true);
				}
				translate([ -ringWidth/2, 0.0, offsetZjoystick ]) //side / JOYSTICK pocket
				{
					cube([5,joystickWidth,joystickWidth], center = true);
				}
				translate([ -ringWidth/2+lidThickness*3/4, offsetLidY, (controllerHeight-lidHeight)/2 ]) //lid
				{
					lid(cutout = false);
				}
			}
			
			
			translate([ 2.0, 0.0, -fingerRadius*2+1 ]) //finger
			{
				roundCableChannel();
				translate([ -1.0, 0.0, fingerRadius ]) // VIBRATOR about 9mm
				{
					cylinder(3,vibratorRadius,vibratorRadius,center = true);
				}
				rotate([90,0,0])
				{
					//cylinder(h = 60, r1 = 20, r2 = 20, center = true);
					smoothRoundedOutEdgeCylinder(ringDepth+pad,fingerRadius,roundJointRadius);
				}	
			}
		} //end differenc
		// union
		translate([ 0.0, 0.0, offsetZcontroller ]) //support controller
		{
			cube([controllerWidth-1,controllerDepth-pad,1],center = true);
		}
		translate([ -12.0, 0.0, offsetZjoystick+2.5 ]) //support joystick
		{
			cube([1,joystickWidth-pad,10],center = true);
		}
	}//end union
}
module arm()
{
	difference()
	{
		translate([ 2.0, 0.0, -fingerRadius*2+1 ]) //finger
		{
			union()
			{
				difference()
				{
					rotate([90,0,0])
					{
						smoothRoundedEdgeCylinder(ringDepth,ringWidth/2,roundJointRadius);
					}
					rotate([90,0,0])
					{
						smoothRoundedOutEdgeCylinder(ringDepth+pad,fingerRadius,roundJointRadius);
					}				
					translate([-ringWidth/2,0,0])
					{
						cube([ringWidth,ringDepth+pad,ringWidth],center=true);
					}
					rotate([0,45,0])
					{
						translate([-ringWidth/2,0,0])
						{
							cube([ringWidth,ringDepth+pad,ringWidth],center=true);
						}
					}
				}
				translate([0,0,-ringWidth/2+roundJointRadius])
				{
					smoothTube(ringDepth,roundJointRadius);
				}				
			}
			
		}
		translate([ringWidth/2-roundJointRadius2,joystickWidth,-ringTopHeight/2])
		{
			rotate([90,0,0])
			{
				cylinder(joystickWidth+pad,roundJointRadius2+1,roundJointRadius2+1,center=true);
			}	
		}
		translate([ringWidth/2-roundJointRadius2,-joystickWidth,-ringTopHeight/2])
		{
			rotate([90,0,0])
			{
				cylinder(joystickWidth+pad,roundJointRadius2+1,roundJointRadius2+1,center=true);
			}	
		}
	}
	translate([ringWidth/2-roundJointRadius2-1,0,-ringTopHeight/2])
			{
				rotate([90,0,0])
				{
					difference()
					{
						cylinder(joystickWidth,roundJointRadius2,roundJointRadius2,center=true);
						cylinder(joystickWidth+pad,1.5,1.5,center=true);
					}
				}				
			}
	

}
module ring_no_lid()
{	
	union()
	{
		difference() 
		{
			difference() //raw shape
			{
				//cube([ringWidth,ringDepth,ringHeight], center = true);
				union()
				{
					hull()
					{
						difference()
							{
							translate([ringWidth/4,0,0])
							{
								
									cube([ringWidth/2,ringDepth,ringTopHeight], center = true);
								
								
							}
							translate([0,0,-ringHeight])
							{
								smoothRoundedCubeTwoCutouts2(ringWidth,ringDepth,ringHeight,roundJointRadius2);
							}
						}
						translate([ringWidth/2-1,0,-ringTopHeight/2])
						{
						/*
							rotate([90,0,0])
							{
								cylinder(ringDepth,roundJointRadius2,roundJointRadius2,center= true);
							}						*/
							
							smoothTube(ringDepth,roundJointRadius2);	
						}					
					}
					hull()
					{
						translate([-ringWidth/4,0,0])
						{
							cube([ringWidth/2,ringDepth,ringTopHeight], center = true);
						}
						translate([-ringWidth/2+roundJointRadius2,0,-ringTopHeight/2-joystickWidth])
						{
							rotate([90,0,0])
							{
								cylinder(ringDepth,roundJointRadius2,roundJointRadius2,center= true);
							}						
						}					
					}
				}
				translate([0,0,-ringHeight])
				{
					smoothRoundedCubeTwoCutouts(ringWidth,ringDepth,ringHeight,roundJointRadius2);
				}				
			}
			/*
			translate([-fingerRadius-1,0,3.5])
			{
				union()
				{
					translate([ 1.5, 0, 3  ]) // controller to joystick channel
					{
						cube([7,joystickWidth,6+pad], center= true);
					}
					translate([ 0, 0.0, -ringHeight/6 ])
					{				
						cube([4,joystickWidth,ringHeight/3+2], center= true);
					}
				}
			}*/
						
			translate([ringWidth/2-roundJointRadius2,0,-ringTopHeight/2])
			{
				rotate([90,0,0])
				{
					union()
					{
						cylinder(joystickWidth,roundJointRadius2+0.2,roundJointRadius2+0.2,center=true);
						cylinder(ringWidth+pad,1.4,1.4,center=true);
						rotate([0,0,45])
						{
							translate([0,-2,0])
							{
								cube([5,5,joystickWidth],center=true);
							}
						}
					}
				}				
			}
			
			
			translate([ 0.0, 0.0, offsetZcontroller ]) //controller
			{
				cube([controllerWidth,controllerDepth,controllerHeight], center = true);
				translate([ 12.0, 7.0, 1.0 ]) //battery hole
				{
					cube([12,3,5], center = true);
				}
				translate([ 7.0, 2.0, ringTopHeight/2 ]) //LED hole
				{
					cube([3,3,10], center = true);
				}
				translate([ 0.0, 0.0, ringTopHeight/2 ]) //IRLED hole
				{
					cylinder(10,IRLEDradius,IRLEDradius, center = true);
				}
				translate([ -ringWidth/2, 0.0, offsetZjoystick ]) //side / JOYSTICK pocket
				{
					cube([5,joystickWidth,joystickWidth], center = true);
				}
				translate([ -ringWidth/2+lidThickness*3/4, offsetLidY, (controllerHeight-lidHeight)/2 ]) //lid
				{
					//lid(cutout = false);
				}
			}
			
			
			translate([ 2.0, 0.0, -fingerRadius*2+1 ]) //finger
			{
				roundCableChannel();
				translate([ -1.0, 0.0, fingerRadius ]) // VIBRATOR about 9mm
				{
					cylinder(3,vibratorRadius,vibratorRadius,center = true);
				}
				rotate([90,0,0])
				{
					//cylinder(h = 60, r1 = 20, r2 = 20, center = true);
					smoothRoundedOutEdgeCylinder(ringDepth+pad,fingerRadius,roundJointRadius);
				}	
			}
		} //end differenc
		// union
		translate([ 0.0, 0.0, offsetZcontroller ]) //support controller
		{
			cube([controllerWidth-1,controllerDepth-pad,1],center = true);
		}
		translate([ -12.0, 0.0, offsetZjoystick+2.5 ]) //support joystick
		{
			cube([1,joystickWidth-pad,10],center = true);
		}
	}//end union
}
//smoothRoundedCube(10,5,10,3);

//ring();


//translate([1,0,0])
rotate([270,0,0])
{
	arm();
	translate([10,8.3,-9])
	{
		cube([2,(ringDepth-joystickWidth)/2,2],center = true);
	}	
}


translate([-20,offsetLidY,0])
{
	//lid(cutout= false);
}
translate([-30,offsetLidY,0])
{
	//lid(cutout= true);
}
/*
// for the lid <3
rotate([0,90,0])
{
	scale([1,1,1])
	{
		intersection()
		{
			translate([ 0.0, 0.0, offsetZcontroller ]) //controller
				{
					translate([ -ringWidth/2+lidThickness*3/4, offsetLidY, (controllerHeight-lidHeight)/2 ]) //lid
					{
						lid(cutout = true);
					}
				}
			ring_no_lid();
		}
	}
}
*/