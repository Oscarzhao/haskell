# A Surpassing Problem

Definition: a `surpasser` of an element of an array is a greater element to the right, so `x[j]` is a surpasser of `x[i]` if `x < j and x[i] < x[j]`.  The suprpasser count of an element is the number of its surpassers. Here is an example:

```{math}
G E N E R A T I N G
5 6 2 5 1 4 0 1 0 0
```

The maximum surpasser count is six.  The first occurance of letter `E` has six surpassers, namely N,R,T,I,N and G.  G. Rem's problem is to computer the maximum surpasser count of an array of length n > 1 and to do so with an `O(nlogn)` algorithm.

 