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

flipped_a=zeros(length(t));
for j=1:1:length(t)
    flipped_a(j)=signal_a(length(t)+1-j);
end

a_even=0.5*(signal_a+flipped_a);
a_odd=0.5*(signal_a-flipped_a);

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
plot(t,a_odd);
title("Signal a (Odd component)");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,4);
plot(t,a_even+a_odd);
title("Signal a = even component + odd component");
xlabel("Time (t)");
ylabel("Amplitude");

b_t=(-duration/2:1/5:duration/2);
signal_b=2*exp(-1*b_t);

flipped_b=zeros(1,length(signal_b));
for k=1:1:length(signal_b)
    flipped_b(k)=signal_b(length(signal_b)+1-k);
end

b_even=0.5*(signal_b+flipped_b);
b_odd=0.5*(signal_b-flipped_b);

figure;
subplot(2,2,1);
stem(signal_b);
title("Signal_b");
xlabel("[n]");
ylabel("Amplitude");

subplot(2,2,2);
stem(b_even);
title("Signal_b (Even component)");
xlabel("[n]");
ylabel("Amplitude");

subplot(2,2,3);
stem(b_odd);
title("Signal_b(Odd component)");
xlabel("[n]");
ylabel("Amplitude");

subplot(2,2,4);
stem(b_odd+b_even);
title("Signal_b= Even component+Odd component");
xlabel("[n]");
ylabel("Amplitude");
