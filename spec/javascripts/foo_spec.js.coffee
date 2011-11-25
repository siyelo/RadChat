#= require foo

describe "Foo", ->
  it "it is not bar", ->
    v = new Foo()
    expect(v.bar()).toEqual(false)
