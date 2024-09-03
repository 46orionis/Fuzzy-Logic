close all 
clear all
clc

radius = 1;
S = 10;
minX = 0;
maxX = S;
minY = 0;
maxY = S;
nC = zeros(1,4);
maxStep = 100;
EneTA = zeros(1,maxStep);
EneTM = zeros(1,maxStep);
PosA = zeros(maxStep,2);
PosM = zeros(maxStep,2);

% Generate random x and y coordinates for the gold position
x = S * rand();  
y = S * rand();
G = [x,y];

% Display the random gold position
C = [0 0;0 S;S 0 ;S S];
disp("Gold position: ");
disp(G);
for i = 1:4
    nC(i) = norm(C(i)-G);
end
UB = max (max(nC(1),nC(2)),max(nC(3),nC(4)));

EnergyA = 100;
EnergyM = 100;

Rfs = Reward(UB);
Pf = Position(UB);
RfsM = RewardM(UB);
PfM = PositionM(UB);
Step = 0;
A = S * [rand(), rand()];
GO = 2;
M = S * [rand(), rand()];
figure;

while GO == 2
    % Generate random x and y coordinates for the monster
 
    % Ensure agent stays within the boundaries
    A = max([minX, minY], min(A, [maxX, maxY]));
    M = max([minX, minY], min(M, [maxX, maxY]));
    
    % Calculate distances
    disA2G = norm(A - G);
    disA2M = norm(A - M);
    disM2G = norm(M - G);
    
    % Calculate rewards and positions
    RA = evalfis([disA2G, disA2M], Rfs);
    PA = evalfis(disM2G, Pf);
    EnergyA = EnergyA + RA;
    
    A = max(min(PA * G + (1 - PA) * (2 * G - M), 10), 0);
     
    RM = evalfis([disM2G,disA2M, disA2G], RfsM);
    PM = evalfis(disA2G, PfM);
    EnergyM = EnergyM + RM;
    
    M = max(min(PM * G + (1 - PM) * (2*G-rand()*A), 10), 0);

    
    Step = Step + 1; 
    EneTA(Step) = EnergyA;
    EneTM(Step) = EnergyM;
    
    PosA(Step, :) = A;
    PosM(Step, :) = M;
    
    % Plot positions of A, M, and G
    hold off;
    plot(A(1), A(2), 'ro', 'DisplayName', 'Agent');
    hold on;
    plot(M(1), M(2), 'bo', 'DisplayName', 'Monster');
    plot(G(1), G(2), 'go', 'DisplayName', 'Gold');
    xlabel('X coordinate');
    ylabel('Y coordinate');
    title('Fuzzy World Adventure (Level 0)');
    legend('Location', 'best');
    axis([0 S 0 S]); % Set the axis limits to match the game area
    
    % Display number of steps and energy value
    text(S-2, S-1, sprintf('Step: %d', Step), 'FontSize', 12, 'Color', 'black');
    text(S-2, S-2, sprintf('EnergyA: %.2f', EnergyA), 'FontSize', 12, 'Color', 'black');
    text(S-2, S-3, sprintf('EnergyM: %.2f', EnergyM), 'FontSize', 12, 'Color', 'black');
    
    % Check game status
    if Step > maxStep 
        if EnergyA > EnergyM
            GO = 0;
            fprintf("Max steps reached Agent a head\n");
        elseif EnergyM > EnergyA
            GO = 0;
            fprintf("Max steps reached Monster a head\n");
        end
    elseif EnergyA >= 200
        GO = 1;
        fprintf("Agent Won\n");
    elseif EnergyA <= 0
        GO = -1;
        fprintf("Agent Lost\n");
    elseif EnergyA <= 0 & EnergyM <= 0
        GO = -1;
        fprintf("It s a Tie\n");
    elseif EnergyM >= 200
        GO = 1;
        fprintf("Monster Won\n");
    elseif EnergyM >= 200 & EnergyA >= 200
        GO = 1;
        fprintf("Ist s a Tie\n");
    elseif EnergyM<= 0
        GO = -1;
        fprintf("Monster Lost\n");
    end
    
    pause(0.5);  % Pause the loop until a key is pressed
end
