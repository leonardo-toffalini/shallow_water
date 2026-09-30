#import "@preview/lilaq:0.6.0" as lq

#set document(
  title: "Checking the steady frictionless solution",
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
    Checking the steady frictionless solution
  ]
  #v(0.55em)
  #text(size: 11pt)[
    Substitution into the one-dimensional shallow water equations
  ]
]

#v(1.1em)

A subscript on a field is a partial derivative. The depth is $h$, the bed elevation is $z(x)$, and the free-surface elevation is $eta = h + z$. The depth-averaged velocity is $u$, and $g$ is gravity. This note takes the steady frictionless flow from the companion note and substitutes it into the shallow water equations.

= The equations

With a fixed bed and no friction, the one-dimensional system is

$
  h_t + (h u)_x &= 0, \
  u_t + u u_x + g eta_x &= 0.
$

A steady flow does not depend on time, so $h = h(x)$, $u = u(x)$, and $z = z(x)$. Every time derivative drops out, and the system that has to be checked is

$
  (h u)_x &= 0, \
  u u_x + g (h + z)_x &= 0.
$

The check below assumes $h(x) > 0$ and that $h$, $u$, and $z$ are differentiable, so these classical derivatives exist.

= The candidate

The steady frictionless solution says that the discharge and Bernoulli's constant are independent of $x$:

$
  q_0 &= h u, \
  B &= frac(u^2, 2) + g (h + z),
$

with $q_0$ and $B$ constant. Equivalently, once a positive depth $h(x)$ and a nonzero discharge $q_0$ are chosen,

$
  u(x) = frac(q_0, h(x)),
  quad
  z(x) = frac(B, g) - h(x) - frac(q_0^2, 2 g h(x)^2).
$

The second formula is the bed that makes this depth a steady flow. The algebra below uses only $q_0$ and $B$ being constant.

= Mass

The depth and the velocity depend only on $x$, so $h_t = 0$. The discharge is the constant $q_0$, so

$
  (h u)_x = (q_0)_x = 0.
$

The mass equation is therefore

$
  h_t + (h u)_x = 0 + 0 = 0.
$

= Momentum

The velocity depends only on $x$, so $u_t = 0$. Differentiate Bernoulli's constant:

$
  B_x
    = (frac(u^2, 2))_x + g (h + z)_x
    = u u_x + g (h + z)_x.
$

The left side is zero because $B$ does not depend on $x$. Hence

$
  u_t + u u_x + g eta_x
    = 0 + u u_x + g (h + z)_x
    = B_x
    = 0.
$

The momentum equation holds.

= The other direction

The same two lines run backwards, so the steady equations and the candidate describe the same smooth flows.

From $(h u)_x = 0$ and a positive depth, the product $h u$ is a constant $q_0$. From the steady momentum equation,

$
  u u_x + g (h + z)_x
    = (frac(u^2, 2) + g (h + z))_x
    = 0,
$

so $u^2 \/ 2 + g (h + z)$ is a constant $B$. Every differentiable steady frictionless flow with $h > 0$ is of this form, and every flow of this form satisfies the shallow water equations.

= A smooth example

The formulas fix the bed and the velocity once a depth and a discharge are chosen. Take $g = 9.81$ and $q_0 = 1$, and

$
  h(x) = 1 - 0.3 exp(-(x / 2.5)^2).
$

On the flanks the depth is one and the bed is set to zero, so $B = 1 \/ 2 + g$. The depth is at least $0.7$, which lies above the critical depth $(q_0^2 \/ g)^(1 \/ 3)$, so the Froude number stays below one. This is the smooth subcritical case covered by the substitution. The bed is a bump, the free surface dips over the crest, and $u = q_0 \/ h$ is largest there.

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

= Where the check stops

Across a hydraulic jump, $h$ and $u$ jump, so $h_x$ and $u_x$ are not classical derivatives and the substitution above does not apply. The jump is a weak solution when the Rankine--Hugoniot relations hold. Bernoulli's constant is not the same on the two sides of a shock. The subcritical, transcritical-without-shock, and smooth parts of a transcritical flow are covered by the substitution. The shock itself is an extra condition, not a consequence of $B$ being constant.
