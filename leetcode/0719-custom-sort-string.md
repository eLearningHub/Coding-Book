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

(string-719)=
# [719. Custom Sort String](https://leetcode.com/problems/custom-sort-string/)

You are given two strings order and s. All the characters of order are unique and were sorted in some custom order previously.

Permute the characters of s so that they match the order that order was sorted. More specifically, if a character x occurs before a character y in order, then x should occur before y in the permuted string.

Return any permutation of s that satisfies this property.

## Constraints

- 1 <= order.length <= 26
- 1 <= s.length <= 200
- order and s consist of lowercase English letters.
- All the characters of order are unique.

## Solution

```{code-cell} ipython3
class Solution:
    def customSortString(self, order: str, s: str) -> str:
      ordered_str = ''
      for ch in order:
        if ch in s:
          ordered_str = ordered_str+ch*s.count(ch)
          s=s.replace(ch, '')
      
      ordered_str = ordered_str+s
      return ordered_str
Sol = Solution()
```

## Examples

### Example 1

Input: order = "cba", s = "abcd"
Output: "cbad"
Explanation:
"a", "b", "c" appear in order, so the order of "a", "b", "c" should be "c", "b", and "a". 
Since "d" does not appear in order, it can be at any position in the returned string. "dcba", "cdba", "cbda" are also valid outputs.

```{code-cell} ipython3
order = "cba"
s = "abcd"
Sol.customSortString(order, s)
```

### Example 2

Input: order = "cbafg", s = "abcd"
Output: "cbad"

```{code-cell} ipython3
order = "cbafg"
s = "abcd"
Sol.customSortString(order, s)
```

### Example 3

Input: order = "kqep", s = "pekeq"
Output: "kqeep"

```{code-cell} ipython3
order = "kqep"
s = "pekeq"
Sol.customSortString(order, s)
```

## References

```{code-cell} ipython3
:tags: ["hide-input"]
from IPython.display import YouTubeVideo
YouTubeVideo('edluuHln06g')
```
