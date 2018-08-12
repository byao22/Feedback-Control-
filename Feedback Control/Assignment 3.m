H = tf([13737*5*10^5 * 0.0004,13737*10^5 * 5 * 0.04, 13737*10^5*5],[10^-6,2*10^-3,1,3,3,1]);
%bode(H)
grid on
hold on
%I = tf([5*10^5],[2.5*10^-3,2*2.5,2.5*10^3,1]);
%bode(I)
hold off

%figure(1)
%nyquist(H)
%hold on
%nyquist(I)
%axis([-10, 1, -2, 2])
%hold off

%feedback(H) 
pole(H)




