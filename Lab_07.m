Fs=100;
duration=10;
t=(-duration/2:1/Fs:duration/2);

k1=2;
k2=3;

%Input signals
x1= (t>=0)-((t-1)>=0);
x2= sin(10*t).*(((t+1)>=0)-((t-2)>=0));

figure;
plot(t,x1);
title("Signal x1");
xlabel("Time (t)");
ylabel("Amplidtude");

figure;
plot(t,x2);
title("Signal x2");
xlabel("Time (t)");
ylabel("Amplidtude");

figure;
plot(t,k1*x1+k2*x2);
title("Signal k1*x1+k2*x2");
xlabel("Time (t)");
ylabel("Amplidtude");

function system_y1=y1(signal)
    system_y1=2.*signal;
end

function system_y2=y2(signal)
    system_y2=signal.*signal;
end

function system_y3=y3(signal)
    system_y3=signal.*exp(signal);
end

function linearity=if_linear(signal_1,signal_2,system,weights,t,system_name)
    sum_of_weighted_inputs=weights(1).*signal_1+weights(2).*signal_2;
    system_out_sum_of_weighted_inputs=system(sum_of_weighted_inputs);
    weighted_output_signal_1=weights(1).*system(signal_1);
    weighted_output_signal_2=weights(2).*system(signal_2);
    figure;
    subplot(1,2,1);
    plot(t,system_out_sum_of_weighted_inputs);
    title("y(k1*x1+k2+x2)")
    xlabel("Time");
    ylabel("Amplitude");
    subplot(1,2,2);
    plot(t,(weighted_output_signal_1+weighted_output_signal_2));
    title("k1*y(x1)+k2*(x2)")
    xlabel("Time");
    ylabel("Amplitude");
    linearity=(weighted_output_signal_1+weighted_output_signal_2)-system_out_sum_of_weighted_inputs;
    if linearity==0
        fprintf("System %s is linear\n",system_name);
    else
        fprintf("System %s is non-linear\n",system_name);
    end
end

function system_ouput=system_output(signal,systems,t,system_names,signal_name)
    figure;
    for i=1:1:length(systems)
        subplot(1,length(systems),i);
        plot(t,systems{i}(signal));
        title(sprintf("%s(%s)",system_names(i),signal_name));
        xlabel("Time (t)");
        ylabel("Amplitude");
    end
end

system_output(x1,{@y1,@y2,@y3},t,["y1","y2","y3"],"x1");
system_output(x2,{@y1,@y2,@y3},t,["y1","y2","y3"],"x2");

if_linear(x1,x2,@y1,[k1,k2],t,"y1");
if_linear(x1,x2,@y2,[k1,k2],t,"y2");
if_linear(x1,x2,@y3,[k1,k2],t,"y3");

