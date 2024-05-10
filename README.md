# Fisher test


Fisher exact test for $2\times2$ tables.


## Usage

This programme has pixi as a dependency, download it if you do not yet have it

```bash
curl -fsSL https://pixi.sh/install.sh | bash
```

Build and use the programme as follows:

```bash
pixi run fisher <a> <b> <c> <d>
```

Example:

```bash
pixi run fisher 1 9 13 9
```


## Algorithm

A Fisher test implemented in common lisp. No approximations are carried out for
the calculation; so it can be quite slow. 

The fisher exact test can be used to assess an association between binary values in a $2\times2$ cross table. The Null Hypothesis is that there is no association.


| row/col | TRUE     | FALSE    |
| ------- | -------- | -------- |
| TRUE    | $C_{11}$ | $C_{12}$ |
| FALSE   | $C_{21}$ | $C_{22}$ |

where $n = \sum C_{\cdot\cdot}$ and the probability of observing the counts $C$ is 

$$P(\text{Outcome}) = \frac{(C_{11} + C_{12} )! (C_{21} + C_{22})! (C_{11} + C_{21})! (C_{12} + C_{22})! }{(C_{11}! C_{12}! C_{21}! C_{22}! n!)}.$$​

The test is an exact test, meaning that all $P$s for tables tables with the same margins are  summed up.

Sources: [groningen](https://www.let.rug.nl/~nerbonne/teach/rema-stats-meth-seminar/presentations/fishers-exact-trofimova-ruffle-21-03-2005.pdf), [online stat](https://online.stat.psu.edu/stat504/lesson/4/4.5).

The $P$ represents the chance of seeing the contents of the table, knowing only the margin totals and $n$.

Basic requirements:

* $\geq 20\%$ of the cells have a expected count of 5 and no cell has a count less than 1.


