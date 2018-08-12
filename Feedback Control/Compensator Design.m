s = tf('s');
%{
kp = 24.0146
ki = 6E4;
a = 6E6;

P = tf([5],[2E-4, 4.2]);
C = 24*[1+ 6E4/s]*[1/(1.67E-7*s +1)]
L = P*C
margin(L)
xlim([10^2,10^7])
grid on



Xref = tf([10E-6],[1,0]);
G1 = 5E5;
Vn = tf([5000],[1,0,10^10]);
%Gp = tf([10^2], [1, 100.2, 10^6],'InputDelay', 1.5E-5);
Gp = tf([10^2], [1, 100.2, 10^6]);
C = 1/s + 1;

E = (Xref*G1 - Vn)/(1+ G1*C*(-10)*Gp)

Y = s*E
%}
Rc=4;       %coil resistance
Lc=2e-4;    %coil inductance
Kf=20;      %motor constant
R1=10e3;    %value of resistance R1
Rs=0.2;     %value of sense resistance
Ga=-0.5;    %closed loop low-freq gain of the current amplifier
G1=5e5;     %capacitive probe sensor's gain
Gp = [tf([10^2], [1, 100.2, 10^6],'InputDelay', 1.14E-5)]
%Gp = [tf([10^2], [1, 100.2, 10^6])]
%s = exp(-1.14E-5*s); 

%C_mech = 100 / (s + 3000)^2 / s * (s + 10^5)^2; % mechanical controller V_set/V_e   
%C_mech = [(s+.1)/s]*[(s+100)/(s+2000)]*[(s+1E4)/(s+1E5)];
%C_mech = 1/10000000 * (s+3000)^2 * s / (s + 1e5)^2
%C_mech = tf([1],[1]);
C_mech = -30000000*(1+ 10/s)*(1+ s/100)/((s+1E5)*(s+1E5))
margin(C_mech)

L_mech = C_mech*Ga*Kf*Gp*G1 % mechanical loop transfer function
%H = pade(L_mech,3)
%rlocus(H)
%margin(L_mech)
L_mechS=ss(L_mech); 
CL=feedback(L_mechS,1);
pole(CL)