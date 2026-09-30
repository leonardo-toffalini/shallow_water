#import "@preview/lilaq:0.6.0" as lq

#set document(
  title: "Checking Thacker's oscillations in a parabolic basin",
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
    Checking Thacker's oscillations in a parabolic basin
  ]
  #v(0.55em)
  #text(size: 11pt)[
    Substitution into the shallow water equations
  ]
]

#v(1.1em)

A subscript on a field is a partial derivative. The depth is $h$, the bed elevation is $z$, and the free-surface elevation is $eta$, so $h = eta - z$. The depth-averaged velocity is $u$ in one dimension and $(u, v)$ in two. Gravity is $g$. This note takes Thacker's oscillations in a parabolic basin from the companion note and substitutes them into the shallow water equations. In each case the velocity is linear in the horizontal coordinates, the free surface is a plane or a paraboloid, and the shoreline is the curve on which the depth returns to zero.

= The equations

With a fixed bed and no friction, the one-dimensional system is

$
  h_t + (h u)_x &= 0, \
  u_t + u u_x + g eta_x &= 0.
$

In two dimensions,

$
  h_t + (h u)_x + (h v)_y &= 0, \
  u_t + u u_x + v u_y + g eta_x &= 0, \
  v_t + u v_x + v v_y + g eta_y &= 0.
$

Where $h = 0$ the fluxes built from $h u$ and $h v$ vanish, whatever value is assigned to the velocity on dry ground. A moving shoreline joins that dry bed without a jump when the wet formulas reach $h = 0$ there and the shoreline advances at the fluid velocity.

= Planar sloshing in a parabolic channel

The bed is $z = h_0 x^2 \/ a^2$, with $h_0 > 0$ and $a > 0$. The center $X(t)$ of the water satisfies the oscillator

$
  X_(t t) + omega_0^2 X = 0,
  quad omega_0^2 = frac(2 g h_0, a^2),
$

and the fields on $X - a <= x <= X + a$ are

$
  u = X_t,
  quad
  eta = h_0 (1 - X^2 / a^2) + frac(2 h_0, a^2) X x,
$

with $h = 0$ outside that interval. Differentiating $X(t) = C_1 cos(omega_0 t) + C_2 sin(omega_0 t)$ gives $X_(t t) = - omega_0^2 X$, so every such center satisfies the oscillator. The substitution itself uses only the oscillator equation.

The depth is

$
  h
    = eta - z
    = frac(h_0, a^2) (a^2 - X^2 + 2 X x - x^2)
    = h_0 (1 - frac((x - X)^2, a^2)).
$

It is positive for $abs(x - X) < a$ and zero at the endpoints.

The figure takes $h_0$ and $a$ as the units of height and length, and

$
  X(t) = frac(2 a, 5) cos(omega_0 t).
$

The free surface is drawn on the wet interval at $omega_0 t = 0$, $pi \/ 2$, and $pi$. At the two extremes the velocity vanishes and the water is displaced toward one shore. At $omega_0 t = pi \/ 2$ the surface is level and $u = - (2 a omega_0) \/ 5$ at every wet point.

#let chi0 = 2 / 5
#let phases = (
  (0.0, rgb("#1d4e89"), $omega_0 t = 0$),
  (calc.pi / 2, rgb("#c45c26"), $omega_0 t = pi \/ 2$),
  (calc.pi, rgb("#2f7d4a"), $omega_0 t = pi$),
)
#let bowl = lq.linspace(-1.7, 1.7, num: 401)
#let surface(tau) = {
  let chi = chi0 * calc.cos(tau)
  let wet = lq.linspace(chi - 1, chi + 1, num: 181)
  (wet, wet.map(xi => (1 - chi * chi) + 2 * chi * xi), -chi0 * calc.sin(tau))
}

#[
  #show: lq.set-diagram(width: 100%)
  #figure(
    {
      show: lq.layout
      grid(
        columns: 1,
        row-gutter: 0.8em,
        lq.diagram(
          height: 5.4cm,
          ylabel: [elevation $ \/ h_0$],
          xlim: (-1.7, 1.7),
          ylim: (0, 2.25),
          xaxis: (format-ticks: none),
          legend: (position: top + center),
          lq.fill-between(bowl, bowl.map(xi => xi * xi), fill: rgb("#d4c4a8")),
          lq.plot(
            bowl, bowl.map(xi => xi * xi),
            color: rgb("#6e5644"),
            label: $z \/ h_0$,
          ),
          ..phases.map(((tau, color, label)) => {
            let (wet, eta, _) = surface(tau)
            lq.plot(wet, eta, color: color, label: label)
          }),
        ),
        lq.diagram(
          height: 3.4cm,
          xlabel: $x \/ a$,
          ylabel: $u \/ (a omega_0)$,
          xlim: (-1.7, 1.7),
          ylim: (-0.62, 0.28),
          legend: (position: top + right),
          ..phases.map(((tau, color, label)) => {
            let (wet, _, speed) = surface(tau)
            lq.plot(wet, wet.map(_ => speed), color: color, label: label)
          }),
        ),
      )
    },
    caption: [Planar sloshing in the parabolic channel. The free surface meets the bed at the moving shorelines $x = X plus.minus a$.],
  )
]

The velocity depends only on time, so $u_x = 0$ and $u_t = X_(t t)$. The free surface has slope $eta_x = (2 h_0 \/ a^2) X$, and momentum is

$
  u_t + u u_x + g eta_x
    = X_(t t) + g frac(2 h_0, a^2) X
    = X_(t t) + omega_0^2 X
    = 0.
$

For mass, $u = X_t$ gives

$
  h_t = frac(2 h_0, a^2) (x - X) u,
  quad
  h_x = - frac(2 h_0, a^2) (x - X).
$

Hence

$
  h_t + (h u)_x
    = h_t + u h_x
    = 0.
$

The endpoints $x = X plus.minus a$ move at speed $X_t = u$, and $h = 0$ there, so $h u = 0$. Depth and discharge meet the dry bed continuously, and the shoreline advances with the fluid.

= Planar sloshing in a paraboloid

The bed is the paraboloid of revolution

$
  z = - d_0 (1 - (x^2 + y^2) / L^2),
$

with $d_0 > 0$ and $L > 0$. Set $omega = sqrt(2 g d_0) \/ L$, so $omega^2 = 2 g d_0 \/ L^2$, and write the moving center as

$
  X = A cos(omega t),
  quad
  Y = A sin(omega t),
$

with $abs(A) < L$. The fields are

$
  u &= - A omega sin(omega t) = X_t, \
  v &= A omega cos(omega t) = Y_t, \
  eta &= frac(2 A d_0, L^2) (x cos(omega t) + y sin(omega t)) - frac(A^2 d_0, L^2).
$

The wet region is the disk $(x - X)^2 + (y - Y)^2 <= L^2$. Since $A^2 = X^2 + Y^2$,

$
  eta = frac(2 d_0, L^2) (x X + y Y) - frac(d_0, L^2) (X^2 + Y^2),
$

and the depth is

$
  h
    = eta - z
    = d_0 (1 - frac((x - X)^2 + (y - Y)^2, L^2)).
$

It vanishes on the circle of radius $L$ about $(X, Y)$. The hypothesis $abs(A) < L$ keeps the origin inside that circle.

Both velocity components depend only on time:

$
  u_t = - A omega^2 cos(omega t) = - omega^2 X,
  quad
  v_t = - A omega^2 sin(omega t) = - omega^2 Y,
$

and every spatial derivative of $u$ and $v$ is zero. The slopes are $eta_x = (2 d_0 \/ L^2) X$ and $eta_y = (2 d_0 \/ L^2) Y$, so

$
  u_t + g eta_x
    = - omega^2 X + g frac(2 d_0, L^2) X
    = 0,
$

and the same cancellation with $Y$ in place of $X$ gives the $y$-momentum equation.

For mass,

$
  h_t = frac(2 d_0, L^2) ((x - X) u + (y - Y) v),
$

while $h_x = - (2 d_0 \/ L^2) (x - X)$ and $h_y = - (2 d_0 \/ L^2) (y - Y)$. With $u$ and $v$ independent of $(x, y)$,

$
  (h u)_x + (h v)_y
    = u h_x + v h_y
    = - h_t.
$

Continuity holds. A shoreline point that stays at a fixed angle from the moving center has velocity $(u, v)$, the fluid velocity. The circle is a material curve on which $h = 0$, so it joins the dry bed without a jump.

= Axisymmetric oscillation

On the same paraboloid, now written $z = - h_0 (1 - r^2 \/ a^2)$ with $r^2 = x^2 + y^2$, take $0 < r_0 < a$ and

$
  A = frac(a^4 - r_0^4, a^4 + r_0^4),
  quad
  omega = frac(sqrt(8 g h_0), a),
  quad
  Theta(t) = 1 - A cos(omega t).
$

Then $0 < A < 1$, so $Theta(t) >= 1 - A > 0$ for every $t$ and the formulas below stay smooth. The free surface and the radial velocity are

$
  eta &= h_0 [
    frac(sqrt(1 - A^2), Theta)
    - 1
    - frac(r^2, a^2) (frac(1 - A^2, Theta^2) - 1)
  ], \
  u_r &= frac(omega r, 2) frac(A sin(omega t), Theta).
$

The Cartesian velocity is $(u, v) = (u_r \/ r) (x, y)$. The quotient $u_r \/ r$ does not depend on $r$, so this formula is defined at the origin as well, where both components vanish. Write

$
  f = frac(omega, 2) frac(A sin(omega t), Theta),
$

so $(u, v) = f (x, y)$ and $u_r = f r$.

Subtracting the bed removes the terms that do not depend on the oscillation:

$
  h
    = eta - z
    = h_0 (
      frac(sqrt(1 - A^2), Theta)
      - frac(r^2, a^2) frac(1 - A^2, Theta^2)
    ).
$

Set

$
  P = frac(h_0 sqrt(1 - A^2), Theta),
  quad
  Q = frac(h_0 (1 - A^2), a^2 Theta^2),
$

so $h = P - Q r^2$ and $Q = P^2 \/ (h_0 a^2)$. Since $Theta_t = A omega sin(omega t)$,

$
  f = frac(Theta_t, 2 Theta).
$

And since $P$ is proportional to $1 \/ Theta$, one has $P_t \/ P = - Theta_t \/ Theta$, hence

$
  f = - frac(P_t, 2 P).
$

== Momentum

The velocity is linear, so $u_t = f_t x$, $u_x = f$, $u_y = 0$, and $v_t = f_t y$, $v_x = 0$, $v_y = f$. The advective parts are $u u_x + v u_y = f^2 x$ and $u v_x + v v_y = f^2 y$. Both momentum equations therefore reduce to

$
  f_t + f^2 + frac(g, r) eta_r = 0
$

for $r > 0$. At the origin the slope vanishes with the velocity, and both momentum equations reduce to $0 = 0$. From the formula for $eta$,

$
  eta_r = - frac(2 h_0 r, a^2) (frac(1 - A^2, Theta^2) - 1),
$

so the identity to be checked is

$
  f_t + f^2 = frac(2 g h_0, a^2) (frac(1 - A^2, Theta^2) - 1).
$

Differentiate $f = Theta_t \/ (2 Theta)$:

$
  f_t = frac(Theta_(t t) Theta - Theta_t^2, 2 Theta^2).
$

Differentiating $Theta = 1 - A cos(omega t)$ gives $Theta_(t t) = omega^2 (1 - Theta)$ and $Theta_t^2 = omega^2 (A^2 - (1 - Theta)^2)$. The numerator is then

$
  Theta_(t t) Theta - Theta_t^2
    &= omega^2 [(1 - Theta) Theta + (1 - Theta)^2 - A^2] \
    &= omega^2 [(1 - Theta)(Theta + 1 - Theta) - A^2] \
    &= omega^2 (1 - A^2 - Theta),
$

and therefore

$
  f_t = frac(omega^2 (1 - A^2 - Theta), 2 Theta^2).
$

The square of the velocity coefficient is

$
  f^2
    = frac(omega^2 (A^2 - (1 - Theta)^2), 4 Theta^2)
    = frac(omega^2 (A^2 - 1 + 2 Theta - Theta^2), 4 Theta^2).
$

Adding these, the terms in $Theta$ cancel and

$
  f_t + f^2
    &= frac(omega^2, 4 Theta^2)
      [2 (1 - A^2 - Theta) + A^2 - 1 + 2 Theta - Theta^2] \
    &= frac(omega^2 (1 - A^2 - Theta^2), 4 Theta^2).
$

The right-hand side of the momentum identity has the same shape. Since $omega^2 = 8 g h_0 \/ a^2$,

$
  frac(2 g h_0, a^2) frac(1 - A^2 - Theta^2, Theta^2)
    = frac(omega^2 (1 - A^2 - Theta^2), 4 Theta^2),
$

which is $f_t + f^2$. Both momentum equations hold.

== Mass

With $h = P - Q r^2$,

$
  h_t = P_t - Q_t r^2,
  quad
  h_x = - 2 Q x,
  quad
  h_y = - 2 Q y.
$

The flux divergence is

$
  (h u)_x + (h v)_y
    &= f x h_x + h f + f y h_y + h f \
    &= 2 f h - 2 Q f r^2 \
    &= 2 f P - 4 f Q r^2.
$

Continuity becomes

$
  (P_t + 2 f P) + (- Q_t - 4 f Q) r^2 = 0.
$

The first parenthesis vanishes because $f = - P_t \/ (2 P)$. For the second, $Q = P^2 \/ (h_0 a^2)$ gives $Q_t = 2 (P_t \/ P) Q$, while

$
  4 f Q = 4 (- frac(P_t, 2 P)) Q = - 2 frac(P_t, P) Q.
$

The two terms cancel, so $h_t + (h u)_x + (h v)_y = 0$ wherever $h = P - Q r^2$.

== The shoreline

The depth is zero when $r^2 = P \/ Q$. From $P \/ Q = h_0 a^2 \/ P$ and the formula for $P$,

$
  r_s^2 = frac(a^2 Theta, sqrt(1 - A^2)).
$

At $t = 0$ one has $Theta = 1 - A$. Since $1 - A^2 = (1 - A)(1 + A)$,

$
  frac(r_s^2, a^2)
    = frac(1 - A, sqrt(1 - A^2))
    = sqrt(frac(1 - A, 1 + A)).
$

From the definition of $A$,

$
  1 - A = frac(2 r_0^4, a^4 + r_0^4),
  quad
  1 + A = frac(2 a^4, a^4 + r_0^4),
$

so $(1 - A) \/ (1 + A) = r_0^4 \/ a^4$ and $r_s(0) = r_0$.

Differentiating $r_s^2$ gives $2 r_s (r_s)_t = a^2 Theta_t \/ sqrt(1 - A^2)$, and therefore

$
  frac((r_s)_t, r_s) = frac(Theta_t, 2 Theta) = f.
$

The shoreline radius moves at the radial fluid velocity on it. Outside that circle the depth is zero and the fluxes vanish, so the wet--dry boundary carries no jump in the conserved variables.

Inside each wet region the shallow water equations hold, and each shoreline moves at the fluid velocity. All three formulas are solutions.
