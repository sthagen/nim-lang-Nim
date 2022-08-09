#[
autogenerated by docgen
loc: /home/runner/work/nim-lang-Nim/nim-lang-Nim/lib/std/jsbigints.nim(207, 1)
rdoccmd: 
]#
import "/home/runner/work/nim-lang-Nim/nim-lang-Nim/lib/std/jsbigints.nim"
{.line: ("/home/runner/work/nim-lang-Nim/nim-lang-Nim/lib/std/jsbigints.nim", 207, 1).}:
  block:
    let big1: JsBigInt = big"2147483647"
    let big2: JsBigInt = big"666"
    doAssert JsBigInt isnot int
    doAssert big1 != big2
    doAssert big1 > big2
    doAssert big1 >= big2
    doAssert big2 < big1
    doAssert big2 <= big1
    doAssert not(big1 == big2)
    let z = JsBigInt.default
    doAssert $z == "0n"
  block:
    var a: seq[JsBigInt]
    a.setLen 2
    doAssert a == @[big"0", big"0"]
    doAssert a[^1] == big"0"
    var b: JsBigInt
    doAssert b == big"0"
    doAssert b == JsBigInt.default

