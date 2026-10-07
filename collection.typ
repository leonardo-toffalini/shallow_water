#import "@preview/lilaq:0.6.0" as lq

#set document(
  title: "Explicit solutions of the shallow water equations",
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
    Explicit solutions of the shallow water equations
  ]
  #v(0.55em)
  #text(size: 11pt)[
    Toffalini Leonardo
  ]
]

#v(1.1em)

The depth relative to the bed is $h$, the bed elevation is $z$, and the
absolute elevation is $eta$, so $h = eta - z$. The depth-averaged velocity is
$u$. Gravity is $g$, and $c = sqrt(g h)$.

= The equations

On a flat frictionless bed the one-dimensional system is
$
  h_t + (h u)_x &= 0, \
  u_t + u u_x + g h_x &= 0.
$

With a bed $z(x)$ the second equation of the above changes to
$
  u_t + u u_x + g eta_x = 0.
$

With linear friction on the bed of coefficient $tau > 0$ it is further changed to

$
  u_t + u u_x + g eta_x = - tau u.
$

Writing the equations in matrix form we have
$
  mat(h; u)_t + mat(u, h; g, u) mat(h; u)_x = mat(0; 0).
$

The characteristic polynomial set to zero of the defining matrix is $(lambda -
u)^2 = g h$, thus the characteristic speeds are $u plus.minus c$ and the Riemann
invariants are $R_(plus.minus) = u plus.minus 2 c$.

= Explicit solutions
== Stable resting state
For arbitrary bed $z(x)$ (possibly $z(x) equiv 0$), $u = 0$ and $eta = H$ is a
trivial solution. Since $z, u, eta$, and therefore $h$ are all constant all the
derivatives are $0$, thus the equations are trivially satisfied.

== Steady flow
Bernoulli's law tells us the following
$
  u^2 / 2 + g(h + z) = B = "const."
$

And let the discharge on one side be $q_0 = h u$, with $q_0$ constant.

Given a positive depth $h(x)$ the rest is explicit:
$
  u(x) = q_0 / h(x), quad z(x) = B / g - h(x) - q_0^2 / (2 g h (x)^2).
$

After some calculations one can check that this is indeed a solution to the
equations for a sufficiently smooth $h(x)$. For a $h(x)$ that is not smooth
enough there may be a jump between two states, but then the Rankine--Hugoniot
conditions can pin down the solution.


== Dry dam break (Ritter)
The starting conditions are:
$
  h(x, 0) = cases(h_L quad &x < 0, 0 quad &x > 0) quad quad u(x, 0) = 0.
$

Let $c_L = sqrt(g h_L)$, then the solution is

$
  h(x, t) = cases(
    h_L & "if" x < - c_L t,
    frac(1, 9 g) (2 c_L - x / t)^2 & "if" - c_L t <= x <= 2 c_L t,
    0 & "if" x > 2 c_L t,
  )
$

$
  u(x, t) = cases(
    0 & "if" x < - c_L t,
    frac(2, 3) (c_L + x / t) & "if" - c_L t <= x <= 2 c_L t,
    0 & "if" x > 2 c_L t.
  )
$


== Wet dam break (Stoker)
The starting conditions are:
$
  h(x, 0) = cases(h_L quad &x < 0, h_R quad &x > 0) quad quad u(x, 0) = 0,
$
with $0 < h_R < h_L$. That is, the only thing that changed compared to the dry
dam break case is that on the right side of the dam there is water.

Let $c_L = sqrt(g h_L)$ and $c_R = sqrt(g h_R)$ and let $u_m = 2 (c_L - c_m)$
and $c_m = sqrt(g h_m)$, where $h_m$ is the solution to
$
  u_m = 2(c_L - c_m) = (h_m - h_R) sqrt((g (h_m + h_R))/(2 h_m h_R)).
$

It can be shown that such an $h_m$ exists.

Introduce the notations $xi = x\/t$ and $s = (h_m u_m)/(h_m - h_R)$. With these
notations the solution is of the form
$
  (h, u) = cases(
    (h_L, 0) & "if" xi < - c_L,
    (frac(1, 9 g) (2 c_L - xi)^2, frac(2, 3) (c_L + xi))
      & "if" - c_L <= xi <= u_m - c_m,
    (h_m, u_m) & "if" u_m - c_m <= xi < s,
    (h_R, 0) & "if" xi > s.
  )
$

== Simple wave
A simple wave is a wave for which all but one Riemann invariants are constnat.

First note that the original equation can be rewritten in terms of $c = sqrt(g h)$:
$
  cases(
    2 c_t + 2 u c_x + c u_x &= 0,
    u_t + u u_x + 2 c c_x   &= 0
  )
$

Let $u + 2c = m$ where $m$ is constant, that is, $u = m - 2c$. For any given
differentiable $phi$ (where $phi' (c) != 3t$) let $c(x, t)$ be the solution to
$
  x = (m - 3 c) t + phi(c).
$

From this relation we can calculate the partial derivatives of $c$:
$
  c_x  = 1/(phi'(c) - 3t), quad c_t = -(m - 3c) c_x = -(u - c) c_x.
$

Rearranging the equation for $c_t$ we get that $c_t + (u - c)c_x = 0$. We can
express $u_x$ and $u_t$ in terms of $c_t$ and $c_x$ aswell:
$
  u_t = - 2 c_t, quad u_x = -2 c_x.
$

Checking the mass equation in the shallow water equation written in terms of
$c$ we get that
$
  2 c_t + 2 u c_x + c u_x = 2 c_t 2 u c_x - 2c c_x = 2 (c_t + (u - c) c_x) = 0,
$
because the expression inside the paranthesis was shown to be $0$.

For the momentum equation we can carry out a similar calculation:
$
  u_t + u u_x + 2 c c_x = -2c_t - 2u c_x + 2 c c_x = -2 (c_t + (u - c) c_x) = 0.
$

In summary, if we fix any differentiable $phi$ and a constant $m$, then solve the
equation for $c$ we can calculate $h$ as $h = c^2 \/ g$ and $u = m - 2c$.

The same argument can be said if we fix the other Riemann invariant to be
constant, with $u - 2c = k$, then we need to use the other characteristic
stpeed $u+c$ and solve for $c$ the equation $x = (u + c)t + phi(c)$. Here the
condition is that $phi'(c) != -3t$.

Note, that for example Ritter's dry dam break is a special case of this.

#pagebreak()

= Example plots

#let g = 9.81
#let q0 = 1.0
#let B = calc.pow(q0, 2) / 2 + g
#let depth(x) = 1 - 0.3 * calc.exp(-calc.pow(x / 2.5, 2))
#let bed(x) = {
  let h = depth(x)
  B / g - h - calc.pow(q0, 2) / (2 * g * calc.pow(h, 2))
}
#let surface(x) = depth(x) + bed(x)
#let xs = lq.linspace(-10, 10, num: 401)
#let zs = xs.map(bed)
#let etas = xs.map(surface)

#[
  #show: lq.set-diagram(width: 100%)
  #figure(
    {
      show: lq.layout
      grid(
        columns: 1,
        row-gutter: 0.8em,
        lq.diagram(
          height: 5.6cm,
          ylabel: [elevation],
          xlim: (-10, 10),
          ylim: (0, 1.22),
          xaxis: (format-ticks: none),
          legend: (position: top + right),
          lq.fill-between(xs, zs, fill: rgb("#d4c4a8"), label: $z$),
          lq.fill-between(
            xs, zs,
            y2: etas,
            fill: rgb("#c5ddf0"),
            label: $h$,
          ),
          lq.plot(xs, zs, color: rgb("#6e5644")),
          lq.plot(xs, etas, color: rgb("#1d4e89"), label: $eta$),
        ),
        lq.diagram(
          height: 3.4cm,
          xlabel: $x$,
          ylabel: $u$,
          xlim: (-10, 10),
          lq.plot(xs, xs.map(x => q0 / depth(x)), color: rgb("#1d4e89")),
        ),
      )
    },
    caption: [Bed, water, and free surface for this depth, and the velocity $u = q_0 \/ h$.],
  )
]

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

