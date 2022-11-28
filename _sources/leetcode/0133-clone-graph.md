---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.1
kernelspec:
  display_name: Python 3.10
  language: python
  name: python3
---

(clone-graph)=
# [133. Clone Graph](https://leetcode.com/problems/clone-graph/)

Given a reference of a node in a connected undirected graph.

Return a **deep copy** (clone) of the graph.

Each node in the graph contains a value (`int`) and a list (`List[Node]`) of its neighbors.

```python
class Node {
    public int val;
    public List<Node> neighbors;
}
```

Test case format:

For simplicity, each node's value is the same as the node's index (1-indexed). For example, the first node with `val == 1`, the second node with `val == 2`, and so on. The graph is represented in the test case using an adjacency list.

An adjacency list is a collection of unordered lists used to represent a finite graph. Each list describes the set of neighbors of a node in the graph.

The given node will always be the first node with `val = 1`. You must return the copy of the given node as a reference to the cloned graph.

## Solution

```{code-cell} ipython3
class Node:
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []

class Solution:
    def addNeighbor(self, node: 'Node', adj: 'dict'):
        new_node = adj.get(node.val,0)
        if new_node == 0:
            adj[node.val] = [_.val for _ in node.neighbors]
        for n in node.neighbors:
            new_node = adj.get(n.val,0)
            if new_node == 0:
                adj[n.val] = [_.val for _ in n.neighbors]
                self.addNeighbor(n, adj)
        return
  
    def nodeToList(self, node: 'Node'):
        adj = {}
        self.addNeighbor(node, adj)
        graph_size = len(adj.keys())
        return [adj[_+1] for _ in range(0,graph_size)]
        
    def cloneNode(self, node: 'Node', new_nodes: 'dict'):
        new_node = new_nodes.get(node.val,0)
        if new_node == 0:
            new_nodes[node.val] = Node(node.val)
        for n in node.neighbors:
            new_node = new_nodes.get(n.val,0)
            if new_node == 0:
                new_nodes[n.val] = Node(n.val)
                self.cloneNode(n, new_nodes)
        new_nodes[node.val].neighbors = [new_nodes[_.val] for _ in node.neighbors]
        return 
                
    def cloneGraph(self, node: 'Node') -> 'Node':
        if node == None:
            return None
        if node.val == 0:
            return Node()
        if node.neighbors == None:
            return Node(node.val)


        new_nodes = {}
        new_nodes[node.val] = Node(node.val)
        for n in node.neighbors:
            self.cloneNode(n, new_nodes)
        new_nodes[node.val].neighbors = [new_nodes[_.val] for _ in node.neighbors]
        return new_nodes[node.val]
```

## Examples

```{code-cell} ipython3
Sol = Solution()
```

### Example 1

```{code-cell} ipython3
# Input
adjList = [[2,4],[1,3],[2,4],[1,3]]
# Output [[2,4],[1,3],[2,4],[1,3]]

n1 = Node(1)
n2 = Node(2)
n3 = Node(3)
n4 = Node(4,[n1,n3])
n3.neighbors = [n2,n4]
n2.neighbors = [n1,n3]
n1.neighbors = [n2,n4]
print(Sol.nodeToList(n1))
```
