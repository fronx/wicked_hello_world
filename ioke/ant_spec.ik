use("hello_world")
use("ispec")

describe(Ant,
  it("should be possible to mimic",
    a = Ant mimic
    a should have kind("Ant")
    a should mimic(Ant)
  )

  describe("creating",
    it("should initialize x and y with random numbers",
      different = false
      a = Ant mimic
      10 times(
        different ||= a x != Ant mimic x
      )
      different should == true
    )
  )

  it("should have an empty belly",
    Ant mimic belly should == []
  )

  describe("lotz",
    it("should return lotz of antz",
      Ant lotz should have kind("List")
      Ant lotz first should have kind("Ant")
    )

    it("should run a given block 30 times",
      Ant lotz(fn(ant, ant x--)) should have kind("List")
      Ant lotz first should have kind("Ant")
      Ant lotz first x < 0 should == true
    )
  )
)