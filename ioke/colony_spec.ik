use("hello_world")
use("ispec")

describe(Colony,
  describe("lotz",
    it("should run a given block 30 times on all the little antz",
      l = Colony lotz(fn(ant, ant x--))
      l should have kind("List")
      l first should have kind("Ant")
      l first x < 0 should == true
    )
    
    it("should cache lotz of antz",
      Colony lotz(fn(ant, ant x--)) should == Colony lotz
    )
  )
)