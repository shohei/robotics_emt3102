function rotateVehicle
clear all; close all;

vehi=[0,1,1,-1,-1,0;2,1,-1,-1,1,2];
ax=[-10,10,-10,10];
    
for theta = (0:0.05:2*pi)
    R = [cos(theta),-sin(theta);sin(theta),cos(theta)];
    newvehi = R*vehi;
    drawVehicle(newvehi(1,:), newvehi(2,:),ax);
    drawnow;
 end
 
end