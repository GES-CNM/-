clc;clear all;
[number]=xlsread('data.xls');
% MMS
Time_MMS=number(1:451,1);
AVz_MMS=number(1:451,2);
Ay_SM_MMS=number(1:451,3);
Beta_MMS=number(1:451,4);
Steer_SW_MMS=number(1:451,5);
Xo_MMS=number(1:451,6);
X_target_MMS=number(1:451,7);
Yo_MMS=number(1:451,8);
Y_Target_MMS=number(1:451,9);

% FWRCS
Time_FWRCS=number(1:451,12);
AVz_FWRCS=number(1:451,13);
Ay_SM_FWRCS=number(1:451,14);
Beta_FWRCS=number(1:451,15);
Steer_SW_FWRCS=number(1:451,16);
Xo_FWRCS=number(1:451,17);
X_target_FWRCS=number(1:451,18);
Yo_FWRCS=number(1:451,19);
Y_Target_FWRCS=number(1:451,20);

% EIFCS
Time_EIFCS=number(1:451,23);
AVz_EIFCS=number(1:451,24);
Ay_SM_EIFCS=number(1:451,25);
Beta_EIFCS=number(1:451,26);
Steer_SW_EIFCS=number(1:451,27);
Xo_EIFCS=number(1:451,28);
X_target_EIFCS=number(1:451,29);
Yo_EIFCS=number(1:451,30);
Y_Target_EIFCS=number(1:451,31);


%plot
subplot(1,2,1)
plot(Time_MMS,Steer_SW_MMS,'--')
hold on
plot(Time_FWRCS,Steer_SW_FWRCS,'-')
hold on
plot(Time_EIFCS,Steer_SW_EIFCS,'-.')
xlabel('Time/s')
ylabel('SW angle/deg')
legend('MMS','FWRCS','EIFCS')

subplot(1,2,2)
plot(Time_MMS,Beta_MMS,'--')
hold on
plot(Time_FWRCS,Beta_FWRCS,'-')
hold on
plot(Time_EIFCS,Beta_EIFCS,'-.')
grid on
xlabel('Time/s')
ylabel('beta angle/deg')
legend('MMS','FWRCS','EIFCS')