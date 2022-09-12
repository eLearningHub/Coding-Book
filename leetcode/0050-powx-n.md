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

(powx-n)=
# [50. Pow(x, n)](https://leetcode.com/problems/powx-n/)

Implement `pow(x, n)`, which calculates `x` raised to the power `n` (i.e., `x^n`).

Constraints:

- `-100.0 < x < 100.0`
- `-2^31 <= n <= 2^31-1`
- `-10^4 <= x^n <= 10^4`

```{code-cell} ipython3
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if n ==0:
          return 1
        if x == 0:
          return 0
        if n < 0:
            x = 1/x
            n = abs(n)
        m = n // 2
        r = n % 2
        p = self.myPow(x*x, m)
        return p if r==0 else x*p
Sol = Solution()
```

## Examples

### Example 1

```{code-cell} ipython3
x = 2.00000
n = 10
ans = 1024.00000
y = Sol.myPow(x, n)
print(y)
print("error=",y-ans)
```

### Example 2

```{code-cell} ipython3
x = 2.10000
n = 3
ans = 9.26100
y = Sol.myPow(x, n)
print(y)
print("error=",y-ans)
```

### Example 3

```{code-cell} ipython3
x = 2.0000
n = -2
ans = 0.25000
y = Sol.myPow(x, n)
print(y)
print("error=",y-ans)
```

### Example 4

```{code-cell} ipython3
x = 10.0
n = 308
ans = 1e308
y = Sol.myPowPow(x, n)
print(y)
print("error=",y-ans)
```

### Example 5

```{code-cell} ipython3
x = 10.0
n = 309
ans = 1e309
y = Sol.myPow(x, n)
print(y)
print("error=",y-ans)
```

## Notes
### Note 1

Maximum integer for 64 bit Python:

```{code-cell} ipython3
import sys
sys.maxsize
```

```{code-cell} ipython3
print(2**63-1)
```

### Note 2

Maximum float for 64 bit Python:

```{code-cell} ipython3
sys.float_info.max
```

### Note 3

Did you know that `pow(0,0)` returns `1`? 

- You get a lot of simplification by allowing 00=1 and not a lot is lost.
- Floating point arithmetic is already mathematically incorrect in many ways that are far scarier than $0^0=1$.

Ref: [Why does Python return 1 for pow(0,0) which is mathematically wrong?](https://www.quora.com/Why-does-Python-return-1-for-pow-0-0-which-is-mathematically-wrong)

## References

### NeetCode

```{code-cell} ipython3
:tags: ["hide-input"]
from IPython.display import YouTubeVideo
YouTubeVideo('g9YQyYi4IQQ')
```
