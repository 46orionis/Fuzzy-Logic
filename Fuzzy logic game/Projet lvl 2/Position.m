function [Pf] = Position(UB)
% Build FIS
Pf = newfis('Position');

% Add variables
Pf = addvar(Pf,'input','disM2G',[0 UB]);
Pf = addmf(Pf,'input',1,'low','gaussmf',[UB/3 0]);
Pf = addmf(Pf,'input',1,'high','gaussmf',[UB/3 UB]);

Pf = addvar(Pf,'output','Position',[0 1]);
Pf = addmf(Pf,'output',1,'small','gaussmf',[0.25 0]);
Pf = addmf(Pf,'output',1,'Big','gaussmf',[0.25 1]);

ruleList = [1 1 1 2;
            2 2 1 2];
Pf = addRule(Pf,ruleList);
showrule(Pf)
% fuzzyLogicDesigner(Pf)
end
