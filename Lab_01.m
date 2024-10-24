Fs=10;
duration=4;
t=(-duration/2:1/Fs:duration/2);

%Impulse function
a=zeros(length(t));
for i=1:length(t)
    if t(i)~=0
        a(i)=0;
    else
        a(i)=1;
    end
end

%Unit-step function
unit_step=zeros(length(t));
for i=1:length(t)
    if t(i)>=0
        unit_step(i)=1;
    else
        unit_step(i)=0;
    end
end

%Ramp function
ramp=zeros(length(t));
for i=1:length(t)
    if t(i)<0
        ramp(i)=0;
    else
        ramp(i)=t(i);
    end
end

%Rectangula function
rect=zeros(length(t));
tau=2;
for i=1:length(t)
    if abs(t(i))>=(tau/2)
        rect(i)=0;
    else
        rect(i)=1;
    end
end

figure;

subplot(2,2,1);
stem(t,a);
axis([-2 2 0 2]);
title('Impulse function');
xlabel('Time');
ylabel('Amplitude');

subplot(2,2,2);
stem(t,unit_step);
axis([-2 2 0 2]);
title('Unit-step function');
xlabel('Time');
ylabel('Amplitude');

subplot(2,2,3);
stem(t,ramp);
axis([-2 2 0 2]);
title('Ramp function');
xlabel('Time');
ylabel('Amplitude');

subplot(2,2,4);
stem(t,rect);
axis([-2 2 0 2]);
title('Rectangular function');
xlabel('Time');
ylabel('Amplitude');


