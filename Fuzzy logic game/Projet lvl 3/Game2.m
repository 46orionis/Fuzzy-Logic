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
EneT = zeros(1,maxStep);
EneT2 = zeros(1,maxStep);
PosA = zeros(maxStep,2);
PosA2 = zeros(maxStep,2);
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

Energy = 100;
Energy2 = 100;

Rfs = Reward(UB);
Pf = Position(UB);
Step = 0;
A = S * [rand(), rand()];
A2 = S * [rand(), rand()];
GO = 2;

figure;

while GO == 2
    % Generate random x and y coordinates for the monster
 
    M = S * [rand(), rand()];
    
    % Ensure agent stays within the boundaries
    A = max([minX, minY], min(A, [maxX, maxY]));
    A2 = max([minX, minY], min(A2, [maxX, maxY]));
    
    % Calculate distances
    disA2G = norm(A - G);
    disA2M = norm(A - M);
    disA2G2 = norm(A2 - G);
    disA2M2 = norm(A2 - M);
    disM2G = norm(M - G);
    
    % Calculate rewards and positions
    R = evalfis([disA2G, disA2M], Rfs);
    P = evalfis(disM2G, Pf);
    Energy = Energy + R;
    A = max(min(P * G + (1 - P) * (2 * G - M), 10), 0);
     
    R2 = evalfis([disA2G2, disA2M2], Rfs);
    P2 = evalfis(disM2G, Pf);
    Energy2 = Energy2 + R2;
    A2 = max(min(P2 * G + (1 - P2) * (2 * G - M), 10), 0);

    
    Step = Step + 1; 
    EneT(Step) = Energy;
    PosA(Step, :) = A;
    PosA2(Step, :) = A2;
    PosM(Step, :) = M;
    
    % Plot positions of A, M, and G
    hold off;
    plot(A(1), A(2), 'ro', 'DisplayName', 'Agent');
    plot(A2(1), A2(2), 'yo', 'DisplayName', 'Agent2');
    hold on;
    plot(A(1), A(2), 'ro', 'DisplayName', 'Agent');
    plot(A2(1), A2(2), 'yo', 'DisplayName', 'Agent2');
    plot(M(1), M(2), 'bo', 'DisplayName', 'Monster');
    plot(G(1), G(2), 'go', 'DisplayName', 'Gold');
    xlabel('X coordinate');
    ylabel('Y coordinate');
    title('Fuzzy World Adventure (Level 0)');
    legend('Location', 'best');
    axis([0 S 0 S]); % Set the axis limits to match the game area
    
    % Display number of steps and energy value
    text(S-2, S-1, sprintf('Step: %d', Step), 'FontSize', 12, 'Color', 'black');
    text(S-2, S-2, sprintf('Energy: %.2f', Energy), 'FontSize', 12, 'Color', 'black');
    text(S-2, S-3, sprintf('Energy2: %.2f', Energy2), 'FontSize', 12, 'Color', 'black');
    
    % Check game status
    if Step > maxStep 
        GO = 0;
        fprintf("Agent 1 Try Again\n");
    elseif Energy >= 200
        GO = 1;
        fprintf("You Won\n");
    elseif Energy <= 0
        GO = -1;
        fprintf("You Lost\n");
    end
    
     if Step > maxStep 
        GO = 0;
        fprintf("Agent2 Try Again\n");
    elseif Energy2 >= 200
        GO = 1;
        fprintf("Agent2 Won\n");
    elseif Energy2 <= 0
        GO = -1;
        fprintf("Agent2 Lost\n");
    end
    
    pause(0.5);  
end
