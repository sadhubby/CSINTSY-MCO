# CSINTSY-MCO1
CSINTSY MCO1

The program to be used is MCO1.py.

On start, the program will prompt the user to pick to either create or edit a graph or choose an algortihm to search for a path

1. Define or Edit Graph
2. Choose Algorithm
3. Exit

Enter the number of the option you want to pick

**Before choosing an algorithm, the graph must be defined. To do so, choose 1.**

## Defining a graph

The user will then be asked to input values in this specific format: `node` `cost`. Furthermore, consider the nature of the graph being undirected. Since it is undirected, please input all possible nodes that can be visited by an individual node, whether child or not. 

The program is very sensitive to spaces as the values always come pairwise. 
With this sensitivity in mind, please do not add spaces on `node`, where for example `los angeles` becomes `losangeles` instead. To help in inputting the problem specifications,
this script can be inputted. 

    DAL: LA 1700 NY 1500 MIA 1200
    LA: DAL 1700 NY 3000 SF 500
    NY: DAL 1500 LA 3000 MIA 1000 BOS 250 CHI 800
    MIA: DAL 1200 NY 1000
    SF: LA 500 CHI 2200
    BOS: NY 250
    CHI: NY 800 SF 2200

After pasting this entire script, please type "END". This already solves the sensitivity of the program to spaces and instead uses shortened markers for the cities. Besides that it makes sure that all possible nodes that can be visited from an individual node are present.

Afterwards the program will ask for heuristic cost. The input format for this section is `node` `heuristic cost`. Again, this also has sensitivity to spaces, so as to prevent errors, please do not add spaces to cities which names have spaces. Please copy paste this input script that also abides by the problem specifications.

    MIA 2000
    NY 800
    BOS 900
    DAL 1200
    SF 2200
    LA 2400
    CHI 0

After pasting this entire script, please type "END". By this point, the graph is defined. Should there be a need to edit this within the Command Line Interface, select 1 again from the main menu and simply change certain values but the entire graph must once again inputted. If the user tries to execute an algorithm without a defined graph, the program will ask the user to do so.

## Choice of Algorithms

There are two choices of algorithm as chosen by the group. The two choices are Breadth-First Search or BFS and A* (A-Star) Search. In both cases, the user will be asked to input start node then the goal node. In the case of the problem specifications, please enter DAL as `start node` and CHI as `goal node`.

From this point on, no more inputs will be asked of the user and the program will execute the algorithms. This can be done numerous times and with possible changes that will be implemented by the user should they choose to edit the graph at any point in time. 

The last possible choice for the user is to exit the program. 