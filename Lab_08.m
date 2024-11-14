Fs=100;
duration=10;
t=(-duration/2:1/Fs:duration/2);

function x1=signal_x1(time)
    x1=(time>=0)-((time-1)>=0);
end

function x2=signal_x2(time)
    x2= sin(10*time).*(((time+1)>=0)-((time-2)>=0));
end

function system_y1=y1(signal,t)
    system_y1=2.*signal;
end

function system_y2=y2(signal,t)
    system_y2=signal.*signal;
end

function system_y3=y3(signal,t)
    system_y3=zeros(1,length(t));
    for i=1:1:length(t)
        system_y3(i)=t(i)*exp(signal(i));
    end
end

function delayed_signal=delay_signal(signal,delay,t)
    delayed_signal=zeros(length(t));
    for i=1:1:length(t)
        k=i+delay;
        if i<=length(t)
            delayed_signal(k)=signal(i);
        end
    end
end

function time_variance=is_timeVariant(signal,system,t,delay,system_name,signal_name)
    delayed_signal_system_outout=system(delay_signal(signal,delay,t),t);
    shifted_system_output=delay_signal(system(signal,t),delay,t);
   
    figure;
    subplot(2,3,1);
    plot(t,signal);
    title(sprintf("%s(t)",signal_name));
    xlabel("Time (t)");
    ylabel("Amplitude");

    subplot(2,3,2);
    plot(t,system(signal,t));
    title(sprintf("%s(%s(t))",system_name,signal_name));
    xlabel("Time (t)");
    ylabel("Amplitude");

    subplot(2,3,3);
    plot(t,shifted_system_output);
    title(sprintf("%s(%s(t)-T)",system_name,signal_name));
    xlabel("Time (t)");
    ylabel("Amplitude");

    subplot(2,3,4);
    plot(t,signal);
    title(sprintf("%s(t)",signal_name));
    xlabel("Time (t)");
    ylabel("Amplitude");

    subplot(2,3,5);
    plot(t,delay_signal(signal,delay,t));
    title(sprintf("%s(t-T)",signal_name));
    xlabel("Time (t)");
    ylabel("Amplitude");

    subplot(2,3,6);
    plot(t,delayed_signal_system_outout);
    title(sprintf("%s(%s(t-T))",system_name,signal_name));
    xlabel("Time (t)");
    ylabel("Amplitude");
    
    time_variance=delayed_signal_system_outout-shifted_system_output;
    fprintf("Tested signal %s.\n",signal_name);
    if time_variance==0
        fprintf("System %s is time invariant\n",system_name);
    else
        fprintf("System %s is time variant\n",system_name);
    end
end



delay=200;
input_signal_x1=signal_x1(t);
input_signal_x2=signal_x2(t);

is_timeVariant(input_signal_x1,@y1,t,delay,"y1","x1");
is_timeVariant(input_signal_x1,@y2,t,delay,"y2","x1");
is_timeVariant(input_signal_x1,@y3,t,delay,"y3","x1");

is_timeVariant(input_signal_x2,@y1,t,delay,"y1","x2");
is_timeVariant(input_signal_x2,@y2,t,delay,"y2","x2");
is_timeVariant(input_signal_x2,@y3,t,delay,"y3","x2");

