clear all;

Fs=1000;
duration=4;
t=-duration/2:1/Fs:duration/2;


A=[1 3 6];
d=[1 4 7];

signal_A=zeros(length(A),length(t));
for i=1:1:length(A)
    signal_A(i,:)=A(i)*exp(d(1)*t);
end

figure;
subplot(2,2,1);
plot(t,signal_A(1,:));
title("Wave with A=1");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,2);
plot(t,signal_A(2,:));
title("Wave with A=3");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,3);
plot(t,signal_A(3,:));
title("Wave with A=6");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,4);
plot(t,signal_A(1,:),t,signal_A(2,:),t,signal_A(3,:));
title("all wave forms");
xlabel("Time (t)");
ylabel("Amplitude");


signal_d=zeros(length(d),length(t));
for i=1:1:length(d)
    signal_d(i,:)=A(1)*exp(d(i)*t);
end

figure;
subplot(2,2,1);
plot(t,signal_d(1,:));
title("Wave with d=1");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,2);
plot(t,signal_d(2,:));
title("Wave with d=4");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,3);
plot(t,signal_d(3,:));
title("Wave with d=7");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,4);
plot(t,signal_d(1,:),t,signal_d(2,:),t,signal_d(3,:));
title("all wave forms");
xlabel("Time (t)");
ylabel("Amplitude");