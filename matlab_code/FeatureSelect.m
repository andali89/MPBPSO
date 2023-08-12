% Copyright (c) 2023, An-Da Li. All rights reserved. 
% Please read LICENCE for license terms.
% Coded by An-Da Li
% Email: andali1989@163.com

% This is a Matlab implementation of the MPBPSO algorithm, a 
% multi-objective particle swarm optimization algorithm, proposed
% for key quality feature selection in complex manufacturing processes.
% Please refer to the following paper for detail information of  this
% algorithm:

% Li, A.-D., Xue, B., & Zhang, M. (2023). Multi-objective particle swarm 
% optimization for key quality feature selection in complex manufacturing 
% processes. Information Sciences, 641, 119062.
% https://doi.org/10.1016/j.ins.2023.119062

% The element in Array equals 1 indicates the corresponding feature is kept.
function [DataS]=FeatureSelect(Data,Array)
    remove=weka.filters.unsupervised.attribute.Remove;
    remove.setInvertSelection(1)
    l=Data.classIndex();
    ArrayLength=size(Array,2);
    %index=[];
    index=zeros(1,sum(Array));
    ii=1;
    for i=1:ArrayLength
        if Array(:,i)==1
           % index=[index,i-1];
            index(ii)=i-1;
            ii=ii+1;
        end
    end
    index=[index,l];
    remove.setAttributeIndicesArray(index);
    remove.setInputFormat(Data);
    DataS=weka.filters.Filter.useFilter(Data,remove);
    %testsetr=weka.filters.Filter.useFilter(testset,remove);
    
end