Number Integer do (
  norm = method(xy,
    xy = xy asText upper
    (self + 3 * Urf cell("max#{xy}")) % Urf cell("max#{xy}"))
)

Text do (
  replaceAt = method(i, s,
    if(i > 0, self[0..i-1], "") + s + self[i+1..-1])
)

Urf = Origin mimic do (
  feeld = #[\
. . . . . . . . . x o
. o . . x . . . . . .
. . . . . x . . . . .
. . . . . . x . . . .
o . . . . . . . . . .
. . . . . . . . . . .
. . . . . . . . . . .
. . . . . . . . . . .
. . o o . . . . . o .
. . . . . x . . . . .
. . . . . . . . . . x
. . . . o . . o . . .
. . . . . . . . . . .
. . . . . . x . . . .
. . . . . . . . o . .
. . . x . . . . . . x
. . . . . . . . . . .
. . . . . . . . . . .
. . x . . . . . . . .
. . . . . . o . x . .
. . . . . . . . . . .
. . . . x . . . . . .
. . . . . x . . . . .
. . . . . . . . . x .\
] replaceAll(" ","") split("\n")

  maxX = feeld first length
  maxY = feeld length

  some = method(xy,
    System randomNumber % if(xy == :x, maxX, maxY))

  on = method(x, y, getz: false,
    y = y norm(:y). x = x norm(:x)
    b4 = feeld[y][(x)..(x)]
    if(getz, feeld[y] = feeld[y] replaceAt(x, "."))
    b4)

  getz_me = method(x, y,
    on(x, y, getz: true))

)

Ant = Origin mimic
Ant do (
  initialize = method(
    self x = Urf some(:x)
    self y = Urf some(:y)
    self belly = [])

  wawkz = method(
    self x += (System randomNumber % 3) - 1
    self y += (System randomNumber % 3) - 1
    true)

  hazFowndShugarz? = method(
    Urf on(x, y) != ".")

  nomNom = method(belly << [x, y, Urf getz_me(x, y)])
)

Colony = Origin mimic do (
  lotz = method(block,
    self lotz = (1..99) map(i, Ant mimic) map(ant,
      30 times(i, block call(ant))
      ant))
)

queen = Ant mimic do(
  puke = method(
    belly map(shugary, (100 + (shugary || -68)) char) join)

  getz_shugarz = method(
    Colony lotz map(ant, ant belly) compact each(belly,
      belly each(xything,
        if(xything[2] == "o", self belly[xything[0] norm(:x)] = xything[1] norm(:y)))
    )
    self)
)

System ifMain(
  Colony lotz(fn(ant,
    if(ant wawkz && ant hazFowndShugarz?,
      ant nomNom)
  ))

  Ant queen getz_shugarz puke println
)
