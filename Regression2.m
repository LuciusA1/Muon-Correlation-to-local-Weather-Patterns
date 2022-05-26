
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Our Regression Analysis first begins with specifying variables we will use
%All factors are averaged  and Imported into matlab
%Current Regression methods include:
    %linear
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
%Current factors to be analyzed(*)
    %(*)factors are subject to change; addition/subtraction
    
MuonCount= MuonDailyAve;
PascalReading= PascalDailyAve;
Temperatures = TemperatureDailyAve;
WindSpeedReadings = WindSpeedDailyAve;


%Number of Days Taken
Days = {'1';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';'16';'17';'18';'19';'20';...
        '21';'22';'23';'24';'25';'26';'27';'28';'29';'30';'31';'32';'33';'34';'35';'36';'37';'38';'39';'40';...
        '41';'42';'43';'44';'45';'46';'47';'48';'49';'50';'51';'52';'53';'54';'55';'56';'57';'58';'59';'60';...
        '61';'61';'63';'64';'65';'66';'67';'68';'69'};
Days1 = 1:1:69;
IntegerDays = transpose(Days1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Linear Regression Coding Portion
%Linear regression models for muon count vs Variables/Factors to be analyzed
%Models are generated from table constructions



%table generation of the various variables and their comparison vs MuonCount
%each variable is compared vs Muon count then variables individually are compared
TabletoShow = table(Days,MuonCount,PascalReading,Temperatures,WindSpeedReadings);
AllFactorTable = table(PascalReading,Temperatures,WindSpeedReadings,CloudLayer1,DewPoint,Humidity,MuonCount);
MuonCount_vs_PascalReadingTable= table(PascalReading,MuonCount);
MuonCount_vs_TemperatureReadingTable = table(Temperatures,MuonCount);
MuonCount_vs_WindSpeedReadingTable = table(WindSpeedReadings,MuonCount);
MuonCount_vs_HumidityTable = table(Humidity,MuonCount);
MuonCount_vs_DewPointTable = table(DewPoint,MuonCount);
MuonCount_vs_CloudLayerTable = table(CloudLayer1,MuonCount);
DewPoint_vs_HumidityTable = table(DewPoint,Humidity);




%generation of linear models. first a model comparing all 
%variables currently compiled and Muon count as response variable
%then generation of factors individually vs MuonCount (for in depth analysis)

AllFactorLinearModel= fitlm(AllFactorTable,'linear');
MuonCount_vs_PascalLinearModel= fitlm(MuonCount_vs_PascalReadingTable,'linear');
MuonCount_vs_TemperatureReadingLinearModel = fitlm(MuonCount_vs_TemperatureReadingTable, 'linear');
MuonCount_vs_WindSpeedLinearModel= fitlm(MuonCount_vs_WindSpeedReadingTable, 'linear');
MuonCount_vs_HumidityLinearModel = fitlm(MuonCount_vs_HumidityTable,'linear');
MuonCount_vs_DewPointLinearModel = fitlm(MuonCount_vs_DewPointTable,'linear');
MuonCount_vs_CloudLayerLinearModel = fitlm(MuonCount_vs_CloudLayerTable, 'linear');
DewPoint_vsHumidityLinearModel = fitlm(DewPoint_vs_HumidityTable, 'linear');

figure(9);
Model1 = AllFactorLinearModel;
plot(Model1);



figure(10);
Model2 = MuonCount_vs_PascalLinearModel;
plot(Model2);

figure(11);
Model3 = MuonCount_vs_TemperatureReadingLinearModel;
plot(Model3);

figure(12);
Model4 = MuonCount_vs_WindSpeedLinearModel;
plot(Model4);

figure(13);
Model5 = MuonCount_vs_HumidityLinearModel;
plot(Model5);

figure(14);
Model6 = MuonCount_vs_DewPointLinearModel;
plot(Model6);

figure(15);
Model7 = MuonCount_vs_CloudLayerLinearModel;
plot(Model7);

figure(16);
Model8 = DewPoint_vsHumidityLinearModel;
plot(Model8);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

%CODE STOPPED BECAUSE OF POLYNOMIAL FIT NOT BEING NEEDED

%Polynomial regression models for muon count vs various variables/factors.

% figure(16)
% MuonPolynomial = fit(IntegerDays,MuonPolyIntake, 'poly2', 'Normalize','on');
% hold on
% grid on
% plot(MuonDailyAve,'o');
% xlim([0 88]);
% ylim([80.0 90.0]);
% xlabel('Dates');
% ylabel('Muon Count');
% legend('Muon Count');
% plot(MuonPolynomial,'predobs');
% hold off



%%
%Not used in final conclusion
figure(17)
grid on
hold on
plot(TemperatureDailyAve,'o');
xlim([0 88]);
ylim([80.0 90.0]);
xlabel('Dates');
ylabel('Muon Count');
Muon_vs_TemperaturePoly = fit(TemperatureDailyAve,MuonDailyAve,'poly2','Normalize', 'on');
plot(Muon_vs_TemperaturePoly, 'predobs');

hold off




save Regression2;

