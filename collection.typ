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
