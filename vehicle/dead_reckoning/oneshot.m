close all; clear all;

x=0;y=0;theta=pi/2;
v=0.4;steering=0;dt=1;
vehi=[0,1,1,-1,-1,0; 2,1,-1,-1,1,2];
D=0.5;
theta1=theta-pi/2;
R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
newvehi = R*vehi;
trajectory = [x;y];

hvehi = plot(newvehi(1,:)+x,newvehi(2,:)+y,trajectory(1,:),...
    trajectory(2,:),'r:');
axis([-20,20,-20,20]);
axis square;

hsteering = uicontrol('style','slider','max',90,'min',-90,'value',steering);
hv=uicontrol('style','slider','max',1,'min',0,'value',v);
set(hv,'position',[20,60,60,20]);
hsteeringtext = uicontrol('style','text','string',...
    [num2str(steering),'deg'],'position',[20,40,60,15]);
hvtext = uicontrol('style','text','string',...
    [num2str(v),'m/s'],'position',[20,80,60,15]);
hstep = uicontrol('position',[20,100,60,20],'string',...
    [num2str(dt),'s/push']);
set(hsteering,'callback','flag=1;vehi1sub;');
set(hv,'callback','flag=2;vehi1sub;');
set(hstep,'callback','flag=3;vehi1sub;');
