# CSINTY MCO1 BFS ALGORITHM
# N01 Group 2
# Members: Rodriguez, Andrew ; De Guzman, Evan ; Tiu, Lance ; Ramos, Rafael ; Wang, Vince


# BFS function
def BFS(graph, start, goal):

    # Initialize variables
    queue = [start] # Queue
    known = {start: None} # Known nodes 
    visit = [] # Visit list

    # Loop while queue is filled
    while queue:
        
        current = queue.pop(0) # Get next node from queue / Deque
        visit.append(current) # Add node to visit list
        
        # print progress
        print(f"Visited: {list(visit)}")
        print(f"Current node: {current}")
        print(f"Queue: {list(queue)}")
        print(f"Known: {known}\n")
        
        # If goal found, return path
        if current == goal:
            return getPath(known, start, goal) # return BFS path
        
        # Visit the neighboring nodes
        for neighbor in graph[current]:

            if neighbor not in known: # Check if node is already known

                queue.append(neighbor) # Add neighbor to queue
                known[neighbor] = current # Add current node to known list
                print(f"Added {neighbor} to the queue\n")
    
    # If unable to find goal, return none
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

            #elif algo_choice == '2':
             #   path = AStar(graph, heuristic, start, goal)
              #  if path:
               #     print(f"The path from {start} to {goal} is: {path}")
               # else:
                #    print(f"No path found from {start} to {goal}")

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
  
