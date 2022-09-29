discard """
  cmd: "nim check $options --hints:off $file"
  errormsg: ""
  nimout: '''
t2614.nim(19, 27) Error: type mismatch: got <array[0..1, proc (){.locks: <unknown>.}]> but expected 'array[0..1, proc (){.closure.}]'
  Calling convention mismatch: got '{.nimcall.}', but expected '{.closure.}'.
t2614.nim(21, 22) Error: type mismatch: got <seq[proc (){.locks: <unknown>.}]> but expected 'seq[proc (){.closure.}]'
  Calling convention mismatch: got '{.nimcall.}', but expected '{.closure.}'.
'''
"""

proc g
proc f =
  if false: g()
proc g =
  if false: f()

var a = [f, g] # This works
var b: array[2, proc()] = [f, g] # Error

var c: seq[proc()] = @[f, g] 