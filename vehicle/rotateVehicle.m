function rotateVehicle
clear all; close all;

load vehicleParams;
    
for theta = (0:0.05:2*pi)
    R = [cos(theta),-sin(theta);sin(theta),cos(theta)];
    newvehi = R*vehi;
    drawVehicle(newvehi(1,:), newvehi(2,:),ax);
    drawnow;
 end
 
end