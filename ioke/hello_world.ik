Number Integer do (
  norm = method(xy,
    xy = xy asText upper
    (self + 3 * Urf cell("max#{xy}")) % Urf cell("max#{xy}")
  )
)

Text do (
  replaceAt = method(i, s,
    self[0..i-1] + s + self[i+1..-1]
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
    feeld[y norm(:y)][(x norm(:x))..(x norm(:x))]
  )

  getz_me = method(x, y,
    b4 = on(x, y)
    y = y norm(:y). x = x norm(:x)
    feeld[y] = feeld[y] replaceAt(x, ".")
    b4
  )

)

Ant = Origin mimic
Ant initialize = method(
  self x = System randomNumber % 11
  self y = System randomNumber % 24
  self belly = []
)

; System ifMain(
;   Ant.queen.getz_shugarz
;   Ant.queen.puke
; )
