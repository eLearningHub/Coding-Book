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

(add-two)=
# [2. Add Two Numbers](https://leetcode.com/problems/add-two-numbers/)

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

## Solution

```{code-cell} ipython3
from typing import Optional
# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution:
  def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode], carry: int = 0) -> Optional[ListNode]:
    
    if l1 == None:
      l1 = ListNode()
    
    if l2 == None:
      l2 = ListNode()

    x = l1.val + l2.val + carry
    if x < 10:
      carry = 0
    else:
      x = x-10
      carry = 1
        
    if l1.next == None and l2.next == None and carry == 0:
      return ListNode(x, None)
    
    if l1.next == None and l2.next == None and carry == 1:
      return ListNode(x, ListNode(1, None))
    
    return ListNode(x, self.addTwoNumbers(l1.next, l2.next, carry))
  def listToListNode(self, l:list) -> ListNode:
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

## Examples

### Example 1

```{code-cell} ipython3
l1 = Sol.listToListNode([2,4,3])
l2 = Sol.listToListNode([5,6,4])
l = Sol.addTwoNumbers(l1, l2)
print(Sol.ListNodeToList(l))
```
