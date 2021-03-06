import graph3;
import apexstyle;


//ASY file for fig10_01_ex_233D.asy in Chapter 10

size(200,200);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(0,-5,3);
defaultrender.merge=true;

//usepackage("mathspec");
//texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
//texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
//texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
//texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={1};
real[] myzchoice={1,2};
defaultpen(0.5mm);
pair xbounds=(-1.1,1.1);
pair ybounds=(-1.1,1.1);
pair zbounds=(-1.1,1.1);

//xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
//yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
//zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

//label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
//label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
//label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface z^2+x^2+y^2=1, a sphere
triple f(pair t) {
	return (cos(t.x)*sin(t.y)-1.1,sin(t.x)*sin(t.y),cos(t.y));
}
surface s=surface(f,(0,1/4),(2pi,pi-1/4),16,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic}
,vsplinetype=new splinetype[] {notaknot,notaknot,monotonic}
);
pen p=rgb(0,0,.8)+.09mm;
draw(s,emissive(rgb(.6,.6,1)+opacity(.6)),meshpen=p);

//Draw the surface z^2+x^2+y^2=1, a sphere
triple f(pair t) {
	return (cos(t.x)*sin(.25)-1.1,sin(t.x)*sin(.25),cos(.25)+t.y*(cos(pi-.25)-cos(.25)));
}
surface s=surface(f,(0,0),(2pi,1),16,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic}
,vsplinetype=new splinetype[] {notaknot,notaknot,monotonic}
);
//pen p=rgb(0,0,.2);
draw(s,emissive(rgb(.6,.6,1)+opacity(.7)),meshpen=p);

triple g(real t) {return (cos(t)-1.1, sin(t),0);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,rgb(.3,.3,.3)+linewidth(1));



//Draw the torus
real cc=.75;
real aa=.25;
triple f(pair t) {
	return ((cc+aa*cos(t.y))*cos(t.x)+1.1,(cc+aa*cos(t.y))*sin(t.x),aa*sin(t.y));
}
surface s=surface(f,(0,0),(2pi,2pi),16,8,usplinetype=new splinetype[] {notaknot,notaknot,monotonic}
,vsplinetype=new splinetype[] {notaknot,notaknot,monotonic}
);
//pen p=rgb(0,0,.7);
draw(s,emissive(rgb(.6,.6,1)+opacity(.7)),meshpen=p);


triple g(real t) {return (cos(t)+1.1,sin(t),0);}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,rgb(.3,.3,.3)+linewidth(1));

real yy = 5pi/4;

triple g(real t) {return ((cc+aa*cos(t))*cos(yy)+1.1,(cc+aa*cos(t))*sin(yy),aa*sin(t));}
path3 mypath=graph(g,0,2pi,operator ..);
draw(mypath,rgb(.3,.3,.3)+linewidth(1));

// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.3,.3,.3)+opacity(.5),meshpen=p,render(merge=true));

//draw(s,palergb(.3,.3,.3));
//draw(s,lightrgb(.3,.3,.3),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.3,.3,.3));
