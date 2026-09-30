#import "@preview/lilaq:0.6.0" as lq

#set document(
  title: "Checking Stoker's wet dam break",
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
    Checking Stoker's wet dam break
  ]
  #v(0.55em)
  #text(size: 11pt)[
    Substitution into the one-dimensional shallow water equations
  ]
]

#v(1.1em)

A subscript on a field is a partial derivative. The depth is $h$, the depth-averaged velocity is $u$, and $g$ is gravity. The bed is flat, so $z = 0$. This note takes Stoker's wet dam break from the companion note and substitutes it into the shallow water equations.

= The equations

On a flat frictionless bed,

$
  h_t + (h u)_x &= 0, \
  u_t + u u_x + g h_x &= 0.
$

Where $h > 0$ this is the same as the conservation form

$
  h_t + (h u)_x &= 0, \
  (h u)_t + (h u^2 + frac(g h^2, 2))_x &= 0.
$

A jump that moves at speed $s$ satisfies the conservation form in the weak sense when the Rankine--Hugoniot relations hold. With states $(h_-, u_-)$ on the left of the jump and $(h_+, u_+)$ on the right,

$
  s (h_- - h_+) &= h_- u_- - h_+ u_+, \
  s (h_- u_- - h_+ u_+)
    &= h_- u_-^2 - h_+ u_+^2 + frac(g, 2) (h_-^2 - h_+^2).
$

= The candidate

Let $0 < h_R < h_L$, $c_L = sqrt(g h_L)$, and $c_R = sqrt(g h_R)$. The dam is at $x = 0$: at $t = 0$ the velocity is zero, the depth is $h_L$ for $x < 0$, and the depth is $h_R$ for $x > 0$.

The middle depth $h_m$ is the unique number in $(h_R, h_L)$ for which the two expressions

$
  u_m
    = 2 (c_L - c_m)
    = (h_m - h_R) sqrt(frac(g (h_m + h_R), 2 h_m h_R))
$

agree, where $c_m = sqrt(g h_m)$. Such an $h_m$ exists because, as $h$ runs from $h_R$ to $h_L$, the rarefaction value $2 (c_L - sqrt(g h))$ falls continuously from $2 (c_L - c_R) > 0$ to $0$, while the shock value $(h - h_R) sqrt(g (h + h_R) \/ (2 h h_R))$ rises continuously from $0$. The two graphs cross once.

For $t > 0$ write $xi = x \/ t$ and

$
  s = frac(h_m u_m, h_m - h_R).
$

The solution has four pieces:

$
  (h, u) = cases(
    (h_L, 0) & "if" xi < - c_L,
    (frac(1, 9 g) (2 c_L - xi)^2, frac(2, 3) (c_L + xi))
      & "if" - c_L <= xi <= u_m - c_m,
    (h_m, u_m) & "if" u_m - c_m <= xi < s,
    (h_R, 0) & "if" xi > s.
  )
$

The right edge of the fan is $u_m - c_m = 2 c_L - 3 c_m$, which is where Ritter's parabola reaches $c = c_m$.

The fields depend on $x$ and $t$ only through $xi$. The figure takes $h_R = h_L \/ 4$ and draws the depth in units of $h_L$ and the velocity in units of $c_L$, against $x \/ (c_L t)$. Still water of depth $h_L$ stands to the left of $-1$. The rarefaction runs from there to $xi = u_m - c_m$, the middle state fills the strip up to the shock $xi = s$, and undisturbed water of depth $h_R$ lies beyond the shock.

#let ratio = 1 / 4
#let mismatch(alpha) = {
  let left = 2 * (1 - calc.sqrt(alpha))
  let right = (alpha - ratio) * calc.sqrt((alpha + ratio) / (2 * alpha * ratio))
  left - right
}
#let bounds = range(60).fold((ratio, 1.0), ((lo, hi), _) => {
  let mid = (lo + hi) / 2
  if mismatch(mid) > 0 { (mid, hi) } else { (lo, mid) }
})
#let alpha = (bounds.at(0) + bounds.at(1)) / 2
#let speed = 2 * (1 - calc.sqrt(alpha))
#let fan-right = 2 - 3 * calc.sqrt(alpha)
#let shock = calc.sqrt(alpha * (alpha + ratio) / (2 * ratio))
#let left-x = lq.linspace(-1.8, -1, num: 40)
#let fan-x = lq.linspace(-1, fan-right, num: 201)
#let mid-x = lq.linspace(fan-right, shock, num: 40)
#let right-x = lq.linspace(shock, 1.8, num: 80)
#let xs = (..left-x, ..fan-x, ..mid-x, shock, ..right-x)
#let hs = (
  ..left-x.map(_ => 1.0),
  ..fan-x.map(z => calc.pow(2 - z, 2) / 9),
  ..mid-x.map(_ => alpha),
  ratio,
  ..right-x.map(_ => ratio),
)
#let us = (
  ..left-x.map(_ => 0.0),
  ..fan-x.map(z => 2 / 3 * (1 + z)),
  ..mid-x.map(_ => speed),
  0.0,
  ..right-x.map(_ => 0.0),
)
#let edge = rgb("#9a9a9a")
#let h-top = 1.15
#let u-top = 0.8

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
          xlim: (-1.8, 1.8),
          ylim: (0, h-top),
          xaxis: (format-ticks: none),
          lq.fill-between(xs, hs, fill: rgb("#c5ddf0")),
          lq.plot(xs, hs, color: rgb("#1d4e89")),
          lq.plot((-1, -1), (0, h-top), stroke: (paint: edge, dash: "dashed")),
          lq.plot((fan-right, fan-right), (0, h-top), stroke: (paint: edge, dash: "dashed")),
          lq.plot((shock, shock), (0, h-top), stroke: (paint: edge, dash: "dashed")),
        ),
        lq.diagram(
          height: 3.6cm,
          xlabel: $x \/ (c_L t)$,
          ylabel: $u \/ c_L$,
          xlim: (-1.8, 1.8),
          ylim: (0, u-top),
          lq.plot(xs, us, color: rgb("#1d4e89")),
          lq.plot((-1, -1), (0, u-top), stroke: (paint: edge, dash: "dashed")),
          lq.plot((fan-right, fan-right), (0, u-top), stroke: (paint: edge, dash: "dashed")),
          lq.plot((shock, shock), (0, u-top), stroke: (paint: edge, dash: "dashed")),
        ),
      )
    },
    caption: [Stoker's solution for $h_R = h_L \/ 4$ at a fixed $t > 0$. The dashed lines are $x = - c_L t$, the downstream edge of the rarefaction, and the shock $x = s t$.],
  )
]

= Still water

For $xi < - c_L$ the fields are the constants $(h_L, 0)$. For $xi > s$ they are the constants $(h_R, 0)$. In both regions every derivative vanishes, so both equations reduce to $0 = 0$.

= The rarefaction

On $- c_L < xi < u_m - c_m$ the formulas are the same functions of $xi$ as in Ritter's dry dam break. Set $phi = 2 c_L - xi$. Then

$
  u = frac(2, 3) (c_L + xi),
  quad
  h = frac(phi^2, 9 g),
  quad
  c = frac(phi, 3),
$

and $u + 2 c = 2 c_L$. The derivatives are

$
  u_t = - frac(2 xi, 3 t),
  quad
  u_x = frac(2, 3 t),
  quad
  h_t = frac(2 phi xi, 9 g t),
  quad
  h_x = - frac(2 phi, 9 g t).
$

Mass becomes

$
  h_t + (h u)_x
    = frac(2 phi, 9 g t)
      (xi - frac(2, 3) (c_L + xi) + frac(2 c_L - xi, 3)).
$

The parenthesis is $xi - (2 \/ 3) xi - (1 \/ 3) xi - (2 \/ 3) c_L + (2 \/ 3) c_L = 0$. Momentum becomes

$
  u_t + u u_x + g h_x
    = frac(1, 9 t) (- 2 xi + 4 c_L - 2 phi)
    = 0,
$

because $phi = 2 c_L - xi$. The cancellation uses only the local formulas, so it is unaffected by cutting the fan off at $c = c_m$.

At $xi = - c_L$ these formulas return $(h_L, 0)$. At $xi = u_m - c_m$ they return $c = c_m$ and $u = 2 (c_L - c_m) = u_m$. The rarefaction therefore meets both neighbouring constant states continuously.

= The middle state

On $u_m - c_m < xi < s$ the fields are the constants $(h_m, u_m)$. Every derivative vanishes, so both equations reduce to $0 = 0$. The region is non-empty: the shock section shows $s > u_m - c_m$.

= The shock

Across $xi = s$ the state jumps from $(h_m, u_m)$ to $(h_R, 0)$. The mass jump fixes the speed already used in the candidate,

$
  s (h_m - h_R) = h_m u_m.
$

The momentum jump required by the conservation law is

$
  s h_m u_m = h_m u_m^2 + frac(g, 2) (h_m^2 - h_R^2).
$

From the mass jump, $s - u_m = u_m h_R \/ (h_m - h_R)$, so the momentum jump rearranges to

$
  h_m u_m (s - u_m)
    = frac(h_m h_R u_m^2, h_m - h_R)
    = frac(g, 2) (h_m - h_R) (h_m + h_R).
$

Clearing the denominator gives

$
  u_m^2 = frac(g (h_m - h_R)^2 (h_m + h_R), 2 h_m h_R),
$

which is the shock formula for $u_m$. Both Rankine--Hugoniot relations hold.

The same formula gives an explicit speed,

$
  s = sqrt(frac(g h_m (h_m + h_R), 2 h_R)).
$

It lies strictly between the right-going characteristic speeds on the two sides. First,

$
  s^2 - c_R^2
    = frac(g, 2 h_R) (h_m^2 + h_m h_R - 2 h_R^2)
    = frac(g (h_m - h_R) (h_m + 2 h_R), 2 h_R)
    > 0,
$

so $s > c_R = u_R + c_R$. Second,

$
  (u_m + c_m) - s
    = c_m - sqrt(frac(g h_R (h_m + h_R), 2 h_m)),
$

and the square of the first term exceeds the square of the second by

$
  g h_m - frac(g h_R (h_m + h_R), 2 h_m)
    = frac(g (h_m - h_R) (2 h_m + h_R), 2 h_m)
    > 0.
$

Thus $u_m + c_m > s > c_R$. Characteristics of the right-going family run into the shock, so the jump is an admissible shock. The same comparison yields $s - (u_m - c_m) = s - u_m + c_m > 0$, so the shock stays ahead of the rarefaction and the middle state occupies a strip of positive width.

Inside each open region the differential equations hold, the rarefaction joins the two constant states continuously, and the remaining jump satisfies the Rankine--Hugoniot relations together with the Lax condition. Stoker's formula is a solution.
