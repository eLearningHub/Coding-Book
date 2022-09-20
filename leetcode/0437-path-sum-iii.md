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

## Examples

### Example 1

Input:

```{code-cell} ipython3
root = [10,5,-3,3,2,null,11,3,-2,null,1]
targetSum = 8
Output = 3
```

Explanation: The paths that sum to 8 are shown.
