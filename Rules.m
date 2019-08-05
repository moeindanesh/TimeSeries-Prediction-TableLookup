function [result, Rules, RulesMV, Rule_List] = Rules(TrainData,MFNumber,LowerBound,UpperBound,MFHandle,CheckConflict)
[Rules, RulesMV]=Rule_Finding(TrainData,MFNumber,LowerBound,UpperBound,MFHandle);

if CheckConflict
    Rules=Conflict(Rules,RulesMV);
    Rule_List=[Rules ones(size(Rules,1),2)];
else
    Rule_List=[Rules prod(RulesMV,2) ones(size(Rules,1),1)];
end
result = 'Rules => Done';