function [Samples] = MackeyGlass_TimeSeries(SamplingBound, SamplingResolution, TimeDelay, DataNumber)
Samples=SamplingBound(1):SamplingResolution:SamplingBound(2);
init = ((SamplingBound(2) - SamplingBound(1) + SamplingResolution)/SamplingResolution)+1; %32
for i=init:DataNumber+init
    Samples(i)=0.2*Samples(i-TimeDelay)/(1+(Samples(i-TimeDelay)^10))+0.9*Samples(i-1);
end
Samples=Samples(init+1:end);