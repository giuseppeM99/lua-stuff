# BigNum / BigRat library
### Original source: http://oss.digirati.com.br/luabignum/

__Usage__
```
--load the BigNum library
local bignum = require 'bignum'
--load the BigRat library
local bigrat = require 'bigrat'
--create a new bignum
bn = bignum(42)
--old method
bn1 = bignum.new(55)
--create a new bigrat
br = bigrat(42, 5)
--old method
br1 = bigrat(1412, 55)
print(bn + bn1) --same sintax as normal Numbers
```
For more documentation see the offical documentation for [BigNum](http://oss.digirati.com.br/luabignum/bn/index.htm) and [BigRat](http://oss.digirati.com.br/luabignum/br/index.htm)
