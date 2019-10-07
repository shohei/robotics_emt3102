close all; clear all;
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

x=0;y=0;
theta=0;
D=1;
steering=0;
trajectory=[];
theta=pi/2;
while(y<yt)
   steering = -atan(D*(6*ab(1)*y+2*ab(2))*sin(theta)/...
       ((3*ab(1)*y
   
end



v=hypot(diff(xdata),diff(ydata))/dt;
theta=atan2(diff(ydata),diff(xdata)); 
theta = theta([1,1:end]);
steering = atan(D*diff(theta)./(v*dt));
theta=theta(1);
x=xdata(1);y=ydata(1);
trajectory=[];
for i=1:length(v)
    theta=theta+v(i)*dt/D*tan(steering(i));
    x=x+v(i)*dt*cos(theta);
    y=y+v(i)*dt*sin(theta);
    trajectory=[trajectory,[x;y]];
    theta1=theta-pi/2;
    R=[cos(theta1),-sin(theta1);sin(theta1),cos(theta1)];
    newvehi=R*vehi;
    figure(1);
    plot(targetx1,targety1,'pr',xdata,ydata,':go',...
    newvehi(1,:)*10+x,newvehi(2,:)*10+y,...
    trajectory(1,:),trajectory(2,:),':r');
    xlabel('[cm]');ylabel('[cm]');
    axis equal; axis([-300,300,-100,500]);grid;
    drawnow;        
end

