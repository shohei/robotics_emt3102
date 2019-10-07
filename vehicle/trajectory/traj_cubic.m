close all; clear all;
v=1;dt=0.1;
figure(1);
xlabel('[cm]');ylabel('[cm]');
axis equal; axis([-300,300,-100,500]);grid;
vehi = [0,1,1,-1,-1,0;2,1,-1,-1,1,2];

hold on; plot([0,0],'ro');hold off;

[targetx1,targety1] = ginput(1);
hold on; plot(targetx1,targety1,'rp');hold off;
[targetx2,targety2] = ginput(1);
hold on;plot([targetx1,targetx2],[targety1,targety2],'ro');hold off;

tx=targetx1(1);ty=targety1(1);
theta = atan2(targety2(1)-targety1(1),targetx2(1)-targetx1(1))-pi/2;
theta*180/pi
clear targetx targety xy

xini = [0,0,tx,targetx2];
yini = [0,100,ty,targety2];
ydata = [0:v*dt*100:ty,ty];
xdatasp = interp1(yini,xini,ydata,'spline');
ab = inv([ty^3,ty^2;3*ty^2,2*ty])*[tx;tan(-theta)];
xdata = ab(1).*ydata.^3+ab(2).*ydata.^2;
plot(xini,yini,'rx',xdatasp,ydata,'.-',xdata,ydata,'.-');
xlabel('[cm]');ylabel('[cm]');
axis equal; axis([-300,300,-100,500]);grid;
legend('spline candidate','spline','cubic');
