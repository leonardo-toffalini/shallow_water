#import "@preview/lilaq:0.6.0" as lq

#set document(
  title: "Checking the general simple wave",
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
    Checking the general simple wave
  ]
  #v(0.55em)
  #text(size: 11pt)[
    Substitution into the one-dimensional shallow water equations
  ]
]

#v(1.1em)

A subscript on a field is a partial derivative. The depth is $h$, the depth-averaged velocity is $u$, and $g$ is gravity. Write $c = sqrt(g h)$, so $h = c^2 \/ g$. The bed is flat, so $z = 0$. This note takes the general simple wave from the companion note and substitutes it into the shallow water equations.

= The equations

On a flat frictionless bed,

$
  h_t + (h u)_x &= 0, \
  u_t + u u_x + g h_x &= 0.
$

In terms of $c$, using $g h_x = 2 c c_x$, these are

$
  2 c_t + 2 u c_x + c u_x &= 0, \
  u_t + u u_x + 2 c c_x &= 0,
$

wherever $c > 0$. The Riemann invariants are $u + 2 c$ and $u - 2 c$.

= The candidate

A simple wave makes one invariant constant, so $u$ is an affine function of $c$. The other invariant is constant along straight characteristics, and an arbitrary differentiable profile $phi$ labels those lines. The two families are

$
  u + 2 c &= m,
  quad
  x = (u - c) t + phi(c),
$

and

$
  u - 2 c &= k,
  quad
  x = (u + c) t + phi(c).
$

The signs are opposite: the constant invariant belongs to one characteristic family, and the profile $phi$ is carried on the other. In the first family $u - c = m - 3 c$. In the second, $u + c = k + 3 c$. The depth and velocity are known once the implicit equation has been solved for $c(x, t)$.

The solution is classical only while that equation defines a unique differentiable $c$. Differentiating in $c$ shows that this holds when

$
  phi'(c) - 3 t != 0
$

in the first family, and $phi'(c) + 3 t != 0$ in the second. When the derivative vanishes, neighbouring characteristics meet and the wave breaks.

The figure is the first family with $m = 2$ and $phi(c) = 3 c$, between constant states $c = 2 \/ 3$ on the left and $c = 1$ on the right. Then $u = 2 - 2 c$ and $g h = c^2$. Here $phi'(c) - 3 t = 3 - 3 t$, so the profile is classical for $t < 1$ and breaks at $t = 1$. The curves are $t = 0$ and $t = 2 \/ 3$: the transition has narrowed and steepened.

#let m = 2.0
#let alpha = 3.0
#let c-left = 2 / 3
#let c-right = 1.0
#let edge-x(c, t) = (m - 3 * c) * t + alpha * c
#let wave(t) = {
  let x-left = edge-x(c-left, t)
  let x-right = edge-x(c-right, t)
  let pad = 1.15
  let left = lq.linspace(x-left - pad, x-left, num: 30)
  let ramp = lq.linspace(x-left, x-right, num: 241)
  let right = lq.linspace(x-right, x-right + pad, num: 30)
  let denom = alpha - 3 * t
  (
    (..left, ..ramp, ..right),
    (
      ..left.map(_ => c-left * c-left),
      ..ramp.map(x => {
        let c = (x - m * t) / denom
        c * c
      }),
      ..right.map(_ => c-right * c-right),
    ),
    (
      ..left.map(_ => m - 2 * c-left),
      ..ramp.map(x => m - 2 * (x - m * t) / denom),
      ..right.map(_ => m - 2 * c-right),
    ),
  )
}
#let early = wave(0)
#let late = wave(2 / 3)

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
          ylabel: $g h$,
          xlim: (0.6, 4.4),
          ylim: (0.35, 1.15),
          xaxis: (format-ticks: none),
          legend: (position: top + left),
          lq.plot(early.at(0), early.at(1), color: rgb("#1d4e89"), label: $t = 0$),
          lq.plot(late.at(0), late.at(1), color: rgb("#c45c26"), label: $t = 2 \/ 3$),
        ),
        lq.diagram(
          height: 3.6cm,
          xlabel: $x$,
          ylabel: $u$,
          xlim: (0.6, 4.4),
          ylim: (0, 0.85),
          legend: (position: top + right),
          lq.plot(early.at(0), early.at(2), color: rgb("#1d4e89"), label: $t = 0$),
          lq.plot(late.at(0), late.at(2), color: rgb("#c45c26"), label: $t = 2 \/ 3$),
        ),
      )
    },
    caption: [A compressive simple wave of the first family, before breaking at $t = 1$. Depth is drawn as $g h = c^2$.],
  )
]

= The first family

Fix $u + 2 c = m$, so $u = m - 2 c$, and let $c(x, t)$ solve

$
  x = (m - 3 c) t + phi(c).
$

Differentiating with respect to $x$ and $t$, with $phi'(c) - 3 t != 0$, gives

$
  c_x = frac(1, phi'(c) - 3 t),
  quad
  c_t = - (m - 3 c) c_x = - (u - c) c_x.
$

Thus $c_t + (u - c) c_x = 0$: the value of $c$ is constant on each characteristic. Since $u = m - 2 c$,

$
  u_t = - 2 c_t, quad u_x = - 2 c_x.
$

Substitute into the mass equation:

$
  2 c_t + 2 u c_x + c u_x
    = 2 c_t + 2 u c_x - 2 c c_x
    = 2 (c_t + (u - c) c_x)
    = 0.
$

Substitute into the momentum equation:

$
  u_t + u u_x + 2 c c_x
    = - 2 c_t - 2 u c_x + 2 c c_x
    = - 2 (c_t + (u - c) c_x)
    = 0.
$

Both equations hold at every point where $c > 0$ and $phi'(c) != 3 t$.

= The second family

Fix $u - 2 c = k$, so $u = k + 2 c$, and let $c(x, t)$ solve $x = (k + 3 c) t + phi(c)$. The same differentiation, now using $phi'(c) + 3 t != 0$, gives

$
  c_t = - (u + c) c_x, quad u_t = 2 c_t, quad u_x = 2 c_x.
$

Mass becomes

$
  2 c_t + 2 u c_x + c u_x
    = 2 c_t + 2 u c_x + 2 c c_x
    = 2 (c_t + (u + c) c_x)
    = 0.
$

Momentum becomes

$
  u_t + u u_x + 2 c c_x
    = 2 c_t + 2 u c_x + 2 c c_x
    = 2 (c_t + (u + c) c_x)
    = 0.
$

Both equations hold.

= Ritter's wave

Ritter's rarefaction is the first family with $m = 2 c_L$ and $phi$ constant, centred at the origin, so $phi = 0$. Then $x = (2 c_L - 3 c) t$, hence

$
  c = frac(1, 3) (2 c_L - x / t),
  quad
  u = 2 c_L - 2 c = frac(2, 3) (c_L + x / t),
$

for $- c_L <= x \/ t <= 2 c_L$, which is the fan in the dry dam break. A constant $phi$ is the centred case of the same solution.

Where one Riemann invariant is constant, the implicit characteristic formula satisfies the shallow water equations up to breaking.
