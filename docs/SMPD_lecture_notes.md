# Lecture Notes: Derivation of the Single Microwave Photon Detector

**Source:** Lescanne et al., *"Detecting itinerant microwave photons with engineered non-linear dissipation"*, arXiv:1902.05102 (2019).

**Scope:** Self-contained derivation from the full circuit Hamiltonian to the engineered non-linear, non-local dissipator $\hat L = \sqrt{\kappa_{\text{nl}}}\,\hat b\,\hat\sigma^\dagger$ that defines the photon detector. Each step is shown explicitly, with physical commentary motivating the mathematical moves. These notes are intended as source material for further pedagogical processing: every line of algebra is included, including computations the original supplementary materials elide.

**Structure:**
1. Full Hamiltonian and physical setup
2. The displacement transformation (in detail)
3. Rotating frame and cosine expansion
4. Identification of the four-wave-mixing term
5. Master equation with dissipation
6. Adiabatic elimination of the waste mode
7. Recognition of the engineered Lindblad form
8. Physical interpretation

---

## 1. The Full Hamiltonian

The system consists of three electromagnetic modes — buffer ($\hat b$), waste ($\hat w$), and qubit ($\hat q$) — coupled through a single Josephson junction. A strong classical microwave drive (the "pump") is applied to the qubit mode at frequency $\omega_p$. The Hamiltonian is

$$
\hat H/\hbar = \underbrace{\sum_{m=b,w,q}\omega_m \hat m^\dagger \hat m}_{\text{linear modes}} \;-\; \underbrace{\frac{E_J}{\hbar}\!\left[\cos\hat\varphi + \frac{\hat\varphi^{\,2}}{2}\right]}_{\text{Josephson nonlinearity}} \;+\; \underbrace{2\epsilon_p \cos(\omega_p t)(\hat q + \hat q^\dagger)}_{\text{pump drive}}
$$

where the phase across the junction is

$$
\hat\varphi = \sum_{m=b,w,q}\varphi_m(\hat m + \hat m^\dagger).
$$

Each $\varphi_m$ is the dimensionless zero-point phase fluctuation of mode $m$ at the junction — set by the circuit geometry and quantifying how strongly each mode "feels" the nonlinearity. The qubit mode has the largest $\varphi_q$ (it's the mode living on the junction); $\varphi_b, \varphi_w$ are smaller (those modes mostly live in their resonators with only a tail at the junction).

### Why the cosine has $+\hat\varphi^2/2$ subtracted

The Josephson energy contribution is $-E_J\cos\hat\varphi$. Taylor expanding,

$$
\cos\hat\varphi = 1 - \frac{\hat\varphi^2}{2} + \frac{\hat\varphi^4}{24} - \frac{\hat\varphi^6}{720} + \cdots,
$$

so

$$
\cos\hat\varphi + \frac{\hat\varphi^2}{2} = 1 + \frac{\hat\varphi^4}{24} - \frac{\hat\varphi^6}{720} + \cdots.
$$

Thus

$$
-\frac{E_J}{\hbar}\!\left[\cos\hat\varphi + \frac{\hat\varphi^2}{2}\right] = -\frac{E_J}{\hbar} - \frac{E_J}{\hbar}\frac{\hat\varphi^4}{24} + \frac{E_J}{\hbar}\frac{\hat\varphi^6}{720} - \cdots
$$

The constant $-E_J/\hbar$ is irrelevant. The leading nonlinear term is $-(E_J/\hbar)\hat\varphi^4/24$ — the source of all Kerr, cross-Kerr, and parametric mixing terms in the system.

The reason for the explicit $+\hat\varphi^2/2$ subtraction: when the circuit is quantized, the inductive ($\propto E_J\hat\varphi^2/2$) part of the Josephson cosine combines with capacitive energies to produce the linear mode frequencies $\omega_m$. Those frequencies are *already* baked into $\sum_m\omega_m\hat m^\dagger\hat m$. Subtracting $\hat\varphi^2/2$ from inside the bracket avoids double-counting: what remains is purely nonlinear (quartic and higher).

---

## 2. The Time-Dependent Displacement Transformation

The pump is *strong*: $|\xi_p|^2$ is comparable to or larger than 1 photon. We cannot treat it as a small perturbation. Instead, we move to a frame where the qubit's classical response to the pump is absorbed into the frame transformation, leaving only quantum fluctuations on top.

This is one of the most conceptually subtle steps. Below, I work it out from first principles.

### 2.1 The displacement operator

For a bosonic mode $\hat q$, the displacement operator is

$$
\hat D(\xi) = \exp\!\left[\xi\hat q^\dagger - \xi^*\hat q\right]
$$

with $\xi$ a complex number. It is unitary, $\hat D^\dagger(\xi) = \hat D(-\xi) = \hat D^{-1}(\xi)$, and its key property is the **shift relation**:

$$
\hat D^\dagger(\xi)\,\hat q\,\hat D(\xi) = \hat q + \xi, \qquad \hat D^\dagger(\xi)\,\hat q^\dagger\,\hat D(\xi) = \hat q^\dagger + \xi^*.
$$

**Proof:** Use the Baker-Campbell-Hausdorff identity $e^{-\hat A}\hat B e^{\hat A} = \hat B + [\hat B, \hat A] + \frac{1}{2!}[[\hat B,\hat A],\hat A] + \cdots$. With $\hat A = \xi\hat q^\dagger - \xi^*\hat q$ and $\hat B = \hat q$:

$$
[\hat q, \xi\hat q^\dagger - \xi^*\hat q] = \xi[\hat q,\hat q^\dagger] = \xi.
$$

Higher commutators vanish because $\xi$ is a c-number. Hence $\hat D^\dagger\hat q\hat D = \hat q + \xi$. The conjugate relation follows similarly.

Physically, $\hat D(\xi)|0\rangle = |\xi\rangle$ is the coherent state with amplitude $\xi$; the displacement "shifts" vacuum to a coherent state.

### 2.2 Active vs. passive interpretation

A unitary transformation can be applied in two equivalent ways:
- **Active (Schrödinger):** transform the state, $|\psi\rangle \to \hat D|\psi\rangle$; operators stay the same.
- **Passive (Heisenberg-like):** transform operators, $\hat O \to \hat D^\dagger\hat O\hat D$; states stay the same.

Both give identical physical predictions. For our problem we want the **passive** version: keep the state we're solving for, but express the Hamiltonian in terms of shifted operators. The new "$\hat q$" then describes fluctuations around the classical pump amplitude rather than around vacuum.

### 2.3 Time-dependent unitary transformations: the general formula

When the unitary is time-dependent, $\hat U(t)$, transforming states by $|\psi'\rangle = \hat U^\dagger(t)|\psi\rangle$ produces a Schrödinger equation with a *modified* Hamiltonian. To derive this, differentiate:

$$
\frac{d|\psi'\rangle}{dt} = \frac{d\hat U^\dagger}{dt}|\psi\rangle + \hat U^\dagger\frac{d|\psi\rangle}{dt}.
$$

Substituting $|\psi\rangle = \hat U|\psi'\rangle$ and the original Schrödinger equation $i\hbar d|\psi\rangle/dt = \hat H|\psi\rangle$:

$$
i\hbar\frac{d|\psi'\rangle}{dt} = \hat H'|\psi'\rangle, \qquad \boxed{\;\hat H' = \hat U^\dagger\hat H\hat U + i\hbar\frac{d\hat U^\dagger}{dt}\hat U\;}
$$

The crucial point: when going to a time-dependent frame, you *do not* simply get $\hat U^\dagger\hat H\hat U$. There is an extra "fictitious" term $i\hbar(d\hat U^\dagger/dt)\hat U$ from the time-dependence of the frame itself. This is exactly analogous to the centrifugal/Coriolis terms that appear in classical mechanics when changing to a rotating reference frame. The fictitious term is what allows us to absorb the pump drive into the frame transformation.

### 2.4 Apply to the pumped qubit

Take

$$
\hat D(t) = \exp\!\left[\xi(t)\hat q^\dagger - \xi^*(t)\hat q\right], \qquad \xi(t) = \xi_p e^{-i\omega_p t}.
$$

Here $\xi_p$ is a constant complex number (to be chosen); the time dependence is entirely in the phase factor.

**Operator transformation.** Using the shift relation,

$$
\hat D^\dagger(t)\,\hat q\,\hat D(t) = \hat q + \xi_p e^{-i\omega_p t}, \qquad \hat D^\dagger(t)\,\hat q^\dagger\,\hat D(t) = \hat q^\dagger + \xi_p^* e^{i\omega_p t}.
$$

The buffer and waste operators are unaffected.

The phase across the junction transforms as

$$
\hat\varphi \;\to\; \hat D^\dagger\hat\varphi\hat D = \sum_m\varphi_m(\hat m + \hat m^\dagger) + \varphi_q\bigl(\xi_p e^{-i\omega_p t} + \xi_p^* e^{i\omega_p t}\bigr).
$$

The pump now appears as a c-number addition to the phase across the junction. **This is the structural point of the displacement.** Before the transformation the pump was a linear drive that could only excite the qubit mode; after the transformation it sits inside the Josephson nonlinearity and can mix with all three modes.

**The fictitious term.** We compute $i\hbar(d\hat D^\dagger/dt)\hat D$ explicitly.

Let $\hat X(t) = \xi(t)\hat q^\dagger - \xi^*(t)\hat q$, so $\hat D = e^{\hat X}$ and $\hat D^\dagger = e^{-\hat X}$. We have

$$
\dot\xi = -i\omega_p\xi_p e^{-i\omega_p t} = -i\omega_p\xi, \qquad \dot{\xi^*} = +i\omega_p\xi^*.
$$

Therefore

$$
\dot{\hat X} = \dot\xi\hat q^\dagger - \dot{\xi^*}\hat q = -i\omega_p\xi\hat q^\dagger - i\omega_p\xi^*\hat q = -i\omega_p\bigl(\xi\hat q^\dagger + \xi^*\hat q\bigr).
$$

Compute the commutator $[\hat X, \dot{\hat X}]$:

$$
[\hat X,\dot{\hat X}] = -i\omega_p\bigl[\xi\hat q^\dagger - \xi^*\hat q,\; \xi\hat q^\dagger + \xi^*\hat q\bigr].
$$

Expanding the bracket:

$$
[\xi\hat q^\dagger - \xi^*\hat q,\; \xi\hat q^\dagger + \xi^*\hat q] = \xi\xi^*[\hat q^\dagger,\hat q] + (-\xi^*)\xi[\hat q,\hat q^\dagger] = -|\xi_p|^2 - |\xi_p|^2 = -2|\xi_p|^2,
$$

so

$$
[\hat X,\dot{\hat X}] = -i\omega_p\cdot(-2|\xi_p|^2) = 2i\omega_p|\xi_p|^2,
$$

which is a c-number. When the commutator $[\hat X,\dot{\hat X}]$ is a c-number, the BCH formula gives

$$
\frac{d}{dt}e^{\hat X} = \Bigl(\dot{\hat X} + \tfrac{1}{2}[\hat X,\dot{\hat X}]\Bigr)e^{\hat X}.
$$

Therefore

$$
\frac{d\hat D^\dagger}{dt} = \frac{d}{dt}e^{-\hat X} = \Bigl(-\dot{\hat X} + \tfrac{1}{2}[\hat X,\dot{\hat X}]\Bigr)e^{-\hat X} = \Bigl(-\dot{\hat X} + \tfrac{1}{2}[\hat X,\dot{\hat X}]\Bigr)\hat D^\dagger.
$$

Multiplying by $\hat D$ on the right gives

$$
i\hbar\frac{d\hat D^\dagger}{dt}\hat D = i\hbar\Bigl(-\dot{\hat X} + \tfrac{1}{2}[\hat X,\dot{\hat X}]\Bigr).
$$

Substituting the values:

$$
-\dot{\hat X} = i\omega_p\bigl(\xi\hat q^\dagger + \xi^*\hat q\bigr), \qquad \tfrac{1}{2}[\hat X,\dot{\hat X}] = i\omega_p|\xi_p|^2,
$$

we get

$$
i\hbar\frac{d\hat D^\dagger}{dt}\hat D = i\hbar\bigl[i\omega_p(\xi\hat q^\dagger + \xi^*\hat q) + i\omega_p|\xi_p|^2\bigr] = -\hbar\omega_p\bigl(\xi\hat q^\dagger + \xi^*\hat q\bigr) - \hbar\omega_p|\xi_p|^2.
$$

The constant term shifts the energy (irrelevant). The operator part is

$$
-\hbar\omega_p\bigl(\xi_p e^{-i\omega_p t}\hat q^\dagger + \xi_p^* e^{i\omega_p t}\hat q\bigr).
$$

### 2.5 Transform the original Hamiltonian piece by piece

**Linear qubit term** $\omega_q\hat q^\dagger\hat q$: under the shift, $\hat q\to\hat q + \xi$, $\hat q^\dagger\to\hat q^\dagger + \xi^*$, so

$$
\omega_q\hat q^\dagger\hat q \to \omega_q(\hat q^\dagger + \xi^*)(\hat q + \xi) = \omega_q\hat q^\dagger\hat q + \omega_q\xi\hat q^\dagger + \omega_q\xi^*\hat q + \omega_q|\xi_p|^2.
$$

**Buffer and waste linear terms:** unchanged (operators commute with $\hat D$).

**Cosine term:** $\hat\varphi$ acquires the c-number addition $\varphi_q(\xi e^{-i\omega_p t} + \text{c.c.})$ as derived above.

**Drive term:** $2\epsilon_p\cos(\omega_p t)(\hat q + \hat q^\dagger) \to 2\epsilon_p\cos(\omega_p t)(\hat q + \xi + \hat q^\dagger + \xi^*)$. The c-number piece is an irrelevant time-dependent global phase. Expanding the cosine using $2\cos(\omega_p t) = e^{i\omega_p t} + e^{-i\omega_p t}$:

$$
2\epsilon_p\cos(\omega_p t)(\hat q + \hat q^\dagger) = \epsilon_p e^{i\omega_p t}\hat q + \epsilon_p e^{-i\omega_p t}\hat q + \epsilon_p e^{i\omega_p t}\hat q^\dagger + \epsilon_p e^{-i\omega_p t}\hat q^\dagger.
$$

Of the four terms, two are co-rotating ($e^{i\omega_p t}\hat q$ and $e^{-i\omega_p t}\hat q^\dagger$) and two are counter-rotating ($e^{-i\omega_p t}\hat q$ and $e^{i\omega_p t}\hat q^\dagger$). The counter-rotating pieces oscillate at $2\omega_p$ in any rotating frame near $\omega_q\approx\omega_p$ and are dropped under RWA (valid when $\omega_p$ is not very small). The kept pieces are

$$
\epsilon_p e^{i\omega_p t}\hat q + \epsilon_p e^{-i\omega_p t}\hat q^\dagger.
$$

### 2.6 Cancel the linear qubit drive

Collect the terms linear in $\hat q^\dagger$ in the transformed Hamiltonian (setting $\hbar=1$ to declutter):

1. From transformed $\omega_q\hat q^\dagger\hat q$: $\;\omega_q\xi_p e^{-i\omega_p t}\hat q^\dagger$.
2. From the fictitious term: $\;-\omega_p\xi_p e^{-i\omega_p t}\hat q^\dagger$.
3. From the drive (RWA-kept piece): $\;\epsilon_p e^{-i\omega_p t}\hat q^\dagger$.
4. From the cosine expansion: nonlinear contributions in $\xi_p$ — small corrections handled below.

Summing 1–3:

$$
\bigl[(\omega_q - \omega_p)\xi_p + \epsilon_p\bigr]e^{-i\omega_p t}\hat q^\dagger.
$$

This vanishes if and only if

$$
\boxed{\;\xi_p = -\frac{\epsilon_p}{\omega_q - \omega_p}\;}
$$

The conjugate cancellation (linear in $\hat q$) is automatic.

**This is the linear-response value of $\xi_p$ that defines the displacement.** With this choice, the linear pump drive on the qubit is gone in the new frame. The pump still appears in the Hamiltonian, but only through the c-number addition to $\hat\varphi$ inside the cosine.

### 2.7 Why this is justified

Three perspectives:

1. **It's a unitary change of basis.** Physical observables are unchanged. As long as states, operators, dissipators, and measurements are all transformed consistently, predictions are identical.

2. **Separation of classical and quantum dynamics.** The pump is strong and coherent; its photon-number distribution is sharply peaked, and its fluctuations are negligible compared to its mean. Treating it as a c-number $\xi_p e^{-i\omega_p t}$ rather than a quantum mode preserves the essential physics while drastically simplifying the calculation. This is the same logic used everywhere classical drives appear in quantum optics.

3. **The linear-response approximation.** Strictly, the cosine term contributes nonlinear corrections to the cancellation condition (cubic and higher in $\xi_p$). When the pump is far detuned from $\omega_q$ (here, $\omega_q-\omega_p\sim 300$ MHz, much larger than $\chi_{qq}|\xi_p|^2\sim 10$ MHz), the linear-response value $\xi_p = -\epsilon_p/(\omega_q-\omega_p)$ is accurate at leading order. The leftover nonlinear terms after cancellation are exactly the parametric processes we want.

**Adiabaticity caveat.** We've assumed $\xi_p$ is constant in the rotating frame, but experimentally the pump is switched on and off with some envelope $\xi_p(t)$. If the envelope changes faster than the detuning $|\omega_q-\omega_p|$, extra terms from $d\xi_p/dt$ appear and can excite the qubit non-adiabatically. The condition is

$$
\bigl|\dot\xi_p/\xi_p\bigr| \ll |\omega_q - \omega_p|,
$$

requiring envelope rise times slow compared to $1/(\omega_q-\omega_p)\sim 3$ ns. Typical experimental rise times of $\sim 500$ ns satisfy this with huge margin.

---

## 3. Rotating Frame and Cosine Expansion

After the displacement, move to an interaction picture defined by

$$
\hat H_0/\hbar = \sum_{m=b,w,q}(\omega_m - \delta_m)\hat m^\dagger\hat m,
$$

where the $\delta_m$ are small detunings left free for now (we will fix them later to absorb AC-Stark shifts). In this frame each operator picks up a phase:

$$
\hat m \to \hat m\, e^{-i(\omega_m-\delta_m)t}, \qquad \hat m^\dagger \to \hat m^\dagger\, e^{+i(\omega_m-\delta_m)t}.
$$

The phase across the junction in this frame is

$$
\hat\varphi'(t) = \sum_m\varphi_m\bigl(\hat m e^{-i(\omega_m-\delta_m)t} + \hat m^\dagger e^{+i(\omega_m-\delta_m)t}\bigr) + \varphi_q\bigl(\xi_p e^{-i\omega_p t} + \xi_p^* e^{i\omega_p t}\bigr).
$$

The Hamiltonian in this frame is

$$
\hat H'/\hbar = \sum_m\delta_m\hat m^\dagger\hat m \;-\;\frac{E_J}{\hbar}\!\left[\cos\hat\varphi' + \tfrac{\hat\varphi'^2}{2}\right].
$$

The mode frequencies have effectively "disappeared" into the time dependence of the operators; only the residual $\delta_m$ remain.

### 3.1 The eight-letter alphabet for $\hat\varphi'^4$

Keep only the leading nonlinear term, $-(E_J/\hbar)\hat\varphi'^4/24$. Define eight phasors (six mode operators plus two pump c-numbers), with their corresponding frequencies:

| Symbol | Operator/c-number piece | Frequency |
|--------|--------------------------|-----------|
| $B$ | $\varphi_b\hat b\, e^{-i(\omega_b-\delta_b)t}$ | $-(\omega_b-\delta_b)$ |
| $B^*$ | $\varphi_b\hat b^\dagger\, e^{+i(\omega_b-\delta_b)t}$ | $+(\omega_b-\delta_b)$ |
| $W$ | $\varphi_w\hat w\, e^{-i(\omega_w-\delta_w)t}$ | $-(\omega_w-\delta_w)$ |
| $W^*$ | $\varphi_w\hat w^\dagger\, e^{+i(\omega_w-\delta_w)t}$ | $+(\omega_w-\delta_w)$ |
| $Q$ | $\varphi_q\hat q\, e^{-i(\omega_q-\delta_q)t}$ | $-(\omega_q-\delta_q)$ |
| $Q^*$ | $\varphi_q\hat q^\dagger\, e^{+i(\omega_q-\delta_q)t}$ | $+(\omega_q-\delta_q)$ |
| $P$ | $\varphi_q\xi_p\, e^{-i\omega_p t}$ | $-\omega_p$ |
| $P^*$ | $\varphi_q\xi_p^*\, e^{+i\omega_p t}$ | $+\omega_p$ |

Then

$$
\hat\varphi' = B + B^* + W + W^* + Q + Q^* + P + P^*,
$$

and $\hat\varphi'^4$ is a sum of $8^4 = 4096$ ordered products. Most oscillate fast and average to zero; under RWA only stationary products (those with zero total exponent) survive.

### 3.2 Surviving terms under RWA

Three types of stationary products:

- **Mode-pair products** like $\hat m\hat m^\dagger$ (one $M$ and one $M^*$, same mode): zero exponent. These produce Kerr and cross-Kerr terms.
- **Pump-pair products** $PP^* = \varphi_q^2|\xi_p|^2$: zero exponent. Combined with mode pairs, generate pump-induced Stark shifts.
- **The 4WM resonance:** the product $B\cdot W^*\cdot Q^*\cdot P$ has total exponent

  $$
  -(\omega_b-\delta_b) + (\omega_w-\delta_w) + (\omega_q-\delta_q) - \omega_p.
  $$

  Choose

  $$
  \boxed{\;\omega_p = (\omega_q-\delta_q) + (\omega_w-\delta_w) - (\omega_b-\delta_b)\;} \quad (\star)
  $$

  to make this exponent zero. The conjugate combination $B^*\cdot W\cdot Q\cdot P^*$ also survives.

### 3.3 The 4WM coefficient

The product $P\cdot B\cdot W^*\cdot Q^*$ comes from $\hat\varphi'^4$. With four distinct letters, the number of ordered arrangements is $4! = 24$, exactly cancelling the $1/24$ in $\hat\varphi'^4/24$. The resonant piece is

$$
-\frac{E_J}{\hbar}\cdot\frac{1}{24}\cdot 24\cdot P\cdot B\cdot W^*\cdot Q^* + \text{h.c.}
$$

$$
= -\frac{E_J}{\hbar}\,\varphi_q\xi_p\cdot\varphi_b\hat b\cdot\varphi_w\hat w^\dagger\cdot\varphi_q\hat q^\dagger + \text{h.c.}
$$

(All exponentials cancel.) Pulling constants out:

$$
\hat H_{4\text{WM}}/\hbar = -\frac{E_J}{\hbar}\varphi_q^2\varphi_b\varphi_w\,\xi_p\,\hat b\,\hat w^\dagger\hat q^\dagger + \text{h.c.}
$$

Define

$$
g_3 \equiv -\frac{E_J}{\hbar}\varphi_q^2\varphi_b\varphi_w\,\xi_p,
$$

so

$$
\boxed{\;\hat H_{4\text{WM}}/\hbar = g_3\,\hat b\,\hat w^\dagger\hat q^\dagger + g_3^*\,\hat b^\dagger\hat w\,\hat q\;}
$$

### 3.4 Express $g_3$ via cross-Kerrs

The cross-Kerr couplings, also generated by $\hat\varphi'^4/24$, are

$$
\hbar\chi_{qb} = E_J\varphi_q^2\varphi_b^2, \qquad \hbar\chi_{qw} = E_J\varphi_q^2\varphi_w^2.
$$

Therefore $\sqrt{\chi_{qb}\chi_{qw}} = (E_J/\hbar)\varphi_q^2\,\varphi_b\varphi_w$, giving

$$
\boxed{\;g_3 = -\xi_p\sqrt{\chi_{qb}\chi_{qw}}\;} \quad \text{(SI Eq. 12)}
$$

### 3.5 Other surviving terms

**Stark shifts** (from $PP^*\hat m^\dagger\hat m$ and similar):

$$
\hat H_{\text{Stark}}/\hbar = \sum_{m=b,w}(\delta_m - \chi_{qm}|\xi_p|^2)\hat m^\dagger\hat m + (\delta_q - 2\chi_{qq}|\xi_p|^2)\hat q^\dagger\hat q.
$$

The factor of 2 on the qubit Stark shift is combinatorial (more orderings when both pump factors and both qubit operators come from the same mode).

**Kerr and cross-Kerr** (no pump, four mode operators):

$$
\hat H_{\text{Kerr}}/\hbar = -\sum_m\frac{\chi_{mm}}{2}\hat m^{\dagger 2}\hat m^2 - \chi_{qb}\hat b^\dagger\hat b\,\hat q^\dagger\hat q - \chi_{qw}\hat w^\dagger\hat w\,\hat q^\dagger\hat q - \chi_{bw}\hat b^\dagger\hat b\,\hat w^\dagger\hat w,
$$

with $\hbar\chi_{mm} = E_J\varphi_m^4/2$, $\hbar\chi_{mn} = E_J\varphi_m^2\varphi_n^2$ ($m\neq n$).

### 3.6 Choice of detunings

Use the free $\delta_m$ to cancel the Stark shifts:

$$
\delta_q = 2\chi_{qq}|\xi_p|^2, \qquad \delta_b = \chi_{qb}|\xi_p|^2, \qquad \delta_w = \chi_{qw}|\xi_p|^2 + \Delta,
$$

where $\Delta$ is a free detuning kept on the waste for later use. Plugging back into $(\star)$ gives the lab-frame pump frequency:

$$
\boxed{\;\omega_p = \omega_q + \omega_w - \omega_b - \Delta - |\xi_p|^2\bigl(2\chi_{qq} + \chi_{qw} - \chi_{qb}\bigr)\;} \quad \text{(SI Eq. 13)}
$$

The $|\xi_p|^2$-dependent slope is what calibrates pump amplitude in photon-number units (Fig. 2a of the paper).

### 3.7 Truncate the qubit

The qubit anharmonicity $\chi_{qq}/2\pi = 146$ MHz is much larger than all rates of interest ($g_3, \kappa_b, \kappa_w \sim$ MHz), so transitions to $|f\rangle$ are off-resonant and the qubit is well-described as a two-level system:

$$
\hat q \to \hat\sigma = |g\rangle\langle e|, \qquad \hat q^\dagger \to \hat\sigma^\dagger = |e\rangle\langle g|.
$$

The 4WM Hamiltonian becomes

$$
\boxed{\;\hat H_{\text{eff}}/\hbar = g_3\,\hat b\,\hat\sigma^\dagger\hat w^\dagger + g_3^*\,\hat b^\dagger\hat\sigma\hat w\;} \quad \text{(main text Eq. 2)}
$$

---

## 4. Master Equation with Dissipation

Including dissipation on all three modes, the joint density matrix $\rho$ obeys

$$
\frac{d\rho}{dt} = -\frac{i}{\hbar}[\hat H'',\rho] + \kappa_w\mathcal{D}[\hat w]\rho + \kappa_b\mathcal{D}[\hat b]\rho + \kappa_q\mathcal{D}[\hat\sigma]\rho + \frac{\kappa_\varphi}{2}\mathcal{D}[\hat\sigma_z]\rho,
$$

where $\mathcal{D}[\hat O]\rho = \hat O\rho\hat O^\dagger - \tfrac{1}{2}\hat O^\dagger\hat O\rho - \tfrac{1}{2}\rho\hat O^\dagger\hat O$ is the standard Lindblad superoperator. The Hamiltonian (after qubit truncation, grouping waste-involving terms) is

$$
\hat H''/\hbar = g_3\,\hat b\,\hat\sigma^\dagger\hat w^\dagger + g_3^*\,\hat b^\dagger\hat\sigma\hat w + \bigl(\Delta - \chi_{qw}\hat\sigma^\dagger\hat\sigma - \chi_{bw}\hat b^\dagger\hat b\bigr)\hat w^\dagger\hat w + \hat H_{qb}/\hbar,
$$

with $\hat H_{qb}$ collecting buffer/qubit-only terms (buffer self-Kerr, qubit-buffer cross-Kerr, etc.). This is SI Eq. (S16).

---

## 5. Adiabatic Elimination of the Waste Mode

### 5.1 The small parameter

The regime is

$$
|g_3|,\;\chi_{qb},\;\chi_{bw},\;\chi_{bb},\;\kappa_b,\;\kappa_q,\;\kappa_\varphi \;\sim\; \delta\,\kappa_w, \qquad \delta\ll 1,
$$

with $\chi_{qw}/\kappa_w \sim 1$ and $\Delta/\kappa_w \sim 1$. Numerically, $\kappa_w/2\pi = 2.4$ MHz dominates over $g_3,\kappa_b\sim 0.1$–$1$ MHz.

Physical picture: any waste excitation leaks out in time $\sim 1/\kappa_w$, before any other process can act. The waste hovers very close to vacuum.

### 5.2 Density matrix ansatz

Expand $\rho$ in the waste Fock basis:

$$
\rho = \rho_{00}|0\rangle\langle 0| + \delta\bigl(\rho_{10}|1\rangle\langle 0| + \rho_{01}|0\rangle\langle 1|\bigr) + \delta^2\bigl(\rho_{11}|1\rangle\langle 1| + \rho_{20}|2\rangle\langle 0| + \rho_{02}|0\rangle\langle 2|\bigr) + O(\delta^3).
$$

The coefficients $\rho_{nm}$ are operators on the buffer-qubit Hilbert space, and are taken to be of order $\delta^0$. The reduced state for buffer-qubit is

$$
\rho_{qb} = \mathrm{Tr}_w(\rho) = \rho_{00} + \delta^2\rho_{11} + O(\delta^4).
$$

The $\delta^k$ scaling reflects: $\hat H''$ creates waste excitations through $g_3\hat b\hat\sigma^\dagger\hat w^\dagger$ at rate $g_3\sim\delta\kappa_w$, so each application of the Hamiltonian produces one extra power of $\delta$.

### 5.3 Useful definitions

Define

$$
\hat A \equiv \frac{g_3}{\kappa_w\delta}\hat b\hat\sigma^\dagger \quad\text{(order $\delta^0$)}, \qquad \hat{\tilde\Delta} \equiv \frac{\Delta - \chi_{qw}\hat\sigma^\dagger\hat\sigma - \chi_{bw}\hat b^\dagger\hat b}{\kappa_w} \quad\text{(order $\delta^0$)}.
$$

The waste-involving Hamiltonian is

$$
\hat H_w/\hbar = \kappa_w\delta\hat A\hat w^\dagger + \kappa_w\delta\hat A^\dagger\hat w + \kappa_w\hat{\tilde\Delta}\hat w^\dagger\hat w.
$$

The buffer-qubit-only Liouvillian is

$$
\mathcal{L}_{qb}(\rho_{kn}) \equiv -\frac{i}{\hbar}[\hat H_{qb},\rho_{kn}] + \kappa_b\mathcal{D}[\hat b]\rho_{kn} + \kappa_q\mathcal{D}[\hat\sigma]\rho_{kn} + \frac{\kappa_\varphi}{2}\mathcal{D}[\hat\sigma_z]\rho_{kn}.
$$

By assumption, $\mathcal{L}_{qb}/\kappa_w\sim\delta$.

### 5.4 Project the master equation

Compute matrix elements $\langle m|\hat H_w|k\rangle$ between waste Fock states (using $\hat w|n\rangle=\sqrt{n}|n-1\rangle$, $\hat w^\dagger|n\rangle=\sqrt{n+1}|n+1\rangle$):

- $\langle 0|\hat H_w|0\rangle = 0$
- $\langle 0|\hat H_w|1\rangle = \kappa_w\delta\hat A^\dagger$
- $\langle 1|\hat H_w|0\rangle = \kappa_w\delta\hat A$
- $\langle 1|\hat H_w|1\rangle = \kappa_w\hat{\tilde\Delta}$
- $\langle 1|\hat H_w|2\rangle = \kappa_w\delta\sqrt{2}\hat A^\dagger$
- $\langle 0|\hat H_w|2\rangle = 0$

Using $\langle m|\hat H_w\rho|n\rangle = \sum_k\langle m|\hat H_w|k\rangle\langle k|\rho|n\rangle$ and the ansatz powers:

**Block $\langle 0|\cdots|0\rangle$:**

$$
-\frac{i}{\hbar}\langle 0|[\hat H_w,\rho]|0\rangle = \kappa_w\delta^2\bigl(i\rho_{01}\hat A - i\hat A^\dagger\rho_{10}\bigr).
$$

The waste dissipator contributes:

$$
\kappa_w\langle 0|\mathcal{D}[\hat w]\rho|0\rangle = \kappa_w\delta^2\rho_{11}.
$$

Combining and including $\mathcal{L}_{qb}$:

$$
\boxed{\;\frac{d}{\kappa_w dt}\rho_{00} = \delta^2\bigl(i\rho_{01}\hat A - i\hat A^\dagger\rho_{10} + \rho_{11}\bigr) + \frac{1}{\kappa_w}\mathcal{L}_{qb}(\rho_{00}) + O(\delta^3)\;} \quad \text{(SI Eq. S19)}
$$

**Block $\langle 0|\cdots|1\rangle$:** Hamiltonian gives $\kappa_w\delta(\rho_{00}\hat A^\dagger + \rho_{01}\hat{\tilde\Delta})$ (with the $-i$ from the master equation, $-i$ times this); waste dissipator gives $-\kappa_w\delta\rho_{01}/2$. Dividing both sides by $\kappa_w\delta$:

$$
\boxed{\;\frac{d}{\kappa_w dt}\rho_{01} = i\rho_{00}\hat A^\dagger - \rho_{01}\bigl(\tfrac{1}{2} - i\hat{\tilde\Delta}\bigr) + O(\delta)\;} \quad \text{(SI Eq. S20)}
$$

**Block $\langle 1|\cdots|1\rangle$:** Hamiltonian gives $-i\kappa_w\delta^2(\hat A\rho_{01} - \rho_{10}\hat A^\dagger + [\hat{\tilde\Delta},\rho_{11}])$; waste dissipator gives $-\kappa_w\delta^2\rho_{11}$. Dividing by $\kappa_w\delta^2$:

$$
\boxed{\;\frac{d}{\kappa_w dt}\rho_{11} = i\rho_{10}\hat A^\dagger - i\hat A\rho_{01} - i[\hat{\tilde\Delta},\rho_{11}] - \rho_{11} + O(\delta)\;} \quad \text{(SI Eq. S21)}
$$

### 5.5 Adiabatic approximation

In Eqs. (S20) and (S21), the right-hand sides contain a "source" term proportional to the slow variable $\rho_{00}$ plus a "decay" term $\propto -\rho_{01}/2$ or $-\rho_{11}$. The decay rate (in units of $\kappa_w$) is order **unity**, while $\rho_{00}$ changes only at order $\delta^2$ (Eq. S19).

So $\rho_{01}$ and $\rho_{11}$ relax to their quasi-steady-state on a timescale $\sim 1/\kappa_w$, much faster than $\rho_{00}$ evolves. **Set $d\rho_{01}/dt = d\rho_{11}/dt = 0$** and enslave them to $\rho_{00}$.

**Solving for $\rho_{01}$:** From $0 = i\rho_{00}\hat A^\dagger - \rho_{01}(\tfrac{1}{2} - i\hat{\tilde\Delta})$,

$$
\rho_{01} = i\rho_{00}\hat A^\dagger\bigl(\tfrac{1}{2} - i\hat{\tilde\Delta}\bigr)^{-1}.
$$

Operator-ordering subtlety: $[\hat{\tilde\Delta}, \hat A^\dagger]$ is non-zero because $\hat{\tilde\Delta}$ depends on $\hat\sigma^\dagger\hat\sigma$ and $\hat A^\dagger\propto\hat\sigma$. Direct computation (using $[\hat\sigma^\dagger\hat\sigma,\hat\sigma] = -\hat\sigma$) gives $[\hat{\tilde\Delta},\hat A^\dagger] = (\chi_{qw}/\kappa_w)\hat A^\dagger$, equivalent to $\hat A^\dagger$ "shifting" the argument of $\hat{\tilde\Delta}$ by $\chi_{qw}/\kappa_w$. Carrying this through:

$$
\rho_{01} = \frac{1}{1 + 4\bigl|\frac{\Delta-\chi_{qw}}{\kappa_w}\bigr|^2}\Bigl(2i - 4\frac{\Delta-\chi_{qw}}{\kappa_w}\Bigr)\rho_{00}\hat A^\dagger \quad \text{(SI Eq. S24)}
$$

obtained by rationalizing the denominator: multiply numerator and denominator of $i/(\tfrac{1}{2} - i\frac{\Delta-\chi_{qw}}{\kappa_w})$ by $\tfrac{1}{2} + i\frac{\Delta-\chi_{qw}}{\kappa_w}$ and then by 4.

**Solving for $\rho_{11}$:** With analogous algebra,

$$
\rho_{11} = \frac{4}{1 + 4\bigl(\frac{\Delta-\chi_{qw}}{\kappa_w}\bigr)^2}\hat A\rho_{00}\hat A^\dagger \quad \text{(SI Eq. S25)}
$$

### 5.6 Define effective rates

$$
\boxed{\;\kappa_{\text{nl}} \equiv \frac{4|g_3|^2/\kappa_w}{1 + 4\bigl(\frac{\Delta-\chi_{qw}}{\kappa_w}\bigr)^2}\;} \quad \text{(SI Eq. S26)}
$$

$$
\boxed{\;\Delta_{\text{nl}} \equiv \frac{4|g_3|^2/\kappa_w}{1 + 4\bigl(\frac{\Delta-\chi_{qw}}{\kappa_w}\bigr)^2}\cdot\frac{\chi_{qw}-\Delta}{\kappa_w}\;} \quad \text{(SI Eq. S27)}
$$

Using $\hat A = g_3\hat b\hat\sigma^\dagger/(\kappa_w\delta)$, we have $\hat A\rho_{00}\hat A^\dagger = (|g_3|^2/(\kappa_w\delta)^2)\hat b\hat\sigma^\dagger\rho_{00}\hat\sigma\hat b^\dagger$, so

$$
\delta^2\rho_{11} = \frac{\kappa_{\text{nl}}}{\kappa_w}\hat b\hat\sigma^\dagger\rho_{00}\hat\sigma\hat b^\dagger.
$$

---

## 6. Recognition of the Lindblad Form

Substitute the adiabatic solutions back into the equation for $\rho_{00}$. Three pieces:

**(a)** $\kappa_w\delta^2\rho_{11} = \kappa_{\text{nl}}\,\hat b\hat\sigma^\dagger\rho_{00}\hat\sigma\hat b^\dagger$ — the "jump" term.

**(b)** $\kappa_w\delta^2(i\rho_{01}\hat A - i\hat A^\dagger\rho_{10})$ — using the explicit form of $\rho_{01}$ and the operator identity $\delta^2\hat A^\dagger\hat A = (|g_3|^2/\kappa_w^2)\hat b^\dagger\hat b\hat\sigma\hat\sigma^\dagger$, this combines into

$$
-\frac{\kappa_{\text{nl}}}{2}\bigl\{\rho_{00}, \hat b^\dagger\hat b\hat\sigma\hat\sigma^\dagger\bigr\} - i\Delta_{\text{nl}}\bigl[\hat b^\dagger\hat b\hat\sigma\hat\sigma^\dagger, \rho_{00}\bigr].
$$

**(c)** $\mathcal{L}_{qb}(\rho_{00})$ — the unmodified buffer-qubit-only dynamics.

The first two pieces of (a)+(b) are precisely $\kappa_{\text{nl}}\mathcal{D}[\hat b\hat\sigma^\dagger]\rho_{00}$, since $(\hat b\hat\sigma^\dagger)^\dagger(\hat b\hat\sigma^\dagger) = \hat b^\dagger\hat b\hat\sigma\hat\sigma^\dagger$. The remaining commutator is a Hamiltonian "generalized cross-Kerr." Thus:

$$
\boxed{\;\frac{d\rho_{00}}{dt} = -i\Delta_{\text{nl}}\bigl[\hat b^\dagger\hat b\,\hat\sigma\hat\sigma^\dagger, \rho_{00}\bigr] + \kappa_{\text{nl}}\mathcal{D}[\hat b\hat\sigma^\dagger]\rho_{00} + \mathcal{L}_{qb}(\rho_{00}) + O(\delta^3)\;} \quad \text{(SI Eq. S28)}
$$

Since $\rho_{qb}\approx\rho_{00}$ to order $\delta^2$, this is the master equation for the buffer-qubit subsystem.

### 6.1 Optimal detuning

$\kappa_{\text{nl}}$ is maximized — and $\Delta_{\text{nl}}$ vanishes — at $\Delta = \chi_{qw}$. With this choice,

$$
\boxed{\;\kappa_{\text{nl}} = \frac{4|g_3|^2}{\kappa_w}\;}
$$

and the master equation becomes

$$
\boxed{\;\frac{d\rho_{qb}}{dt} = \kappa_{\text{nl}}\,\mathcal{D}\bigl[\hat b\hat\sigma^\dagger\bigr]\rho_{qb} + \kappa_b\mathcal{D}[\hat b]\rho_{qb} + \kappa_q\mathcal{D}[\hat\sigma]\rho_{qb} + \tfrac{\kappa_\varphi}{2}\mathcal{D}[\hat\sigma_z]\rho_{qb}\;}
$$

with the engineered loss operator

$$
\boxed{\;\hat L = \sqrt{\kappa_{\text{nl}}}\,\hat b\,\hat\sigma^\dagger, \qquad \kappa_{\text{nl}} = \frac{4|g_3|^2}{\kappa_w}\;} \quad \text{(main text Eq. 3)}
$$

---

## 7. Physical Interpretation

**What just happened?** The Hamiltonian process

$$
\hat H_{\text{eff}}/\hbar = g_3\hat b\hat\sigma^\dagger\hat w^\dagger + \text{h.c.}
$$

is *coherent* and *reversible*: a buffer photon converts into (qubit excitation + waste photon) and could in principle convert back. But the waste leaks out at rate $\kappa_w \gg |g_3|$, so the reverse process never starts — the waste is always empty.

The adiabatic elimination "integrates out" the waste, replacing the coherent two-step

$$
\hat b \;\xrightarrow{g_3}\; \hat\sigma^\dagger\hat w^\dagger \;\xrightarrow{\kappa_w}\; \hat\sigma^\dagger + \text{photon out}
$$

with a single irreversible step

$$
\hat b \;\xrightarrow{\kappa_{\text{nl}} = 4|g_3|^2/\kappa_w}\; \hat\sigma^\dagger.
$$

The factor $4|g_3|^2/\kappa_w$ is the standard Purcell-like result: a fast-decaying intermediate state with linewidth $\kappa_w$ coupled at strength $g_3$ produces an effective on-resonance rate $\sim |g_3|^2/\kappa_w$.

**Two distinguishing features of $\hat L = \sqrt{\kappa_{\text{nl}}}\hat b\hat\sigma^\dagger$:**

1. **Non-local:** the operator acts on two different modes (buffer and qubit). Standard Lindblad operators act on one mode.
2. **Non-linear:** the qubit gets *raised* (excited), not lowered. The dissipator drives the qubit *toward* its excited state — but only when there's a buffer photon to consume.

This is the heart of why the detector works: the qubit becomes a witness to the photon's arrival. Critically, dephasing and energy relaxation of the qubit do not create the specific operator pattern $\hat b\hat\sigma^\dagger$, so they do not trigger fake clicks. This robustness against the qubit's main decoherence mechanisms is what gives the detector its record-low dark count rate.

---

## 8. Summary of Key Results

| Quantity | Expression | Physical meaning |
|----------|------------|------------------|
| Pump amplitude (linear response) | $\xi_p = -\epsilon_p/(\omega_q-\omega_p)$ | Cancels linear qubit drive |
| Three-wave coupling | $g_3 = -\xi_p\sqrt{\chi_{qb}\chi_{qw}}$ | Parametric mixing rate |
| Pump frequency matching | $\omega_p = \omega_q + \omega_w - \omega_b - \Delta - |\xi_p|^2(2\chi_{qq}+\chi_{qw}-\chi_{qb})$ | Energy conservation |
| Optimal detuning | $\Delta = \chi_{qw}$ | Maximizes $\kappa_{\text{nl}}$, kills cross-Kerr |
| Effective 4WM Hamiltonian | $\hat H_{\text{eff}}/\hbar = g_3\hat b\hat\sigma^\dagger\hat w^\dagger + \text{h.c.}$ | Coherent three-mode coupling |
| Engineered dissipation rate | $\kappa_{\text{nl}} = 4|g_3|^2/\kappa_w$ | Purcell-like effective rate |
| Engineered jump operator | $\hat L = \sqrt{\kappa_{\text{nl}}}\hat b\hat\sigma^\dagger$ | Non-linear, non-local dissipator |
| Detection efficiency | $\eta = 4\kappa_b\kappa_{\text{nl}}/(\kappa_b+\kappa_{\text{nl}})^2$ | Unity at $\kappa_{\text{nl}}=\kappa_b$ |

---

## Appendix: Key Approximations and Their Validity

| Approximation | Validity condition | Experimental margin |
|---------------|--------------------|---------------------|
| Drop counter-rotating drive terms (RWA on pump) | $\omega_p \gg $ relevant Rabi frequencies | $\omega_p \sim$ GHz, Rabi $\sim$ MHz: ✓ |
| Linear-response $\xi_p$ | $|\omega_q-\omega_p| \gg \chi_{qq}|\xi_p|^2$ | 300 MHz vs 10 MHz: ✓ |
| Adiabatic pump envelope | $|\dot\xi_p/\xi_p| \ll |\omega_q-\omega_p|$ | 500 ns rise vs 3 ns: ✓ |
| Truncate cosine at 4th order | $\langle\hat\varphi^2\rangle \ll 1$ | $\varphi_m \ll 1$: ✓ |
| RWA on $\hat\varphi'^4$ | All non-resonant frequencies $\gg$ couplings | GHz vs MHz: ✓ |
| Two-level qubit truncation | $\chi_{qq} \gg g_3, \kappa_b, \kappa_w$ | 146 MHz vs 1 MHz: ✓ |
| Adiabatic elimination of waste | $\kappa_w \gg \|g_3\|, \kappa_b, \kappa_q, \kappa_\varphi$ | 2.4 MHz vs 0.4 MHz: ✓ |

All approximations are well-satisfied in the experimental regime.

---

*End of derivation. Subsequent steps (efficiency derivation for coherent inputs, reset protocol via reverse process, etc.) follow from the master equation above and are documented in the SI of arXiv:1902.05102.*
