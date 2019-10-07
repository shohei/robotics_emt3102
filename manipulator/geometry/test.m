clear all; close all;
xvect=[0,1,1,0,0];yvect=[0,0,1,1,0];zvect=zeros(1,5);
xvect=[xvect,xvect]; yvect=[yvect,yvect];zvect=[zvect,ones(1,5)];
xvect=[xvect,nan,1,1,nan,1,1,nan,0,0];
yvect=[yvect,nan,0,0,nan,1,1,nan,1,1];
zvect=[zvect,nan,0,1,nan,0,1,nan,0,1];
vect=[xvect;yvect;zvect];
plot3(vect(1,:),vect(2,:),vect(3,:),'linewidth',5);
axis equal;grid;
axis([-2,3,-2,3,-2,3]);

