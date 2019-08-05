function [result, TrainData] = Data_Pairs(TrainingRatio, Samples, InputsNumber)
TrainData=nan(round(TrainingRatio*numel(Samples)),InputsNumber+1);
for i=1:round(TrainingRatio*numel(Samples))
    TrainData(i,:)=Samples(i:i+InputsNumber);
end
result = 'Data Pairs => Done';