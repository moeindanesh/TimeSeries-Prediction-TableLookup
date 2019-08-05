%initialize Mfile
clear;
clc;

%% Setup and Config
% Insert Data
DN = input('Enter number of data = ');
DataNumber = DN;

IN = input('Enter number of Inputs = ');
InputsNumber=IN;

MFN = input('Enter the number of Memebership Functions = ');
MFNumber  =MFN;

MFT = input('Enter the type of Memebership Functions(trimf:1   trapmf:2    gaussmf:3) = ');
MFHandle =MFT;

tic; % to calculate Elapsed Time - start

% Basic Data for TimeSeries (if TimeDelay = 30)
SamplingBound=[0.2 0.50]; 
SamplingResolution=0.01;
TimeDelay = 30;

LowerBound=0.2;
UpperBound=1.4;
TrainingRatio=0.5;

%Validating Inserted Data
[DVResult, MFNumber, LowerBound, UpperBound, MFHandle] = Data_Validating(MFNumber, LowerBound, UpperBound, MFHandle, InputsNumber);
disp(DVResult);

%MackeyGlass Sampling and Pairs
[Samples] = MackeyGlass_TimeSeries(SamplingBound, SamplingResolution, TimeDelay, DataNumber);

[DPResult, TrainData] = Data_Pairs(TrainingRatio, Samples, InputsNumber);
disp(DPResult);

%Rules
[RResult, Rules, RulesMV, Rule_List] = Rules(TrainData,MFNumber,LowerBound,UpperBound,MFHandle,true);
disp(RResult);

%Setup Fuzzy System
[FSResult, SWP] = Fuzzy_Sys(MFNumber, LowerBound, UpperBound, MFHandle, Rule_List);
disp(FSResult);


%% Evaluation And Plot
y=Samples(1:InputsNumber);
Samp=Samples(1:InputsNumber);
FigureHandle=figure('name','Results','numbertitle','off');
AxesHandle=axes;
SAMPLES=plot(AxesHandle,Samples(1:InputsNumber),'ydatasource','Samples');
hold on
Results=plot(AxesHandle,y,'r','ydatasource','y');

SAMP=plot(AxesHandle,Samp,'b','ydatasource','Samp');
xlim([0 numel(Samples)]);
ylim([LowerBound(end) UpperBound(end)]);

%runTime Plot
for i=InputsNumber+1:numel(Samples)
    STR=['Progress= ' num2str(i/numel(Samples)*100) ' %'];
    y(i)=evalfis(Samples(i-InputsNumber:i-1),SWP);
    Samp(i)=Samples(i);
    clc
    disp(STR);
    refreshdata(Results);
    refreshdata(SAMP);
    drawnow;
end

legend(AxesHandle,'Real Value','Prediction');
Error=sum(abs(Samples-y));
ERROR=['Prediction Error=' num2str(Error)];
xlabel(ERROR);
toc; % to calculate Elapsed Time - finish