A = [-0.435,0.209,0.02;0.268,-0.394,0;0.227,0,-0.02];
B = [1;0;0];
C = [0.0003,0,0];
D = 0;
[z,p,k] = ss2zp(A,B,C,D,1);
display(k);
display(p);
display(z);

