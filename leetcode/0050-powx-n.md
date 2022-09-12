---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# [50. Pow(x, n)](https://leetcode.com/problems/powx-n/)

Implement `pow(x, n)`, which calculates `x` raised to the power `n` (i.e., `x^n`).

Constraints:

- `-100.0 < x < 100.0`
- `-2^31 <= n <= 2^31-1`
- `-10^4 <= xn <= 10^4`

```{code-cell} ipython3
:tags: [pow_x_n]
class Solution:
    def myPow(self, x: float, n: int) -> float:
        def helper(x, n):
            if x == 0:
                return 0
            if n == 0:
                return 1

            res = helper(x * x, n // 2)
            return x * res if n % 2 else res

        res = helper(x, abs(n))
        return res if n >= 0 else 1 / res
```
