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

    graph = {} #Initialize graph

    print("Enter the adjacency list (enter 'END' when done):")

    while True:
        line = input("> ")

        if line == 'END': # exit loop when "END" is detected
            break

        node, neighbors = line.split(':') # Separate nodes and  neighbors
        node = node.strip()  
        neighbors = neighbors.strip().split()
        graph[node] = neighbors # Add nodes to graph

    return graph # return full graph

# Main
def main():

    graph = getGraph() # Get graph 
    start = input("Start node: ") # Get the start node 
    goal = input("Goal node: ") # Get the target node 
    path = BFS(graph, start, goal) # Find path using BFS function

    if path:
        print(f"The shortest path from {start} to {goal} is: {path}") 
    else:
        print(f"Error, No path found")

# Call main
if __name__ == "__main__":
    main()

# REFERENCES
# 1. https://www.educative.io/answers/how-to-implement-a-breadth-first-search-in-python
# 2. https://www.youtube.com/watch?v=oDqjPvD54Ss
  