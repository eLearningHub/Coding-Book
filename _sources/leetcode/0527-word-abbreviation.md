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

(word-abbr)=
# [527. Word Abbreviation](https://leetcode.com/problems/word-abbreviation/)

Given an array of n distinct non-empty strings, you need to generate minimal possible abbreviations for every word following rules below.

    Begin with the first character and then the number of characters abbreviated, which followed by the last character.
    If there are any conflict, that is more than one words share the same abbreviation, a longer prefix is used instead of only the first character until making the map from word to abbreviation become unique. In other words, a final abbreviation cannot map to more than one original words.
    If the abbreviation doesn't make the word shorter, then keep it as original.

Example:

Input: ["like", "god", "internal", "me", "internet", "interval", "intension", "face", "intrusion"]
Output: ["l2e","god","internal","me","i6t","interval","inte4n","f2e","intr4n"]

Note:

- Both n and the length of each word will not exceed 400.
- The length of each word is greater than 1.
- The words consist of lowercase English letters only.
- The return answers should be in the same order as the original array.

## Solutions

```{code-cell} ipython3
from typing import List
class Solution1:
    def shorten(self, word: str, i: int) -> str:
      n = len(word)
      if n-i > 3:
        return word[0:i]+str(n-i-1)+word[-1]
      else:
        return word
    def wordsAbbreviation(self, dict: List[str]) -> List[str]:
      abbrs = {}
      for w in dict:
        lw = len(w)
        if lw>3:
          w_abbr = w[0]+str(lw-2)+w[-1]
          abbrs[w_abbr] = abbrs.get(w_abbr,[])
          abbrs[w_abbr].append(w)
        else:
          abbrs[w] = [w]

      abbr_i = {}
      for key in abbrs.keys():
        if len(abbrs[key]) > 1:
          for i in range(len(abbrs[key][0])):
            abbrs_new = {self.shorten(_, i) for _ in abbrs[key]}
            if len(abbrs_new) == len(abbrs[key]):
              abbr_i[key]=i
              break

      for key in abbr_i.keys():
        for w in abbrs[key]:
          w_abbr = self.shorten(w,abbr_i[key])
          abbrs[w_abbr] = [w]
        abbrs.pop(key)

      abbr =  {v[0]: k for k, v in abbrs.items()}
      return [abbr[_] for _ in dict]
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

```{code-cell} ipython3
Input = ["like", "god", "internal", "me", "internet", "interval", "intension","face","intrusion"]

Output= ["l2e","god","internal","me","i6t","interval","inte4n","f2e","intr4n"]

print(Sol1.wordsAbbreviation(Input))
```
