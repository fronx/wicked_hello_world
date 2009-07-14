use("hello_world")
use("ispec")

describe(Urf,
  it("should have a feeld",
    Urf feeld should have kind("List")
  )

  it("should have max_x and max_y",
    Urf maxX should == 11
    Urf maxY should == 24
  )

  it("should return a feeld point",
    Urf on(1, 3) should == "."
    Urf on(1, 1) should == "o"
    Urf on(4, 1) should == "x"
  )

  it("should getz me a feeld point",
    Urf getz_me(1, 1) should == "o"
    Urf on(1, 1) should == "."
    Urf getz_me(4, 1) should == "x"
    Urf on(4, 1) should == "."
  )
)