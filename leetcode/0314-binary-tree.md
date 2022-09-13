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

```{python}
[
  [9],
  [3,15],
  [20],
  [7]
]
```
