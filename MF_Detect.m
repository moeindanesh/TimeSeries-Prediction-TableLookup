function [M_Value MF_No]=MF_Detect(x,N,LowerBound,UpperBound,MembershipFunctionHandle)
y=nan(1,N);
switch MembershipFunctionHandle
    case 1
        Step=(UpperBound-LowerBound)/(N-1);
        for i=1:N
            Center=LowerBound+(i-1)*Step;
            y(i)=trimf(x,[Center-Step,Center,Center+Step]);
        end
    case 2
        Step=(UpperBound-LowerBound)/(N-1)/3;
        for i=1:N
            Center=LowerBound+(i-1)*3*Step;
            y(i)=trapmf(x,[Center-2*Step,Center-Step,Center+Step,Center+2*Step]);
        end
    case 3
        Step=(UpperBound-LowerBound)/(N-1)/2;
        for i=1:N
            Center=LowerBound+(i-1)*2*Step;
            y(i)=gaussmf(x,[Step,Center]);
        end
    otherwise
        disp('Selected Membership Function is undefined!')
end
[M_Value MF_No]=max(y);
end