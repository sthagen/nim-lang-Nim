discard """
  targets: "c js"
"""

{.experimental: "views".}

block:
  type
    Foo = object
      id: openArray[char]

  proc foo(): Foo =
    var source = "1245"
    result = Foo(id: source.toOpenArray(0, 1))

  doAssert foo().id == @['1', '2']

block: # bug #15778
  type
    Reader = object
      data: openArray[char]
      current: int

  var count = 0

  proc read(data: var Reader, length: int): openArray[char] =
    inc count
    let start = data.current
    data.current.inc length
    return data.data.toOpenArray(start, data.current-1)

  var data = "hello there"
  var reader = Reader(data: data.toOpenArray(0, data.len-1), current: 0)
  doAssert @(reader.read(2)) == @['h', 'e']
  doAssert @(reader.read(3)) == @['l', 'l', 'o']
  doAssert count == 2

block: # bug #16671
  block:
    type X = ref object of RootObj
    type Y = ref object of X
      field: openArray[int]

    var s: seq[X]
    proc f() =
      s.add(Y(field: [1]))

    f()

  block:
    type X = ref object of RootObj
    type Y = ref object of X
      field: openArray[int]

    var s: seq[X]
    proc f() =
      s.add(Y(field: toOpenArray([1, 2, 3], 0, 1)))

    f()
