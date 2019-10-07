function directionVehicle
  clear all; close all;
  load vehicleParams;

  drawVehicle(vehi(1,:),vehi(2,:),ax);
  
  [x,y] = ginput(1);
  hold on;plot(x,y,'p');hold off;
  
  [x1,y1] = ginput(1);
  hold on;plot([x,x1],[y,y1]);hold off;
  
  theta = atan2(y1-y,x1-x)-pi/2;
  R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
  newvehi = R*vehi;

  hold on;drawVehicle(newvehi(1,:)+x,newvehi(2,:)+y,ax);hold off;
  
end