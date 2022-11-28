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

(heaps)=
# Heaps

## Examples

```{code-cell} ipython3
import heapq
results="""\
Christania Williams      11.80
Marie-Josee Ta Lou       10.86
Elaine Thompson          10.71
Tori Bowie               10.83
Shelly-Ann Fraser-Pryce  10.86
English Gardner          10.94
Michelle-Lee Ahye        10.92
Dafne Schippers          10.90
"""
top_3 = heapq.nsmallest(
    3, results.splitlines(), key=lambda x: float(x.split()[-1])
)
print("\n".join(top_3))
```

## References

- [The Python heapq Module: Using Heaps and Priority Queues](https://realpython.com/python-heapq-module)
