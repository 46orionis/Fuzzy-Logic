function [Rfs] = reward(UB)
Rfs = newfis('Reward','FISType','sugeno');
% Define the range of x and y coordinates

%add variables
Rfs = addvar(Rfs,'input','disA2G',[0 UB]);
Rfs = addmf(Rfs,'input',1,'low','gaussmf',[UB/3 0]);
Rfs = addmf(Rfs,'input',1,'high','gaussmf',[UB/3 UB]);

%add variables
Rfs = addvar(Rfs,'input','disA2M',[0 UB]);
Rfs = addmf(Rfs,'input',2,'low','gaussmf',[UB/3 0]);
Rfs = addmf(Rfs,'input',2,'high','gaussmf',[UB/3 UB]);
%%
%add variables
Rfs = addvar(Rfs,'output','reward',[-10 10]);
Rfs = addmf(Rfs,'output',1,'VeryHigh','constant',10);
Rfs = addmf(Rfs,'output',1,'High','constant',5);
Rfs = addmf(Rfs,'output',1,'Low','constant',-2);
Rfs = addmf(Rfs,'output',1,'VeryLow','constant',-10);


%% Add rules
%rule  = [in1 out1 weight con]
rule1 = [1 1 3 1 2];
rule2 = [1 2 1 1 2];
rule3 = [2 1 4 1 2];
rule4 = [2 2 2 1 2];

ruleList = [rule1;rule2;rule3;rule4];
Rfs = addRule(Rfs,ruleList);
showrule(Rfs)
end