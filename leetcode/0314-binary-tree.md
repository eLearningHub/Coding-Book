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

(tree-314)=
# [314. Binary Tree Vertical Order Traversal](https://leetcode.com/problems/binary-tree-vertical-order-traversal/)

Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).

If two nodes are in the same row and column, the order should be from left to right.

## Solution

```{code-cell} ipython3
class Solution:
  def tree2columns(t: list):
    M={}
    M.update({t[0]:[0,0]})
    i_max=len(t)//2
    j_min = 0
    j_max = 0
    for i in range(0,i_max):
      if t[2*i+1] != None:
        j = M[t[i]][1]-1
        M.update({t[2*i+1]:[M[t[i]][0]+1,j]})
        j_min = min(j_min, j)
      if t[2*i+2] != None:
        j = M[t[i]][1]+1
        M.update({t[2*i+2]:[M[t[i]][0]+1,j]})
        j_max = max(j_max, j)
    columns = [[] for _ in range(0,j_max-j_min+1)]
    for n in t:
      if n != None:
        columns[M[n][1]-j_min].append(n)
    return columns
Sol = Solution()
```

## Examples

### Examples 1

Input: `[3,9,20,null,null,15,7]`

```{mermaid}
graph TB;
    A((3))-->B((9))
    A-->C((20));
    C-->D((15))
    C-->E((7))
```

Output:

```python
[
  [9],
  [3,15],
  [20],
  [7]
]
```

```{code-cell} ipython3
t = [3,9,20,None,None,15,7]
ans = [[9], [3,15], [20], [7]]
y = Sol.tree2columns(t)
```

### Example 2

Input: `[3,9,8,4,0,1,7]`

```{mermaid}
graph TB;
    A((3))-->B((9))
    A-->C((8));
    B-->D((4))
    B-->E((0))
    C-->F((1))
    C-->G((7))
```

Output:

```python
[
  [4],
  [9],
  [3,0,1],
  [8],
  [7]
]
```

```{code-cell} ipython3
t = [3,9,8,4,0,1,7]
ans = [[4], [9], [3,0,1], [8], [7]]
y = Sol.tree2columns(t)
```

### Example 3

Input: `[3,9,8,4,0,1,7,null,null,null,2,5]` (0's right child is 2 and 1's left child is 5)

```{code-cell} ipython3
from binarytree import build
tree = [3,9,8,4,0,1,7,None,None,None,2,5]
t = build(tree)
graph = t.graphviz()
graph
```

Output:

```python
[
  [4],
  [9,5],
  [3,0,1],
  [8,2],
  [7]
]
```

```{code-cell} ipython3
t = [3,9,8,4,0,1,7,None,None,None,2,5]
ans = [[4], [9,5], [3,0,1], [8,2], [7]]
y = Sol.tree2columns(t)
```
