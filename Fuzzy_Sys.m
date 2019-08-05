function [result, SWP] = Fuzzy_Sys(MFNumber, LowerBound, UpperBound, MFHandle, Rule_List)
SWP=newfis('Mackey-Glass TimeSeries Prediction');
for i=1:numel(MFNumber)-1
    Name=['X' num2str(i)];
    SWP=addvar(SWP,'input',Name,[LowerBound(i),UpperBound(i)]);
    switch MFHandle(i)
        case 1
            Step=(UpperBound(i)-LowerBound(i))/(MFNumber(i)-1);
            for j=1:MFNumber(i)
                Center=LowerBound(i)+(j-1)*Step;
                MFName=[Name '_MF' num2str(j)];
                SWP=addmf(SWP,'input',i,MFName,'trimf',[Center-Step,Center,Center+Step]);
            end
        case 2
            Step=(UpperBound(i)-LowerBound(i))/(MFNumber(i)-1)/3;
            for j=1:MFNumber(i)
                Center=LowerBound(i)+(j-1)*3*Step;
                MFName=[Name '_MF' num2str(j)];
                SWP=addmf(SWP,'input',i,MFName,'trapmf',[Center-2*Step,Center-Step,Center+Step,Center+2*Step]);
            end
        case 3
            Step=(UpperBound(i)-LowerBound(i))/(MFNumber(i)-1)/2;
            for j=1:MFNumber(i)
                Center=LowerBound(i)+(j-1)*2*Step;
                MFName=[Name '_MF' num2str(j)];
                SWP=addmf(SWP,'input',i,MFName,'gaussmf',[Step,Center]);
            end
    end
end
SWP=addvar(SWP,'output','Y',[LowerBound(end),UpperBound(end)]);
switch MFHandle(end)
        case 1
            Step=(UpperBound(end)-LowerBound(end))/(MFNumber(end)-1);
            for j=1:MFNumber(end)
                Center=LowerBound(end)+(j-1)*Step;
                MFName=[Name '_MF' num2str(j)];
                SWP=addmf(SWP,'output',1,MFName,'trimf',[Center-Step,Center,Center+Step]);
            end
        case 2
            Step=(UpperBound(end)-LowerBound(end))/(MFNumber(end)-1)/3;
            for j=1:MFNumber(end)
                Center=LowerBound(end)+(j-1)*3*Step;
                MFName=[Name '_MF' num2str(j)];
                SWP=addmf(SWP,'output',1,MFName,'trapmf',[Center-2*Step,Center-Step,Center+Step,Center+2*Step]);
            end
        case 3
            Step=(UpperBound(end)-LowerBound(end))/(MFNumber(end)-1)/2;
            for j=1:MFNumber(end)
                Center=LowerBound(end)+(j-1)*2*Step;
                MFName=[Name '_MF' num2str(j)];
                SWP=addmf(SWP,'output',1,MFName,'gaussmf',[Step,Center]);
            end
end
SWP=addrule(SWP,Rule_List);
result = 'Fuzzy System is Established!';