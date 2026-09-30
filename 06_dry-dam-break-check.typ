#import "@preview/lilaq:0.6.0" as lq

#set document(
  title: "Checking Ritter's dry dam break",
)
#set page(
  paper: "a4",
  margin: (x: 2.3cm, y: 2.1cm),
  numbering: "1",
)
#set text(size: 11pt, lang: "en", hyphenate: true)
#set par(justify: true, leading: 0.68em)
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")
#show heading: set block(above: 1.5em, below: 0.7em)

#align(center)[
  #text(size: 17pt, weight: "bold")[
    Checking Ritter's dry dam break
  ]
  #v(0.55em)
  #text(size: 11pt)[
    Substitution into the one-dimensional shallow water equations
  ]
]

#v(1.1em)

A subscript on a field is a partial derivative. The depth is $h$, the depth-averaged velocity is $u$, and $g$ is gravity. The bed is flat, so $z = 0$ and the free surface is the depth. This note takes Ritter's dry dam break from the companion note and substitutes it into the shallow water equations.

= The equations

On a flat frictionless bed the system is

$
  h_t + (h u)_x &= 0, \
  u_t + u u_x + g h_x &= 0.
$

Where $h > 0$ this is equivalent to the conservation form

$
  h_t + (h u)_x &= 0, \
  (h u)_t + (h u^2 + frac(g h^2, 2))_x &= 0.
$

The second form is the one that stays meaningful where the depth reaches zero.

= The candidate

Let $c_L = sqrt(g h_L)$ with $h_L > 0$, and write $xi = x \/ t$ for $t > 0$. Ritter's solution is

$
  h(x, t) = cases(
    h_L & "if" x < - c_L t,
    frac(1, 9 g) (2 c_L - xi)^2 & "if" - c_L t <= x <= 2 c_L t,
    0 & "if" x > 2 c_L t,
  )
$

$
  u(x, t) = cases(
    0 & "if" x < - c_L t,
    frac(2, 3) (c_L + xi) & "if" - c_L t <= x <= 2 c_L t,
    0 & "if" x > 2 c_L t.
  )
$

The three regions are checked separately. On the ray $x = - c_L t$ and on the dry front $x = 2 c_L t$ the piecewise formulas meet, so those two lines are checked afterwards.

The fields depend on $x$ and $t$ only through $xi$. Against $x \/ (c_L t)$ the depth is measured in units of $h_L$ and the velocity in units of $c_L$. Still water stands to the left of $-1$, the rarefaction occupies $-1 <= x \/ (c_L t) <= 2$, and the bed is dry to the right of the front. The velocity is drawn on the wet bed only. It is zero in the still water and equals $2 c_L$ at the front.

#let depth-ratio(z) = if z < -1 {
  1.0
} else if z <= 2 {
  calc.pow(2 - z, 2) / 9
} else {
  0.0
}
#let speed-ratio(z) = if z < -1 {
  0.0
} else {
  2 / 3 * (1 + z)
}
#let zs = (
  ..lq.linspace(-2.2, -1, num: 60),
  ..lq.linspace(-1, 2, num: 301),
  ..lq.linspace(2, 3.2, num: 60),
)
#let wet = zs.filter(z => z <= 2)
#let edge = rgb("#9a9a9a")

#[
  #show: lq.set-diagram(width: 100%)
  #figure(
    {
      show: lq.layout
      grid(
        columns: 1,
        row-gutter: 0.8em,
        lq.diagram(
          height: 5.2cm,
          ylabel: $h \/ h_L$,
          xlim: (-2.2, 3.2),
          ylim: (0, 1.15),
          xaxis: (format-ticks: none),
          lq.fill-between(zs, zs.map(depth-ratio), fill: rgb("#c5ddf0")),
          lq.plot(zs, zs.map(depth-ratio), color: rgb("#1d4e89")),
          lq.plot((-1, -1), (0, 1.15), stroke: (paint: edge, dash: "dashed")),
          lq.plot((2, 2), (0, 1.15), stroke: (paint: edge, dash: "dashed")),
        ),
        lq.diagram(
          height: 3.6cm,
          xlabel: $x \/ (c_L t)$,
          ylabel: $u \/ c_L$,
          xlim: (-2.2, 3.2),
          ylim: (0, 2.3),
          lq.plot(wet, wet.map(speed-ratio), color: rgb("#1d4e89")),
          lq.plot((-1, -1), (0, 2.3), stroke: (paint: edge, dash: "dashed")),
          lq.plot((2, 2), (0, 2.3), stroke: (paint: edge, dash: "dashed")),
        ),
      )
    },
    caption: [Ritter's solution at a fixed $t > 0$. The dashed lines are $x = - c_L t$ and the dry front $x = 2 c_L t$.],
  )
]

= Still water

For $x < - c_L t$ the fields are the constants $h = h_L$ and $u = 0$. Every derivative is zero, so both equations reduce to $0 = 0$.

= The rarefaction

Inside $- c_L t < x < 2 c_L t$, set $phi = 2 c_L - xi$. The formulas become

$
  u = frac(2, 3) (c_L + xi),
  quad
  h = frac(phi^2, 9 g),
  quad
  c = sqrt(g h) = frac(phi, 3).
$

In particular $u + 2 c = 2 c_L$ throughout the fan. Since $xi_t = - xi \/ t$ and $xi_x = 1 \/ t$,

$
  u_t = - frac(2 xi, 3 t),
  quad
  u_x = frac(2, 3 t),
  quad
  h_t = frac(2 phi xi, 9 g t),
  quad
  h_x = - frac(2 phi, 9 g t).
$

Mass is the expansion $(h u)_x = h_x u + h u_x$, so

$
  h_t + (h u)_x
    = frac(2 phi, 9 g t) (xi - u) + frac(phi^2, 9 g) frac(2, 3 t)
    = frac(2 phi, 9 g t) (xi - u + frac(phi, 3)).
$

The parenthesis is

$
  xi - frac(2, 3) (c_L + xi) + frac(2 c_L - xi, 3)
    = xi - frac(2, 3) xi - frac(1, 3) xi
    = 0.
$

Hence $h_t + (h u)_x = 0$.

Momentum is

$
  u_t + u u_x + g h_x
    = - frac(2 xi, 3 t) + frac(4, 9 t) (c_L + xi) - frac(2 phi, 9 t)
    = frac(1, 9 t) (- 6 xi + 4 c_L + 4 xi - 2 phi).
$

With $phi = 2 c_L - xi$ the numerator is $- 2 xi + 4 c_L - 2 (2 c_L - xi) = 0$. Hence $u_t + u u_x + g h_x = 0$.

= Dry bed

For $x > 2 c_L t$ one has $h = 0$. The conserved quantities are $h$ and $h u$, and both are zero, so both fluxes $h u$ and $h u^2 + g h^2 \/ 2$ are zero. Their derivatives vanish and the conservation form holds. The value assigned to $u$ on dry ground does not enter those fluxes.

= The two edges

At $x = - c_L t$, one has $xi = - c_L$, so the rarefaction formulas give $u = 0$ and $h = c_L^2 \/ g = h_L$. Depth and velocity match the still water. The derivatives do not: just inside the fan, $u_x = 2 \/ (3 t)$ and $h_x = - 2 c_L \/ (3 g t)$. The fields are continuous across this ray and the equations hold on either side, so the ray carries no jump.

At $x = 2 c_L t$, one has $xi = 2 c_L$, so $h = 0$ and $u = 2 c_L$. The discharge is $h u = 0$, which matches the dry bed. The front advances at speed $2 c_L$, the same speed as the fluid at the front. It is the wet--dry boundary of the rarefaction, and the conserved variables $(h, h u)$ stay continuous across it.

Inside each open region the shallow water equations hold, the still water joins the rarefaction continuously, and the dry front carries no jump in $h$ or $h u$. Ritter's formula is a solution.
