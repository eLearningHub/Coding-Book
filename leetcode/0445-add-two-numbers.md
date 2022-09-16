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

(add-two-ii)=
# [445. Add Two Numbers II](https://leetcode.com/problems/add-two-numbers-ii/)

You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

## Solution

```{code-cell} ipython3
from typing import Optional
# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
  def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
    lst1 = self.ListNodeToList(l1)
    lst2 = self.ListNodeToList(l2)
    
    ln1 = len(lst1)
    ln2 = len(lst2)
    
    if ln1 > ln2:
      lst2 = [0 for _ in range(ln1-ln2)]+lst2
      ln = ln1
    else:
      lst1 = [0 for _ in range(ln2-ln1)]+lst1
      ln = ln2
    
    carry = 0
    lst = []
    for i in range(ln):
      x = lst1[-1-i]+lst2[-1-i]+carry
      if x >= 10:
        x = x-10
        carry = 1
      else:
        carry = 0
      lst.insert(0,x)
    
    if carry:
      lst.insert(0,1)
    return self.ListToListNode(lst)

  def ListToListNode(self, l:list) -> ListNode:
    n = len(l)
    listN = ListNode(l[-1])
    for i in range(n-1):
      listN = ListNode(l[-2-i],listN)
    return listN

  def ListNodeToList(self, ln: Optional[ListNode], l: list = []) -> list:
    m = l + [ln.val]
    if ln.next == None:
      return m
    else:
      return self.ListNodeToList(ln.next, m)

Sol = Solution()
```

Runtime: 171 ms, faster than 6.57% of Python3 online submissions for Add Two Numbers II.
Memory Usage: 13.9 MB, less than 45.47% of Python3 online submissions for Add Two Numbers II.

## Examples

### Example 1

```{code-cell} ipython3
l1 = Sol.listToListNode([7,2,4,3])
l2 = Sol.listToListNode([5,6,4])
l = Sol.addTwoNumbers(l1, l2)
print(Sol.ListNodeToList(l))
```

## Example 2

```{code-cell} ipython3
l1 = Sol.listToListNode([2,4,3])
l2 = Sol.listToListNode([5,6,4])
l = Sol.addTwoNumbers(l1, l2)
print(Sol.ListNodeToList(l))
```

## Example 3

```{code-cell} ipython3
l1 = Sol.listToListNode([0])
l2 = Sol.listToListNode([0])
l = Sol.addTwoNumbers(l1, l2)
print(Sol.ListNodeToList(l))
```
