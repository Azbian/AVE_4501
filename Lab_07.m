Fs=100;
duration=10;
t=(-duration/2:1/Fs:duration/2);

k1=2;
k2=3;

x1= (t>=0)-((t-1)>=0);
x2= sin(10*t).*(((t+1)>=0)-((t-2)>=0));

figure;
subplot(1,2,1);
plot(t,x1);
title("Signal x1");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(1,2,2);
plot(t,x2);
title("Signal x2");
xlabel("Time (t)");
ylabel("Amplitude");

x3=k1.*x1+k2.*x2;

figure;
plot(t,x3);
title("Signal x3");
xlabel("Time (t)");
ylabel("Amplitude");

function system_y1=y1(signal)
    system_y1=2.*signal;
end

function system_y2=y2(signal)
    system_y2=signal.*signal;
end

function system_y3=y3(signal)
    system_y3=signal*exp(signal);
end


output1=y1(x3);
output1_1=k1.*y1(x1);
output1_2=k2.*y1(x2);

figure;

subplot(2,2,1);
plot(t,output1_1);
title("Signal k1*y1(x1)");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,2);
plot(t,output1_2);
title("Signal k2*y1(x2)");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,3);
plot(t,output1);
title("Signal y1(k1*x1+k2*x2)");
xlabel("Time (t)");
ylabel("Amplitude");

subplot(2,2,4);
plot(t,(output1_1+output1_2)-output1);
title("Signal k1*y1(x1)+k2*y1(x2)");
xlabel("Time (t)");
ylabel("Amplitude");

if ((output1_1+output1_2)-output1)==0
    disp("System y1 is linear");
else
    disp("System y1 is non-linear")
end

