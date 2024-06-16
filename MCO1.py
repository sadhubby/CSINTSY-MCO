# CSINTY MCO1 BFS ALGORITHM
# N01 Group 2
# Members: Rodriguez, Andrew ; De Guzman, Evan ; Tiu, Lance ; Ramos, Rafael ; Wang, Vince

import heapq

# BFS function
def AStar(graph, heuristic, start, goal):
    open_set = []
    heapq.heappush(open_set, (0 + heuristic[start], start))
    came_from = {start: None}
    g_score = {start: 0}
    visit = []  # Visit list for A*

    while open_set:
        current = heapq.heappop(open_set)[1]
        visit.append(current)  # Add node to visit list

        # Print progress
        print(f"Visited: {list(visit)}")
        print(f"Current node: {current}")
        print(f"Open set: {[node for _, node in open_set]}")
        print(f"G-scores: {g_score}")
        print(f"Came from: {came_from}\n")

        if current == goal:
            return getPath(came_from, start, goal)

        for neighbor, cost in graph[current].items():
            tentative_g_score = g_score[current] + cost
            if neighbor not in g_score or tentative_g_score < g_score[neighbor]:
                came_from[neighbor] = current
                g_score[neighbor] = tentative_g_score
                f_score = tentative_g_score + heuristic[neighbor]
                heapq.heappush(open_set, (f_score, neighbor))
                print(f"Added {neighbor} to the open set with f-score: {f_score}\n")

    return None

# get path function
def getPath(visited, start, goal):

    path = [] # Initialize list
    current = goal 
    while current is not None:
        path.append(current) # Add node to path
        current = visited[current] # Use node as key to previous node
    path.reverse()
    return path # BFS path

def getGraph():
    graph = {}  # Initialize graph
    heuristic = {}  # Initialize heuristic values

    print("Enter the adjacency list (format: node: neighbor1 cost1 neighbor2 cost2 ...). Enter 'END' when done:")

    while True:
        line = input("> ")
        if line == 'END':  # Exit loop when "END" is detected
            break
        parts = line.split(':')
        node = parts[0].strip()
        neighbors = parts[1].strip().split()
        neighbors_dict = {}
        for i in range(0, len(neighbors), 2):
            neighbor = neighbors[i]
            cost = int(neighbors[i + 1])
            neighbors_dict[neighbor] = cost
        graph[node] = neighbors_dict  # Add nodes to the graph

    print("Enter heuristic values (format: node heuristic_value). Enter 'END' when done:")
    while True:
        line = input("> ")
        if line == 'END':  # Exit loop when "END" is detected
            break
        node, h_value = line.split()
        heuristic[node] = int(h_value)

    return graph, heuristic  # Return graph and heuristic values

# Main
def main():
    graph = {}
    heuristic = {}

    while True:
        print("\n1. Define or Edit Graph")
        print("2. Choose Algorithm")
        print("3. Exit")
        choice = input("Enter your choice: ")

        if choice == '1':
            graph, heuristic = getGraph()  # Get graph with actual costs and heuristic values

        elif choice == '2':
            if not graph:
                print("Graph is empty. Define or edit the graph first.")
                continue

            print("\nChoose Algorithm:")
            print("1. BFS (Breadth-First Search)")
            print("2. A* (A Star) - Placeholder (Not Implemented)")
            print("3. Back to Main Menu")
            algo_choice = input("Enter your choice: ")

            start = input("Start node: ")
            goal = input("Goal node: ")

            if algo_choice == '1':
                path = BFS(graph, start, goal)
                if path:
                    print(f"The path from {start} to {goal} is: {path}")
                else:
                    print(f"No path found from {start} to {goal}")

            elif algo_choice == '2':
               path = AStar(graph, heuristic, start, goal)
               if path:
                    print(f"The path from {start} to {goal} is: {path}")
               else:
                    print(f"No path found from {start} to {goal}")

            elif algo_choice == '3':
                continue

            else:
                print("Invalid choice. Please enter a valid option.")

        elif choice == '3':
            print("Exiting program...")
            break

        else:
            print("Invalid choice. Please enter a valid option.")

# Call main
if __name__ == "__main__":
    main()

"""
# TEST CASE
A: B 1 C 4
B: A 1 D 2 E 5
C: A 4 F 1
D: B 2
E: B 5 F 3
F: C 1 E 3
END
A 7
B 6
C 2
D 5
E 3
F 0
END
"""
# REFERENCES
# 1. https://www.educative.io/answers/how-to-implement-a-breadth-first-search-in-python
# 2. https://www.youtube.com/watch?v=oDqjPvD54Ss
  
