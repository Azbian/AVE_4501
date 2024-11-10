Fs=100;
duration=10;
t=(-duration/2:1/Fs:duration/2);

function system_y1=y1(signal)
    system_y1=2.*signal;
end

function x1=signal_x1(time)
    x1=(time>=0)-((time-1)>=0);
end


delay=20;

input_signal=signal_x1(t);

shifted_input=zeros(length(t));

for i=1:1:length(t)
    k=i+delay;
    if i<=length(t)
        shifted_input(k)=input_signal(i);
    end
end

system_shifted_signal_output=y1(shifted_input);


system_output=y1(input_signal);
shifted_system_output=zeros(length(t));

for i=1:1:length(t)
    k=i+delay;
    if i<=length(t)
        shifted_system_output(k)=system_output(i);
    end
end

figure;
subplot(1,2,1);
plot(t,system_shifted_signal_output);
title("y1(x(t-T))");
xlabel("Time (t)");
ylabel("Amplitude")

subplot(1,2,2);
plot(t,shifted_system_output);
title("y1(x(t)-T)");
xlabel("Time (t)");
ylabel("Amplitude")

if system_shifted_signal_output-shifted_system_output==0
    disp("System is time invariant");
else
    disp("System is time variant");
end