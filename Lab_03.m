clear all;
Fs=[10 20 1000];
frequencies=[5 10 15];
phases=[45 60 90];

duration=1;

figure;
for i=1:1:length(Fs)
    t=(-duration/2:1/Fs(i):duration/2);
    plot(t,sin(2*pi*5*t));
    axis([-duration/2 duration/2 -1.2 1.2]);
    title("Different frequencies");
    xlabel("Time (t)");
    ylabel("Amplitude");
    hold on;
end

t=(-duration/2:1/max(Fs):duration/2);

signal_frq=zeros(length(frequencies),length(t));
for i=1:1:length(frequencies)
    signal_frq(i,:)=sin(2*pi*frequencies(i)*t);
end

figure;
subplot(2,2,1);
plot(t,signal_frq(1,:));
axis([-duration/2 duration/2 -1.2 1.2]);
title("sin f= 5 Hz");
xlabel("Time (t)")
ylabel("Amlitude");

subplot(2,2,2);
plot(t,signal_frq(2,:));
axis([-duration/2 duration/2 -1.2 1.2]);
title("sin f= 10 Hz");
xlabel("Time (t)")
ylabel("Amlitude");

subplot(2,2,3);
plot(t,signal_frq(3,:));
axis([-duration/2 duration/2 -1.2 1.2]);
title("sin f= 15 Hz");
xlabel("Time (t)")
ylabel("Amlitude");

subplot(2,2,4);
plot(t,signal_frq(1,:),t,signal_frq(2,:),t,signal_frq(3,:));
axis([-duration/2 duration/2 -1.2 1.2]);
legend("5 Hz","10 Hz","15 Hz");
title("comparing signals");
xlabel("Time (t)")
ylabel("Amlitude");


signal_phs=zeros(length(phases),length(t));
for i=1:1:length(phases)
    signal_phs(i,:)=sin(2*pi*5*t+phases(i));
end

figure;
subplot(2,2,1);
plot(t,signal_phs(1,:));
axis([-duration/2 duration/2 -1.2 1.2]);
title("Phase 45");
xlabel("Time (t)")
ylabel("Amlitude");

subplot(2,2,2);
plot(t,signal_phs(2,:));
axis([-duration/2 duration/2 -1.2 1.2]);
title("phase 60");
xlabel("Time (t)")
ylabel("Amlitude");

subplot(2,2,3);
plot(t,signal_phs(3,:));
axis([-duration/2 duration/2 -1.2 1.2]);
title("phase 90");
xlabel("Time (t)")
ylabel("Amlitude");

subplot(2,2,4);
plot(t,signal_phs(1,:),t,signal_phs(2,:),t,signal_phs(3,:));
axis([-duration/2 duration/2 -1.2 1.2]);
legend("45","60","90");
title("comparing signals");
xlabel("Time (t)");
ylabel("Amlitude");

signal1=3+sin(2*pi*5*t);
figure;
plot(t,signal1);
axis([-duration/2 duration/2 0 4.2]);
title("3 + Asin(2πft + θ)");
xlabel("Time (t)");
ylabel("Amlitude");

signal2=3*sin(2*pi*5*t);
figure;
plot(t,signal2);
axis([-duration/2 duration/2 -3.5 3.5]);
title("3*Asin(2πft + θ)");
xlabel("Time (t)");
ylabel("Amlitude");