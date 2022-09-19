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

(valid-word)=
# [408. Valid Word Abbreviation](https://leetcode.com/problems/valid-word-abbreviation/)

Given a non-empty string `s` and an abbreviation `abbr`, return whether the string matches with the given abbreviation.

A string such as "word" contains only the following valid abbreviations:

```python
["word", "1ord", "w1rd", "wo1d", "wor1", "2rd", "w2d", "wo2", "1o1d", "1or1", "w1r1", "1o2", "2r1", "3d", "w3", "4"]
```

Notice that only the above abbreviations are valid abbreviations of the string "word". Any other string is not a valid abbreviation of "word".

Note:
Assume `s` contains only lowercase letters and `abbr` contains only lowercase letters and digits.

## Solutions

```{code-cell} ipython3
class Solution1:
    def validWordAbbreviation(self, word: str, abbr: str) -> bool:
        is_abbr = True
        abbr_len = len(abbr)
        i = 0
        i_s = 0
        while i < abbr_len:
            if abbr[i].isnumeric():
              j = i
              while j < abbr_len:
                if abbr[j].isnumeric():
                  j += 1
                else:
                  break
              i_s += int(abbr[i:j])
              i = j
            else:
              if s[i_s] != abbr[i]:
                print(f'i_s: {i_s}')
                print(f'i: {i}')
                print(f's[i_s]: {s[i_s]}')
                print(f'abbr[i]: {abbr[i]}')
                is_abbr = False
                break
              i += 1
              i_s += 1
        return is_abbr
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
s = "internationalization"
abbr = "i12iz4n"
ans = True
print(Sol1.validWordAbbreviation(s, abbr))
```

### Example 2

```{code-cell} ipython3
s = "apple"
abbr = "a2e"
ans = False
print(Sol1.validWordAbbreviation(s, abbr))
```
