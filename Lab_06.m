Fs=100;
duration=10;
t=(-duration/2:1/Fs:duration/2);

signal_a=zeros(length(t));
for i=1:1:length(t)
    if t(i)>=0 && t(i)<=2
        signal_a(i)=t(i);
    elseif t(i)>=2 && t(i)<=4
        signal_a(i)=4-t(i);
    else
        signal_a(i)=0;
    end
end



a_even=0.5*(signal_a+flip(signal_a));
a_odd=0.5*(signal_a-flip(signal_a));

figure;
subplot(2,2,1);
plot(t,signal_a);
title("Signal a");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,2);
plot(t,a_even);
title("Signal a (Eevn component)");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,3);
plot(t,a_even);
title("Signal a (Odd component)");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,4);
plot(t,a_even+a_odd);
title("Signal a = even component + odd component");
xlabel("Time (t)");
ylabel("Amplitude");