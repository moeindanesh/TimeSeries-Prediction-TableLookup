function [result, MFNumber, LowerBound, UpperBound, MFHandle] = Data_Validating(MFNumber, LowerBound, UpperBound, MFHandle, InputsNumber)
if numel(MFNumber)~=InputsNumber
    if numel(MFNumber)==1
        MFNumber=repmat(MFNumber,1,InputsNumber+1);
    else
        disp('Invalid Membership Function Number!');
        MFNumber=nan;
    end
end
if numel(LowerBound)~=InputsNumber
    if numel(LowerBound)==1
        LowerBound=repmat(LowerBound,1,InputsNumber+1);
    else
        disp('Invalid Lower Boundary!');
        LowerBound=nan;
    end
end
if numel(UpperBound)~=InputsNumber
    if numel(UpperBound)==1
        UpperBound=repmat(UpperBound,1,InputsNumber+1);
    else
        disp('Invalid Upper Boundary!');
        UpperBound=nan;
    end
end
if numel(MFHandle)~=InputsNumber
    if numel(MFHandle)==1
        MFHandle=repmat(MFHandle,1,InputsNumber+1);
    else
        disp('Invalid Membership Function Handle!');
        MFHandle=nan;
    end
end
result = 'Initiating => Done';
