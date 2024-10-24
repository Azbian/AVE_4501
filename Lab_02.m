clear all;
Fs=1000;
duration=10;
t=(-duration/2:1/Fs:duration/2);
omega=[1 2 5];

s=zeros(3,length(t));
for i=1:1:length(omega)
    s(i,:)=sin(omega(i)*pi*t)./(omega(i)*pi*t);
end

figure;
plot(t,s(1,:));
axis([-2 2 -0.4 1.2]);
title("sinc f= 1 Hz");
xlabel("Time (t)")
ylabel("Amlitude");

figure;
plot(t,s(2,:));
axis([-2 2 -0.4 1.2]);
title("sinc f= 2 Hz");
xlabel("Time (t)")
ylabel("Amlitude");

figure;
plot(t,s(3,:));
axis([-2 2 -0.4 1.2]);
title("sinc f= 5 Hz");
xlabel("Time (t)")
ylabel("Amlitude");

figure;
plot(t,s(1,:),t,s(2,:),t,s(3,:));
axis([-2 2 -0.4 1.2]);
legend("1 Hz","2 Hz","5 Hz");
title("comparing signals");
xlabel("Time (t)")
ylabel("Amlitude");