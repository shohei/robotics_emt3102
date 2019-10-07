function homogeneous_coordinate

close all; clear all;
% load('vehicleParams');

vehi=[0,1,1,-1,-1,0;2,1,-1,-1,1,2];
ax=[-10,10,-10,10];
vehi1=[vehi;ones(1,length(vehi(1,:)))];
drawVehicle(vehi1(1,:),vehi1(2,:),ax);
grid on;
ui1=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
ui2=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
ui3=uicontrol(1,'style','slider','max',pi/2,'min',-pi/2,'value',0);
set(ui1,'position',[10,25,60,20],'callback',{@vehi0sub,ui1,ui2,ui3});
set(ui2,'position',[10,65,60,20],'callback',{@vehi0sub,ui1,ui2,ui3});
set(ui3,'position',[10,105,60,20],'callback',{@vehi0sub,ui1,ui2,ui3});
uicontrol('style','text','position',[10,45,60,20],'string','theta');
uicontrol('style','text','position',[10,85,60,20],'string','x');
uicontrol('style','text','position',[10,125,60,20],'string','y');

    function vehi0sub(src,event,ui1,ui2,ui3)
        theta = get(ui1,'value');
        x=get(ui2,'value');
        y=get(ui3,'value');
        R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
        T=[R,[x;y];[0,0,1]];
        newvehi1=T*vehi1;
        drawVehicle(newvehi1(1,:),newvehi1(2,:),ax);
        grid on;
        drawnow;       
    end

end
