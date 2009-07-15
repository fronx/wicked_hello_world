Number Integer do (
  norm = method(xy,
    xy = xy asText upper
    (self + 3 * Urf cell("max#{xy}")) % Urf cell("max#{xy}")
  )
)

Text do (
  replaceAt = method(i, s,
    if(i > 0, self[0..i-1], "") + s + self[i+1..-1]
  )
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

  on = method(x, y,
    y = y norm(:y). x = x norm(:x)
    feeld[y][(x)..(x)]
  )

  getz_me = method(x, y,
    b4 = on(x, y)
    y = y norm(:y). x = x norm(:x)
    feeld[y] = feeld[y] replaceAt(x, ".")
    feeld inspect println
    b4
  )

)

Ant = Origin mimic
Ant do (
  initialize = method(
    self x = System randomNumber % 11
    self y = System randomNumber % 24
    self belly = []
  )

  queen = mimic do(
    puke = method(
      self belly map(shugary, (100 + shugary) rescue ' ' ) join
    )

    getz_shugarz = method(
      self belly = []
      Ant lotz map(ant, ant belly) compact each(belly,
        belly each(xything,
          self belly[xything[0] norm(:x)] = xything[1] norm(:y) if xything[2] == 'o'
        )
      )
    )
  )

  lotz = method(block nil,
    __lotz ||= (1..99) map(i, mimic) map(ant,
      if(block, 30 times(i, block call(ant)))
      ant
    )
  )

  wawkz = method(
    self x += (System randomNumber % 3) - 1
    self y += (System randomNumber % 3) - 1
  )

  hazFowndShugarz? = method(
    Urf on(self x, self y) != "."
  )

  nomNom = method(
    self belly << [x, y, Urf getz_me(x, y)]
  )
)

System ifMain(
  Ant lotz(fn(ant,
    if(ant wawkz. ant hazFowndShugarz?,
      ant nomNom)
  )) map(ant, ant belly) select(b, !(b empty?)) println

  Ant queen getz_shugarz
  Ant queen puke println
)
