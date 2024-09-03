close all 
clear all
clc

S = 10;
minX = 0;
maxX = S;
minY = 0;
maxY = S;
nC = zeros(1,4);
maxStep = 100;
EneT = zeros(1,maxStep);
PosA = zeros(maxStep,2);
PosM = zeros(maxStep,2);

% Generate random x and y coordinates for the gold position
x = S * rand();  
y = S * rand();
G = [x,y];
B1 = S * [rand(), rand()];
B2 = S * [rand(), rand()];
radiusB = 2;
addR = 1.5;

% Display the random gold position
C = [0 0;0 S;S 0 ;S S];
disp("Gold position: ");
disp(G);
for i = 1:4
    nC(i) = norm(C(i)-G);
end
UB = max (max(nC(1),nC(2)),max(nC(3),nC(4)));

Energy = 100;

Rfs = Reward(UB);
Pf = Position(UB);
Step = 0;
A = S * [rand(), rand()];
GO = 2;

figure;

while GO == 2
    % Generate random x and y coordinates for the monster
    Mx = S * rand();
    My = S * rand();
    M = [Mx, My];
    M = max(min(M,10), 0);
    
    % Calculate distances
    disA2G = norm(A - G);
    disA2M = norm(A - M);
    disM2G = norm(M - G);
    disA2B1 = norm(A-B1);
    disA2B2 = norm(A-B2);
    
    % Calculate rewards and positions
    R = evalfis([disA2G, disA2M], Rfs);
    P = evalfis(disM2G, Pf);
    
    if disA2B1<radiusB || disA2B2<radiusB
        Energy = Energy + R+addR;
    else
         Energy = Energy + R;
    end
     A = max(min(P * G + (1 - P) * (2 * G - M), 10), 0);

    
    Step = Step + 1; 
    EneT(Step) = Energy;
    PosA(Step, :) = A;
    PosM(Step, :) = M;
    
    % Plot positions of A, M, and G
    hold off;
    plot(A(1), A(2), 'ro', 'DisplayName', 'Agent');
    hold on;
    plot(M(1), M(2), 'bo', 'DisplayName', 'Monster');
    plot(G(1), G(2), 'go', 'DisplayName', 'Gold');
    plot(B1(1), B1(2), 'go', 'DisplayName', 'B1');
    plot(B2(1), B2(2), 'go', 'DisplayName', 'B2');
    viscircles(B1, radiusB, 'Color', 'b', 'LineStyle', '--');
    viscircles(B2, radiusB, 'Color', 'r', 'LineStyle', '--');
    xlabel('X coordinate');
    ylabel('Y coordinate');
    title('FuzzyWorldAdventure');
    legend('Location', 'best');
    axis([0 S 0 S]); % Set the axis limits to match the game area
    
    % Display number of steps and energy value
    text(S-2, S-1, sprintf('Step: %d', Step), 'FontSize', 12, 'Color', 'black');
    text(S-2, S-2, sprintf('Energy: %.2f', Energy), 'FontSize', 12, 'Color', 'black');
    
    % Check game status
    if Step >= maxStep 
        GO = 0;
        fprintf("Try Again\n");
    elseif Energy >= 200
        GO = 1;
        fprintf("You Won\n");
    elseif Energy <= 0
        GO = -1;
        fprintf("You Lost\n");
    end
    
    pause(0.5);  % Add a short pause for better visualization
end
