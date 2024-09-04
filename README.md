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

The environment is a 10x10 grid where the agent, monster, and goal are randomly placed at the beginning of each simulation run.<br>
The agent starts with an initial energy level of 100.<br>

### Fuzzy Logic Rules:

The agent's movement is influenced by two fuzzy logic controllers:<br>
Reward System: Evaluates the distance from the agent to the goal and the monster, adjusting the agent's energy.<br>
Positioning System: Determines the agent's movement direction based on the distance between the monster and the goal.<br>

### Simulation Loop:

### Lvl 0: 
Iteration Process:
The monster is randomly repositioned.<br>
The agent’s position is updated based on the fuzzy logic evaluation.<br>
The agent's energy level is adjusted.<br>
The simulation continues until one of the following conditions is met:<br>
The agent's energy reaches 200 (win condition).<br>
The agent's energy drops to 0 (loss condition).<br>
The maximum number of steps (100) is reached (retry condition).<br>

### Lvl 1:

Iteration Process:<br>
The monster is randomly repositioned within a specified radius around the gold.<br>
The agent’s position is updated based on the fuzzy logic evaluation of distances between the agent, monster, and gold.<br>
The agent's energy level is adjusted according to the fuzzy logic system's output.

Termination Conditions:<br>
Win Condition: The simulation ends if the agent's energy reaches 200, indicating a successful outcome.<br>
Loss Condition: The simulation ends if the agent's energy drops to 0, indicating a failure.<br>
Retry Condition: The simulation ends if the maximum number of steps (100) is reached, requiring a retry.<br>

### Lvl 2: 
Iteration Process:<br>
The monster is randomly repositioned within the environment.<br>
The agent’s position is updated according to fuzzy logic rules based on its distances to the gold, the monster, and two specific points (B1 and B2).<br>
If the agent comes within a certain radius of B1 or B2, an additional energy boost is applied.<br>
The agent's energy level is updated based on the fuzzy logic evaluation and any additional energy gained from proximity to B1 or B2.

Termination Conditions:<br>
Win Condition: The simulation ends if the agent's energy reaches 200, signifying a win.<br>
Loss Condition: The simulation ends if the agent's energy drops to 0, resulting in a loss.<br>
Retry Condition: The simulation ends if the maximum number of steps (100) is reached, prompting a retry.<br>

### Lvl 3.1:

Iteration Process:<br>
Agent and Monster Positioning: In each iteration, both the agent and the monster update their positions based on fuzzy logic rules.<br>
The agent's position is updated considering its distance to the gold and the monster.<br>
The monster's position is adjusted considering its distance to the agent and the gold.<br>
Energy Updates: Both the agent's and monster's energy levels are updated based on their respective fuzzy logic evaluations.

Termination Conditions:<br>
Win Condition: The simulation ends with a win for either the agent or the monster when their energy level reaches 200.<br>
Loss Condition: The simulation ends with a loss for either the agent or the monster when their energy level drops to 0.<br>
Tie Condition: If both the agent's and monster's energy levels reach 200 or drop to 0 simultaneously, the game ends in a tie.<br>
Max Steps Condition: If the maximum number of steps (100) is reached:<br>
The simulation ends, with the winner being the entity (agent or monster) with the higher energy level.<br>

### Lvl 3.2:

Iteration Process:<br>
Agent and Monster Positioning: In each iteration, both agents (Agent 1 and Agent 2) and the monster update their positions based on fuzzy logic rules:<br>
Each agent's position is updated considering its distance to the gold and the monster.<br>
The monster's position is randomly generated within the boundaries.<br>
Energy Updates: Both agents' energy levels are updated according to fuzzy logic evaluations, which consider their proximity to the gold and the monster.

Termination Conditions:<br>
Win Condition:<br>
Agent 1: The simulation ends with a win for Agent 1 if its energy level reaches 200.<br>
Agent 2: The simulation ends with a win for Agent 2 if its energy level reaches 200.<br>
Loss Condition:<br>
Agent 1: The simulation ends with a loss for Agent 1 if its energy level drops to 0.<br>
Agent 2: The simulation ends with a loss for Agent 2 if its energy level drops to 0.<br>
Max Steps Condition:<br>
If the maximum number of steps (100) is reached, the simulation ends with the respective agent failing to win.<br>

## Installation and Usage
Clone the repository to your local machine.<br>
Open the project in MATLAB.<br>
Run the main script file (Game.m) to start the simulation. 

## Acknowledgments
Special thanks to my professor for the guidance and support in the fascinating subject of fuzzy logic, which made this project possible.

