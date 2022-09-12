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
:tags: ["hide-input"]
from IPython.display import YouTubeVideo
YouTubeVideo('g9YQyYi4IQQ')
```

```{code-cell} ipython3
def Pow(x: float, n: int) -> float:
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

### Example 1

```{code-cell} ipython3
x = 2.00000
n = 10
ans = 1024.00000
print(Pow(x, n))
print("error=",Pow(x, n)-ans)
```

### Example 2

```{code-cell} ipython3
x = 2.10000
n = 3
ans = 9.26100
print(Pow(x, n))
print("error=",Pow(x, n)-ans)
```

### Example 3

```{code-cell} ipython3
x = 2.0000
n = -2
ans = 0.25000
print(Pow(x, n))
print("error=",Pow(x, n)-ans)
```

### Example 4

```{code-cell} ipython3
x = 10.0
n = 308
ans = 1e308
print(Pow(x, n))
print("error=",Pow(x, n)-ans)
```

### Example 5

```{code-cell} ipython3
x = 10.0
n = 309
ans = 1e309
print(Pow(x, n))
print("error=",Pow(x, n)-ans)
```

Maximum integer for 64 bit Python:

```{code-cell} ipython3
import sys
sys.maxsize
```

```{code-cell} ipython3
print(2**63-1)
```

Maximum float for 64 bit Python:

```{code-cell} ipython3
sys.float_info.max
```
