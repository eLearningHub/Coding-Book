---
kernelspec:
  name: python3
  display_name: python3
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.13'
    jupytext_version: 1.13.8
---

(powx-n)=
# [50. Pow(x, n)](https://leetcode.com/problems/powx-n/)

Implement `pow(x, n)`, which calculates `x` raised to the power `n` (i.e., `x^n`).

Constraints:

- `-100.0 < x < 100.0`
- `-2^31 <= n <= 2^31-1`
- `-10^4 <= xn <= 10^4`

```{code-cell} ipython3
:tags: [pow_x_n]
def Pow(self, x: float, n: int) -> float:
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

## Testing

Example 1:
```{code-cell} ipython3
:tags: [ex_1]
x = 2.00000
n = 10
ans = 1024.00000
print(Pow(x, n))
```

Example 2:
```{code-cell} ipython3
:tags: [ex_2]
x = 2.10000
n = 3
ans = 9.26100
print(Pow(x, n))
```

Example 3:
```{code-cell} ipython3
:tags: [ex_3]
x = 2.0000
n = -2
ans = 0.25000
print(Pow(x, n))
```
