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

(path-sum-iii)=
# [437. Path Sum III](https://leetcode.com/problems/path-sum-iii/)

Given the root of a binary tree and an integer `targetSum`, return the number of paths where the sum of the values along the path equals `targetSum`.

The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

Constraints:

- The number of nodes in the tree is in the range [0, 1000].
- -109 <= `Node.val` <= 109
- -1000 <= `targetSum` <= 1000

## Solution

```{code-cell} ipython3
from typing import Optional
import math

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution1:
        
    def treeToList(self, node: Optional[TreeNode], tree: list = [], index: int = 0):
        if node == None:
            return tree
        if node.left == None and node.right == None:
            return tree
        if index == 0:
           tree = [node.val]
        if node.left != None:
            i_left = 2*index+1
            l_tree = len(tree)
            if l_tree > i_left:
                tree[i_left] = node.left.val
            else:
                tree = tree + [None]*(i_left-l_tree) + [node.left.val]
            tree = self.treeToList(node.left, tree, i_left)
            
        if node.right != None:
            i_right = 2*index+2
            l_tree = len(tree)
            if l_tree > i_right:
                tree[i_right] = node.right.val
            else:
                tree = tree + [None]*(i_right-l_tree) + [node.right.val]
            tree = self.treeToList(node.right, tree, i_right)
        return tree

    def listToTree(self, tree: list, node: Optional[TreeNode]):
      nodes = [TreeNode(_) for _ in tree]
      nodes[0] = node
      tree_len = len(tree)
      nodes[0].val = tree[0]
      for i in range(tree_len):
        child = 2*i+1
        if child < tree_len:
          nodes[i].left = nodes[child]

        child = 2*i+2
        if child < tree_len:
          nodes[i].right = nodes[child]
        
    def pathOptions(self, length: int) -> list:
        paths = [[0]]
        for i in range(length-1):
            new_paths = []
            for p in paths:
                new_paths += [p+[1]] + [p+[2]] 
            paths = new_paths
        return paths
        
    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> int:
        
        tree = [root.val]
        tree = self.treeToList(root, tree)
        num_rows = math.ceil(math.log(len(tree)+1, 2))
        
        noPathsTargetSum = 0
        for length in range(1,num_rows+1):
            paths = self.pathOptions(length)
            for i in range(2**(num_rows-length)-1):
                if tree[i] == None:
                    break
                for p in paths:
                    sum_nodes = tree[i]
                    j = i
                    for k in p:
                        if tree[2+j + k] == None:
                            break
                        
                        sum_nodes += tree[2+j + k]
                        j = 2+j + k
                        if sum_nodes == targetSum:
                            noPathsTargetSum = noPathsTargetSum + 1
        return noPathsTargetSum
```

## Examples

```{code-cell} ipython3
:tags: ["hide-input"]
%load_ext line_profiler
%load_ext memory_profiler
import cProfile
Sol1 = Solution1()
```

### Example 1

Input:

```{code-cell} ipython3
root = [10,5,-3,3,2,None,11,3,-2,None,1]
targetSum = 8
Output = 3
Tree = TreeNode()
Sol1.listToTree(root, Tree)
Sol1.pathSum(Tree, targetSum)
```

### Example 2

Input:

```{code-cell} ipython3
root = [5,4,8,11,null,13,4,7,2,null,null,5,1]
targetSum = 22
Output = 3
Tree = TreeNode()
Sol1.listToTree(root, Tree)
Sol1.pathSum(Tree, targetSum)
```
