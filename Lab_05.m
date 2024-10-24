clear all;

Fs=1000;
duration=2;
t=-duration/2:1/Fs:duration/2;

d_pos=[1 3 5];
d_neg=[-1 -3 -5];
freq=[3 9];

signal_a_pos=zeros(length(d_pos),length(t));
signal_a_neg=zeros(length(d_neg),length(t));
signal_b_pos=zeros(length(d_pos),length(t));
singal_b_neg=zeros(length(d_neg),length(t));

for i=1:1:length(d_pos)
    signal_a_pos(i,:)=10*exp(d_pos(i)*t).*sin(2*pi*5*t);
    signal_a_neg(i,:)=10*exp(d_neg(i)*t).*sin(2*pi*5*t);
    signal_b_pos(i,:)=exp(d_pos(i)*t)+10*sin(2*pi*5*t);
    signal_b_neg(i,:)=exp(d_neg(i)*t)+10*sin(2*pi*5*t);
end

signal_a_freq=zeros(length(freq),length(t));
signal_b_freq=zeros(length(freq),length(t));
for j=1:1:length(freq)
    signal_a_freq(j,:)=10*exp(d_pos(1)*t).*sin(2*pi*freq(j)*t);
    signal_b_freq(j,:)=exp(d_neg(1)*t)+10*sin(2*pi*freq(j)*t);
end

figure;
subplot(2,2,1);
plot(t,signal_a_pos(1,:));
title("Signal a with d=1");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,2);
plot(t,signal_a_pos(2,:));
title("Signal a with d=3");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,3);
plot(t,signal_a_pos(3,:));
title("Signal a with d=5");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,4);
plot(t,signal_a_pos(1,:),t,signal_a_pos(2,:),t,signal_a_pos(3,:));
title("Signaa with different d");
xlabel("Time (t)");
ylabel("Amplitude");

figure;
subplot(2,2,1);
plot(t,signal_a_neg(1,:));
title("Signal a with d=-1");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,2);
plot(t,signal_a_neg(2,:));
title("Signal a with d=-3");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,3);
plot(t,signal_a_neg(3,:));
title("Signal a with d=-5");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,4);
plot(t,signal_a_neg(1,:),t,signal_a_neg(2,:),t,signal_a_neg(3,:));
title("Signaa with different d");
xlabel("Time (t)");
ylabel("Amplitude");

figure;
subplot(2,2,1);
plot(t,signal_b_pos(1,:));
title("Signal b with d=1");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,2);
plot(t,signal_b_pos(2,:));
title("Signal b with d=3");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,3);
plot(t,signal_b_pos(3,:));
title("Signal b with d=5");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,4);
plot(t,signal_b_pos(1,:),t,signal_b_pos(2,:),t,signal_b_pos(3,:));
title("Signaa with different d");
xlabel("Time (t)");
ylabel("Amplitude");

figure;
subplot(2,2,1);
plot(t,signal_b_neg(1,:));
title("Signal b with d-1");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,2);
plot(t,signal_b_neg(2,:));
title("Signal b with d=-3");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,3);
plot(t,signal_b_neg(3,:));
title("Signal a with d=-5");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,4);
plot(t,signal_b_neg(1,:),t,signal_b_neg(2,:),t,signal_b_neg(3,:));
title("Signal with different d");
xlabel("Time (t)");
ylabel("Amplitude");

figure;
subplot(3,1,1);
plot(t,signal_a_freq(1,:));
title("Signal a with f=3");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(3,1,2);
plot(t,signal_a_freq(2,:));
title("Signal a with f=9");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(3,1,3);
plot(t,signal_a_freq(1,:),t,signal_a_freq(2,:));
title("Signal a with different frequencies");
xlabel("Time (t)");
ylabel("Amplitude");

figure;
subplot(3,1,1);
plot(t,signal_b_freq(1,:));
title("Signal b with f=3");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(3,1,2);
plot(t,signal_b_freq(2,:));
title("Signal b with f=9");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(3,1,3);
plot(t,signal_b_freq(1,:),t,signal_b_freq(2,:));
title("Signal b with different frequencies");
xlabel("Time (t)");
ylabel("Amplitude");