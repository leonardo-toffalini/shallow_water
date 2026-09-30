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
    Closed-form solutions of the nonlinear shallow water equations
  ]
]

#v(1.1em)

A subscript on a field is a partial derivative: $h_t = partial_t h$ and $h_x = partial_x h$. The depth is $h$, the bed elevation is $z$, and the free-surface elevation is $eta$, so $h = eta - z$. The depth-averaged velocity is $u$ in one dimension and $(u, v)$ in two. Gravity is $g$, and $c = sqrt(g h)$.

= The equations

On a flat frictionless bed the one-dimensional system is

$
  h_t + (h u)_x &= 0, \
  u_t + u u_x + g h_x &= 0.
$

With a bed $z(x)$ the pressure gradient is the free-surface slope,

$
  u_t + u u_x + g eta_x = 0.
$

Linear bottom friction of coefficient $tau > 0$ contributes a drag term:

$
  u_t + u u_x + g eta_x = - tau u.
$

In two dimensions,

$
  h_t + (h u)_x + (h v)_y &= 0, \
  u_t + u u_x + v u_y + g eta_x &= 0, \
  v_t + u v_x + v v_y + g eta_y &= 0.
$

The one-dimensional flat-bed system is a $2 times 2$ quasilinear hyperbolic system. Its characteristic speeds are $u plus.minus c$, and the Riemann invariants are

$
  R_(plus.minus) = u plus.minus 2 c.
$

= When a closed form exists

Arbitrary initial data do not integrate in closed form. A closed form exists for constant and steady states, for simple waves, in which one Riemann invariant is constant, and for the Ball--Thacker family. In that family the velocity is linear in the horizontal coordinates over a parabolic bed, and the partial differential equations collapse to ordinary differential equations.

The solutions below are exact integrals of the nonlinear equations. The final section records two further explicit constructions: Dressler's frictional perturbation of Ritter's wave, and MacDonald's manufactured steady states.

= Lake at rest

For an arbitrary bed $z(x)$,

$
  u = 0, quad h + z = H,
$

with $H$ constant. The free surface is flat, so the pressure gradient cancels the bed slope.

= Constant state

On a flat bed, any constants $H$ and $U$ give a solution

$
  h = H, quad u = U.
$

= Steady frictionless flow

With no friction and no sources the discharge is constant, $q = h u$, and Bernoulli's law holds along the channel:

$
  frac(u^2, 2) + g (h + z) = "const".
$

Given a positive depth $h(x)$, the bed $z(x)$ is explicit. Given the bed, the depth is a root of a cubic. A hydraulic jump between two such states is fixed by the Rankine--Hugoniot conditions. The subcritical, transcritical, and transcritical-with-shock flows over a bump are this solution.

= Ritter's dry dam break

The bed is flat and frictionless. At $t = 0$ the water is at rest with depth $h_L$ for $x < 0$ and the bed is dry for $x > 0$. Set $c_L = sqrt(g h_L)$. For $t > 0$,

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

Inside the fan, $u + 2 c = 2 c_L$. The dry front moves at $2 c_L$ and the upstream edge of the rarefaction moves at $- c_L$.

= Stoker's wet dam break

The same dam breaks into water of depth $h_R$, with $0 < h_R < h_L$, again from rest. A left-going rarefaction connects $h_L$ to an intermediate depth $h_m$, a constant state carries $(h_m, u_m)$ to a right-going shock, and the shock jumps to the undisturbed state $(h_R, 0)$. The middle state solves

$
  u_m
    = 2 (c_L - sqrt(g h_m))
    = (h_m - h_R) sqrt(frac(g (h_m + h_R), 2 h_m h_R)).
$

The rarefaction is Ritter's parabola, cut off where $c = sqrt(g h_m)$. The shock speed is

$
  s = frac(h_m u_m, h_m - h_R).
$

= General simple wave

One Riemann invariant is constant, so $u plus.minus 2 c$ is constant and $u$ is a linear function of $c$. The other invariant is an arbitrary profile $phi$, carried on the opposite family of characteristics:

$
  x = (u minus.plus c) t + phi(c).
$

Ritter's dam break is the centered wave, the case in which $phi$ is constant. For a general $phi$ the formula is explicit once it has been inverted for $c$.

= Thacker's oscillations in a parabolic basin

These solutions come from taking the velocity linear in space. The free surface is then a plane or a paraboloid, and the shoreline is part of the solution.

== Planar sloshing in a parabolic channel

The bed is $z = h_0 x^2 \/ a^2$, with $h_0 > 0$ and $a > 0$. Still water of surface elevation $h_0$ meets the bed at $x = plus.minus a$. The water translates rigidly. If $X(t)$ is the position of its center,

$
  X_(t t) + omega_0^2 X = 0,
  quad omega_0^2 = frac(2 g h_0, a^2),
$

and the fields are

$
  u &= X_t, \
  eta &= h_0 (1 - X^2 / a^2) + frac(2 h_0, a^2) X x.
$

The depth is $eta - z$ for $X - a <= x <= X + a$, and zero outside. The general frictionless solution is

$
  X(t) = C_1 cos(omega_0 t) + C_2 sin(omega_0 t).
$

== Planar sloshing in a paraboloid

The bed is the paraboloid of revolution

$
  z = - d_0 (1 - (x^2 + y^2) / L^2),
$

with $d_0 > 0$ and $L > 0$. The shoreline is a circle of radius $L$ whose center moves on a circle of radius $A$, with $abs(A) < L$:

$
  omega &= frac(sqrt(2 g d_0), L), \
  eta &= frac(2 A d_0, L^2) (x cos(omega t) + y sin(omega t)) - frac(A^2 d_0, L^2), \
  u &= - A omega sin(omega t), \
  v &= A omega cos(omega t).
$

The wet region is the disk $(x - A cos omega t)^2 + (y - A sin omega t)^2 <= L^2$.

== Axisymmetric oscillation

On the same paraboloid, written as $z = - h_0 (1 - r^2 \/ a^2)$ with $r^2 = x^2 + y^2$, there is a radial oscillation. Let $r_0$ be the initial shoreline radius, $0 < r_0 < a$, and set

$
  A = frac(a^4 - r_0^4, a^4 + r_0^4),
  quad
  omega = frac(sqrt(8 g h_0), a),
  quad
  Theta(t) = 1 - A cos(omega t).
$

The free surface and the radial velocity are

$
  eta &= h_0 [
    frac(sqrt(1 - A^2), Theta)
    - 1
    - frac(r^2, a^2) (frac(1 - A^2, Theta^2) - 1)
  ], \
  u_r &= frac(omega r, 2) frac(A sin(omega t), Theta).
$

The Cartesian velocity is $(u, v) = (u_r \/ r) (x, y)$ away from the origin, and zero at the origin.

= Sampson, Easton and Singh, with linear friction

Keep the parabolic channel $z = h_0 x^2 \/ a^2$ and add linear friction. A velocity that depends only on time still closes. The center $X(t)$ now solves the damped oscillator

$
  X_(t t) + tau X_t + omega_0^2 X = 0,
  quad omega_0^2 = frac(2 g h_0, a^2),
$

and the surface formula of the frictionless channel is unchanged:

$
  u = X_t,
  quad
  eta = h_0 (1 - X^2 / a^2) + frac(2 h_0, a^2) X x,
$

with shorelines $x = X plus.minus a$. Writing $gamma = tau \/ 2$, the three closed forms are

$
  X(t) = cases(
    exp(- gamma t) (C_1 cos(s t) + C_2 sin(s t))
      & "if" tau < 2 omega_0,
    exp(- gamma t) (C_1 + C_2 t)
      & "if" tau = 2 omega_0,
    exp(- gamma t) (C_1 exp(mu t) + C_2 exp(- mu t))
      & "if" tau > 2 omega_0,
  )
$

where $s = sqrt(omega_0^2 - gamma^2)$ and $mu = sqrt(gamma^2 - omega_0^2)$. The underdamped solution with $u(0) = 0$ and velocity scale $B$ is

$
  u(t) &= B exp(- gamma t) sin(s t), \
  X(t) &= - frac(B, omega_0^2) exp(- gamma t) (s cos(s t) + gamma sin(s t)).
$

The motion decays. At $tau = 0$ this family reduces to planar sloshing in the channel.

= Rotating and vortical extensions

The same polynomial ansatz, a velocity linear in $(x, y)$ and a free surface quadratic in $(x, y)$, remains exact when rotation is restored. Ball showed why. On a paraboloid the motion of the center of mass separates from the rest of the flow and satisfies a linear oscillator, so the ansatz reduces the shallow water system to ordinary differential equations.

The finite-amplitude modes in a rotating paraboloid are given by Miles and Ball. The divergent and non-divergent oscillations in a rotating parabolic channel are given by Shapiro. On an $f$-plane the same structure produces the elliptical shallow-water vortices of Cushman-Roisin, the rodons.

= Carrier--Greenspan runup on a plane beach

On a plane beach the nonlinear one-dimensional system linearizes by a hodograph transformation. Take the still-water shoreline at $x = 0$, the water in $x < 0$, and the bed slope $beta > 0$, so the still-water depth is $- beta x$. The characteristic coordinates

$
  lambda = u + g beta t,
  quad
  sigma = 2 sqrt(g (eta - beta x))
$

fix the moving shoreline at $sigma = 0$. A potential $phi(sigma, lambda)$ with

$
  u = frac(1, sigma) phi_sigma
$

satisfies the linear equation

$
  (sigma phi_sigma)_sigma - sigma phi_(lambda lambda) = 0.
$

The physical variables are recovered parametrically:

$
  t &= frac(1, g beta) (lambda - u), \
  eta &= frac(1, 2 g) (- u^2 + phi_lambda), \
  x &= frac(1, 2 g beta) (- u^2 - sigma^2 / 2 + phi_lambda).
$

A monochromatic solution, with constants $A$, $chi$ and $psi$, is

$
  phi(sigma, lambda) = A upright(J)_0(chi sigma) cos(chi lambda - psi),
$

where $upright(J)_0$ is the Bessel function of the first kind of order zero. The standing wave climbs the beach without breaking for as long as the map $(sigma, lambda) |-> (x, t)$ stays invertible. For a standing wave of frequency $omega$, that fails once the shoreline amplitude reaches $g beta^2 \/ omega^2$.

The general solution with the fluid initially at rest is the Bessel integral of Carrier and Greenspan. If $f(sigma) = u_lambda$ at $lambda = 0$, then

$
  u(sigma, lambda) = frac(1, sigma) integral_0^infinity
    upright(J)_1(chi sigma) sin(chi lambda)
    (integral_0^infinity (sigma')^2 upright(J)_1(chi sigma') f(sigma') dif sigma')
    dif chi.
$

The Carrier--Wu--Yeh N-wave is this integral for a tsunami-like initial waveform.

= Explicit constructions that are not exact integrals

Dressler expanded Ritter's dry dam break in powers of the Chézy friction coefficient. The first-order correction is explicit in the body of the wave. In the tip, where friction dominates the expansion, the correction is no longer valid, and Dressler closes the tip by a separate approximation. Whitham treats that tip by an integral method. Both are perturbation solutions about Ritter's wave.

MacDonald's steady profiles are manufactured. A positive depth and a constant discharge are chosen, and the bed is then computed from the steady momentum balance, including friction, so that the chosen depth is an exact steady state of that bed. The resulting $(h, z)$ pair is explicit by construction.

#heading(level: 1, numbering: none)[References]

#set par(justify: false, hanging-indent: 1.2em)

F. K. Ball.
Some general theorems concerning the finite motion of a shallow rotating liquid lying on a paraboloid.
_Journal of Fluid Mechanics_ 17(2), 240--256, 1963.

F. K. Ball.
An exact theory of simple finite shallow water oscillations on a rotating earth.
In _Proceedings of the First Australasian Conference on Hydraulics and Fluid Mechanics_, 293--305. Pergamon, 1964.

G. F. Carrier and H. P. Greenspan.
Water waves of finite amplitude on a sloping beach.
_Journal of Fluid Mechanics_ 4(1), 97--109, 1958.

G. F. Carrier, T. T. Wu, and H. Yeh.
Tsunami run-up and draw-down on a plane beach.
_Journal of Fluid Mechanics_ 475, 79--99, 2003.

B. Cushman-Roisin.
Exact analytical solutions for elliptical vortices of the shallow-water equations.
_Tellus A_ 39A(3), 235--244, 1987.

O. Delestre, C. Lucas, P.-A. Ksinant, F. Darboux, C. Laguerre, T. N. T. Vo, F. James, and S. Cordier.
SWASHES: a compilation of shallow water analytic solutions for hydraulic and environmental studies.
arXiv:1110.0288, 2011.

R. F. Dressler.
Hydraulic resistance effect upon the dam-break functions.
_Journal of Research of the National Bureau of Standards_ 49(3), 217--225, 1952.

I. MacDonald, M. J. Baines, N. K. Nichols, and P. G. Samuels.
Analytic benchmark solutions for open-channel flows.
_Journal of Hydraulic Engineering_ 123(11), 1041--1045, 1997.

J. W. Miles and F. K. Ball.
On free-surface oscillations in a rotating paraboloid.
_Journal of Fluid Mechanics_ 17(2), 257--266, 1963.

A. Ritter.
Die Fortpflanzung der Wasserwellen.
_Zeitschrift des Vereines deutscher Ingenieure_ 36(33), 947--954, 1892.

J. Sampson, A. Easton, and M. Singh.
Moving boundary shallow water flow above parabolic bottom topography.
_ANZIAM Journal_ 47, C373--C387, 2006.

A. Shapiro.
Nonlinear shallow-water oscillations in a parabolic channel: exact solutions and trajectory analyses.
_Journal of Fluid Mechanics_ 318, 1996. doi:10.1017/s0022112096007021.

J. J. Stoker.
_Water Waves: The Mathematical Theory with Applications_.
Interscience, New York, 1957.

W. C. Thacker.
Some exact solutions to the nonlinear shallow-water wave equations.
_Journal of Fluid Mechanics_ 107, 499--508, 1981.

G. B. Whitham.
The effects of hydraulic resistance in the dam-break problem.
_Proceedings of the Royal Society of London A_ 227(1170), 399--407, 1955.
