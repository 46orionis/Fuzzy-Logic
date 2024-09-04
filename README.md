# Fuzzy Logic Adaptive Agent Simulation
A game simulation based on fuzzy logic principles using Matlab

## Description:
This project implements a simulation using fuzzy logic in MATLAB to control an adaptive agent navigating within a defined environment. The objective of the agent is to reach a fixed goal while avoiding a randomly placed monster,The agent's decision-making process is governed by fuzzy logic, which allows it to navigate the box effectively based on varying levels of proximity to both the gold and the monster optimizing its path based on fuzzy logic rules. The project demonstrates the application of fuzzy logic in real-time decision-making within a dynamic environment to develop adaptive and intelligent behaviors in-game scenarios.

## Key Features:

### Randomized Environment:
At the start of each simulation, the agent, gold, and monster are randomly positioned. During each iteration, while the gold remains fixed, the monster is randomly repositioned, creating a dynamic and unpredictable challenge for the agent.

### Fuzzy Logic Decision-Making: 
The agent's movements and actions are governed by a fuzzy logic system that evaluates its distance from the gold and the monster, enabling adaptive and nuanced decision-making.

### Dynamic Simulation: 
As the simulation progresses, the agent continuously adjusts its path based on the fixed position of the gold and the dynamically repositioned monster, adhering to the fuzzy logic rules set in place.

### Real-Time Visualization: 
The simulation is visually represented within MATLAB, displaying the positions of the agent, monster, and gold, along with the agent's energy level, allowing for clear observation of the agent's performance.

## How It Works

### Initialization:

The environment is a 10x10 grid where the agent, monster, and goal are randomly placed at the beginning of each simulation run.
The agent starts with an initial energy level of 100.

### Fuzzy Logic Rules:

The agent's movement is influenced by two fuzzy logic controllers:
Reward System: Evaluates the distance from the agent to the goal and the monster, adjusting the agent's energy.
Positioning System: Determines the agent's movement direction based on the distance between the monster and the goal.

###Simulation Loop:


### different levels 
Lvl 0: 
In each iteration:
The monster is randomly repositioned.
The agent’s position is updated based on the fuzzy logic evaluation.
The agent's energy level is adjusted.
The simulation continues until one of the following conditions is met:
The agent's energy reaches 200 (win condition).
The agent's energy drops to 0 (loss condition).
The maximum number of steps (100) is reached (retry condition).

Lvl 1:

Iteration Process:
The monster is randomly repositioned within a specified radius around the gold.
The agent’s position is updated based on the fuzzy logic evaluation of distances between the agent, monster, and gold.
The agent's energy level is adjusted according to the fuzzy logic system's output.

Termination Conditions:
Win Condition: The simulation ends if the agent's energy reaches 200, indicating a successful outcome.
Loss Condition: The simulation ends if the agent's energy drops to 0, indicating a failure.
Retry Condition: The simulation ends if the maximum number of steps (100) is reached, requiring a retry.

Lvl 2: 
Iteration Process:
The monster is randomly repositioned within the environment.
The agent’s position is updated according to fuzzy logic rules based on its distances to the gold, the monster, and two specific points (B1 and B2).
If the agent comes within a certain radius of B1 or B2, an additional energy boost is applied.
The agent's energy level is updated based on the fuzzy logic evaluation and any additional energy gained from proximity to B1 or B2.

Termination Conditions:
Win Condition: The simulation ends if the agent's energy reaches 200, signifying a win.
Loss Condition: The simulation ends if the agent's energy drops to 0, resulting in a loss.
Retry Condition: The simulation ends if the maximum number of steps (100) is reached, prompting a retry.

Lvl 3.1:

Iteration Process:
Agent and Monster Positioning: In each iteration, both the agent and the monster update their positions based on fuzzy logic rules.
The agent's position is updated considering its distance to the gold and the monster.
The monster's position is adjusted considering its distance to the agent and the gold.
Energy Updates: Both the agent's and monster's energy levels are updated based on their respective fuzzy logic evaluations.

Termination Conditions:
Win Condition: The simulation ends with a win for either the agent or the monster when their energy level reaches 200.
Loss Condition: The simulation ends with a loss for either the agent or the monster when their energy level drops to 0.
Tie Condition: If both the agent's and monster's energy levels reach 200 or drop to 0 simultaneously, the game ends in a tie.
Max Steps Condition: If the maximum number of steps (100) is reached:
The simulation ends, with the winner being the entity (agent or monster) with the higher energy level.

Lvl 3.2:

Iteration Process:
Agent and Monster Positioning: In each iteration, both agents (Agent 1 and Agent 2) and the monster update their positions based on fuzzy logic rules:
Each agent's position is updated considering its distance to the gold and the monster.
The monster's position is randomly generated within the boundaries.
Energy Updates: Both agents' energy levels are updated according to fuzzy logic evaluations, which consider their proximity to the gold and the monster.

Termination Conditions:
Win Condition:
Agent 1: The simulation ends with a win for Agent 1 if its energy level reaches 200.
Agent 2: The simulation ends with a win for Agent 2 if its energy level reaches 200.
Loss Condition:
Agent 1: The simulation ends with a loss for Agent 1 if its energy level drops to 0.
Agent 2: The simulation ends with a loss for Agent 2 if its energy level drops to 0.
Max Steps Condition:
If the maximum number of steps (100) is reached, the simulation ends with the respective agent failing to win.

##Installation and Usage
Clone the repository to your local machine.
Open the project in MATLAB.
Run the main script file (Game.m) to start the simulation. 

Acknowledgments
Special thanks to my professor for the guidance and support in the fascinating subject of fuzzy logic, which made this project possible.

