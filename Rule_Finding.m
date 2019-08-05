function [Rule Rule_MV]=Rule_Finding(Pair,MFNumber,LowerBound,UpperBound,MembershipFunctionHandle)
MV=nan(1,numel(MFNumber));
MF=nan(1,numel(MFNumber));
Rule=nan((size(Pair)));
Rule_MV=nan((size(Pair)));
    for i=1:size(Pair,1)        
        for j=1:numel(MFNumber)
            [MV(j) MF(j)]=MF_Detect(Pair(i,j),MFNumber(j),LowerBound(j),UpperBound(j),MembershipFunctionHandle(j));    
        end
        Rule(i,:)=MF;
        Rule_MV(i,:)=MV;
    end
end