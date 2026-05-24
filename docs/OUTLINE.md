# Extended outline and topic index

A detailed, annotated table of contents for *Quantum 101* (Felix Wagner).
Use this to locate where each topic is **introduced and treated in depth**
(as opposed to merely mentioned or cross-referenced). The rightmost
column gives the canonical `\label` so cross-references can target the
primary treatment.

This file is a maintenance aid, not part of the manuscript. When a new
chapter or major result is added, append it here and re-check the
**Topic overlap audit** at the end.

Legend: § = section; results are `statement`/`definition`/`theorem`
environments unless noted. "Primary" = the place a topic is *defined and
derived*; everywhere else should cross-reference it rather than repeat
it.

---

## Part I — Quantum mechanics foundations

### Ch. 1 — Postulates and the language of quantum mechanics (`ch:postulates`)
- §1.1 States and Hilbert space — kets, superposition, Hilbert space (`def:hilbert`).
- §1.2 Observables and operators — Hermitian/unitary/projector (`def:operator-types`).
- §1.3 Measurement and the Born rule; **§1.3.1 On the nature of quantum
  randomness** (`sec:quantum-randomness`) — interpretations, Bell/CHSH
  (`eq:chsh`, `eq:chsh-bound`, `eq:tsirelson`). *Primary site for CHSH.*
- §1.4 Commutators and the uncertainty principle; position/momentum
  (`def:position-momentum`).
- §1.5 Time evolution; **§1.5.1 Schrödinger/Heisenberg/interaction
  pictures** (`stmt:pictures`). *Primary site for the pictures.*

### Ch. 2 — Two canonical model systems (`ch:model-systems`)
- §2.1 The quantum harmonic oscillator — ladder operators,
  `[\hat a,\hat a^\dagger]=\id`.
- §2.2 The two-level system and the Pauli algebra — qubit (`def:qubit`),
  Pauli operators (`def:pauli`).
- §2.3 The Bloch sphere — single-qubit density matrix and purity
  (`def:density-tls`). *Primary site for the Bloch sphere.*
- §2.4 Rabi oscillations.

### Ch. 3 — Composite systems, density matrices and entanglement (`ch:composite`)
- §3.1 Composite systems and tensor products — Bell states (`ex:bell-states`).
- §3.2 Density matrices (general) (`def:density`).
- §3.3 The partial trace and reduced states (`def:partial-trace`);
  decoherence by partial trace (`ex:decoherence-by-partial-trace`).
- §3.4 Entanglement — the ebit; **qualitative** teleportation / CNOT /
  two-qubit gate (worked rigorously later in ch. 18).

### Ch. 4 — Driven systems: perturbation theory and the RWA (`ch:perturbations`)
- §4.1 Time-dependent perturbation theory.
- §4.2 Fermi's golden rule.
- §4.3 The rotating-wave approximation (`stmt:rwa`). *Primary site for the RWA.*

---

## Part II — Open quantum systems

### Ch. 5 — Open-system dynamics and the Lindblad master equation (`ch:open-systems`)
- §5.1 The reduced state of an open system (`sec:reduced-state`).
- §5.2 The Born–Markov approximations (`stmt:born-markov`).
- §5.3 The Lindblad master equation (`stmt:lindblad`).
- §5.4 Complete positivity and the dynamical-map picture (`stmt:kraus`).
  *Primary site for Kraus/CP maps.*

### Ch. 6 — Relaxation and dephasing (`ch:relaxation-dephasing`)
- §6.1 Energy relaxation $T_1$ (`stmt:t1`).
- §6.2 Pure dephasing $T_\phi$ (`stmt:tphi`).
- §6.3 The Bloch equations and coherence-time relations
  (`stmt:bloch-equations`, `stmt:t2star`).
- §6.4 Noise spectral density and the sampling picture (`stmt:noise-rates`).
  *Primary site for rates-from-$S(\omega)$.*

### Ch. 7 — Input–output theory (`ch:input-output`)
- §7.1 The bath as a continuum of modes.
- §7.2 The quantum Langevin equation and boundary relation (`stmt:input-output`).
- §7.3 Cavity response: reflection and transmission (`stmt:reflection`).
- §7.4 Cascaded systems and the route to continuous measurement.

### Ch. 8 — Continuous measurement: Zeno and quantum trajectories (`ch:continuous-measurement`)
- §8.1 The quantum Zeno effect (`stmt:zeno`).
- §8.2 Unravelling the master equation (`stmt:quantum-jumps`, `stmt:qsd`).
- §8.3 Quantum jumps in the laboratory.

---

## Part III — Quantum optics

### Ch. 9 — Quantisation of the electromagnetic field (`ch:em-quantisation`)
- §9.1 From classical modes to quantum oscillators (`stmt:field-oscillators`).
- §9.2 Fock states and the field operators (`stmt:fock`).
- §9.3 Quadratures and vacuum noise (`stmt:quadratures`). *Primary site for quadratures.*
- §9.4 Photon-number statistics — Mandel $Q$ (`stmt:mandel`).

### Ch. 10 — States of light: coherent, squeezed, and interfered (`ch:states-of-light`)
- §10.1 Coherent states; displacement operator; over-completeness
  (`stmt:coherent`, `stmt:overcomplete`). *Primary site for coherent states.*
- §10.2 Squeezed states; squeeze operator (`stmt:squeezing`).
- §10.3 Beam splitters and interferometry; Hong–Ou–Mandel (`stmt:beam-splitter`).
- §10.4 Coherence and photon statistics — $g^{(2)}$ (`stmt:g2`).

### Ch. 11 — Atom–field interaction and Jaynes–Cummings (`ch:jaynes-cummings`)
- §11.1 The atom–field coupling (`stmt:rabi-hamiltonian`).
- §11.2 The Jaynes–Cummings Hamiltonian (`stmt:jaynes-cummings`).
- §11.3 Dressed states and vacuum Rabi splitting (`stmt:dressed-states`, `stmt:vacuum-rabi`).
- §11.4 Cavity-QED regimes; cooperativity (`stmt:cqed-regimes`).

### Ch. 12 — Dispersive regime, readout, and the Purcell effect (`ch:dispersive`)
- §12.1 The dispersive Hamiltonian; dispersive shift $\chi$ (`stmt:dispersive-H`, `eq:dispersive-H`).
- §12.2 AC Stark shift and measurement-induced dephasing (`stmt:ac-stark`).
- §12.3 The Purcell effect / Purcell filter (`stmt:purcell`). *Primary site for Purcell.*
- §12.4 Dispersive (QND) readout (`stmt:dispersive-readout`). *Primary site for dispersive readout (general physics).*

---

## Part IV — Superconducting circuits

### Ch. 13 — Superconductivity and circuit quantisation (`ch:circuit-quantisation`)
- §13.1 Superconductivity as a macroscopic quantum phenomenon; flux
  quantisation, $\Phi_0=h/2e$ (`stmt:flux-quantisation`).
- §13.2 The Cooper instability and the BCS ground state
  (`stmt:bcs-hamiltonian`, `stmt:bcs-ground-state`). *Primary site for BCS gap.*
- §13.3 The gap equation and Bogoliubov quasiparticles (`stmt:bogoliubov`).
- §13.4 Lumped-element circuit quantisation (`stmt:circuit-quantisation`).
- §13.5 The $LC$ oscillator as a quantum harmonic oscillator (`stmt:lc-oscillator`).

### Ch. 14 — The Josephson junction and SQUIDs (`ch:josephson`)
- §14.1 The Josephson effect (`stmt:josephson-relations`).
- §14.2 The junction as a nonlinear inductor; $E_J$, $E_C$ (`stmt:josephson-energy`, `stmt:josephson-hamiltonian`).
- §14.3 DC, AC, and inverse-AC effects (`stmt:josephson-effects`).
- §14.4 SQUIDs: flux-tunable Josephson energy (`stmt:squid`).

### Ch. 15 — From Cooper-pair box to transmon (`ch:transmon`)
- §15.1 Anharmonicity makes a qubit (`stmt:anharmonicity`).
- §15.2 The Cooper-pair box (`stmt:cpb`).
- §15.3 The transmon limit (`stmt:transmon`). *Primary site for the transmon.*
- §15.4 Flux qubit and fluxonium (`stmt:flux-fluxonium`).

### Ch. 16 — Circuit QED: coupling, control, and gates (`ch:circuit-qed`)
- §16.1 Coupling a transmon to a resonator; $g$ (`stmt:cqed-coupling`, `eq:cqed-jc`).
- §16.2 Driving the qubit: single-qubit gates; DRAG (`stmt:single-qubit-gates`).
- §16.3 Two-qubit gates: iSWAP/CZ/cross-resonance (`stmt:two-qubit-gates`, `sec:two-qubit-gates`). *Primary site for hardware 2-qubit gates.*
- §16.4 Dispersive readout in hardware — $\chi$ from circuit (`stmt:cqed-readout`); *builds on ch. 12, cross-referenced.*
- §16.5 Parametric processes and quantum-limited amplifiers; $n_{\rm add}\ge\tfrac12$ (`stmt:parametric-amp`). *Primary site for the amplifier quantum limit (Caves).*

### Ch. 17 — Qubit tune-up and experimental basics (`ch:experimental-basics`)
- §17.1 The bring-up sequence (`stmt:bringup`, `sec:experimental-basics`).
- §17.2 Spectroscopy: finding the frequencies (`stmt:spectroscopy`).
- §17.3 Time-domain calibration: Rabi, Ramsey, echo (`stmt:time-domain`).
- §17.4 Decoherence channels in real hardware — TLS, flux noise,
  quasiparticle poisoning, Purcell (`stmt:hardware-decoherence`).

---

## Part V — Quantum information processing

### Ch. 18 — Quantum computation: gates, algorithms, and protocols (`ch:quantum-information-processing`)
- §18.1 The circuit model and a universal gate set (`def:circuit-model`,
  `stmt:universal-gates`). *Primary site for the circuit model / universality.*
- §18.2 The no-cloning theorem (`thm:no-cloning`). *Primary site.*
- §18.3 Teleportation and superdense coding (`stmt:teleportation`,
  `stmt:superdense`). *Primary (worked) site; ch. 3 is the qualitative preview.*
- §18.4 Quantum key distribution: BB84, E91 (`stmt:bb84`).
- §18.5 Clifford gates, Gottesman–Knill, and magic states
  (`stmt:gottesman-knill`, `stmt:magic-distillation`). *Primary site for stabiliser/Clifford language.*

### Ch. 19 — Quantum error correction (`ch:qec`)
- §19.1 Obstacles to error correction and their resolution; discretisation (`stmt:digitisation`).
- §19.2 Repetition codes; bit-flip & phase-flip (`stmt:repetition`, `stmt:phase-flip`).
- §19.3 The stabiliser formalism; Knill–Laflamme (`stmt:stabiliser-code`, `stmt:knill-laflamme`). *Primary site for $[[n,k,d]]$ codes.*
- §19.4 CSS codes: Shor & Steane; transversal Cliffords (`stmt:css`, `app:transversal`).
- §19.5 The surface code; threshold theorem (`stmt:surface-code`).
- §19.6 Bosonic codes in circuit QED: cat & GKP (`stmt:bosonic-codes`).

---

## Part VI — Quantum sensing

### Ch. 20 — Experimental search for dark matter (`ch:dm-search`)
- §20.1 The dark-matter halo.
- §20.2 Particle-like DM by elastic recoil — kinematics, cross-section,
  predicted rate (§20.2.1–§20.2.3).
- §20.3 Bosonic DM by absorption — kinematics, coupling Lagrangians
  (dark photons/axions), predicted rate (§20.3.1–§20.3.3). *Primary site for DM coupling Lagrangians.*
- §20.4 From spectrum to detected counts.
- §20.5 From counts to limits — Poisson upper limit, profile likelihood,
  exclusion curve. *Primary site for the statistical pipeline.*
- §20.6 Representative experiments.

### Ch. 21 — Superconducting sensors and quasiparticle-based detection (`ch:qp-detection`)
- §21.1 Superconducting sensors at millikelvin — TES, MKID, SNSPD
  (§21.1.1–§21.1.3).
- §21.2 Quasiparticle bursts and ionising radiation in cQED hardware;
  parity-switching rates (§21.2.1). *Primary site for quasiparticle/charge parity dynamics.*
- §21.3 Quasiparticle detection as a dark-matter signal.
- §21.4 Backgrounds: the low-energy excess.
- §21.5 Sensitivity estimates.

### Ch. 22 — Qubit antenna modes and infrared absorption (`ch:qubit-antenna`)
- §22.1 Antenna theory primer.
- §22.2 Qubits as antennas.
- §22.3 Backgrounds: blackbody and CMB photons.
- §22.4 Sensitivity projections for dark-photon and axion DM.

### Ch. 23 — Phonon-qubit coupling via piezoelectricity (`ch:phonon-qubit-piezo`)
- §23.1 Phonons and strain in solids.
- §23.2 Quantum acoustics with superconducting qubits.
- §23.3 Dark-matter detection via single-phonon readout.

### Ch. 24 — Cavity microwave-photon counting (`ch:microwave-absorption`)
- §24.1 Electromagnetic modes in a resonant cavity.
- §24.2 Single-microwave-photon detectors.
- §24.3 Dispersive-shift photon counting — *application of ch. 12/16 dispersive readout.*
- §24.4 Four-wave-mixing photon counting.
- §24.5 Worked example: circuit Hamiltonian to engineered Lindbladian.
- §24.6 Sensitivity for bosonic dark matter.

### Ch. 25 — Coherent multi-qubit sensing and the Heisenberg limit (`ch:coherent-multiqubit`)
- §25.1 Phase imprinted by a dark-matter field.
- §25.2 Independent probes: the standard quantum limit (metrological SQL, $1/\sqrt N$).
- §25.3 Entangled probes: the Heisenberg limit ($1/N$).
- §25.4 Decoherence, the no-go theorem, and the QEC restoration (uses `ch:qec`).
- §25.5 Outlook: dark matter at the Heisenberg limit.

### App. A — Auxiliary mathematical definitions
- Forms/inner products/norms; completeness/separability; dual
  space/operators/adjoint; tensor products
  (`def:sesquilinear`, `def:inner-product`, `def:dual-space`, `def:tensor-product`, …).

---

## Topic overlap audit

The manuscript treats several topics at more than one level of depth. In
almost every case this is **intentional pedagogical layering** — a
qualitative preview early, a rigorous treatment later — and the existing
cross-references are the right resolution (no consolidation needed).
Below, each multi-site topic is classified.

### A. Intentional layering — cross-referencing is sufficient (no action)

| Topic | Preview / applied site(s) | Primary (definition) | Status |
|---|---|---|---|
| Teleportation, CNOT, two-qubit gate, ebit | ch. 3 §3.4 (qualitative) | ch. 18 §18.3 `stmt:teleportation`; ch. 16 §16.3 (hardware gates) | ch. 3 now points to `stmt:teleportation`; clean |
| Dispersive shift / readout | ch. 16 §16.4 (hardware $\chi$); ch. 24 §24.3 (photon counting) | ch. 12 §12.1/§12.4 (`stmt:dispersive-H`, `stmt:dispersive-readout`) | ch. 16 cross-refs ch. 12 explicitly; clean |
| Decoherence / $T_1$, $T_\phi$, $T_2$ | ch. 3 §3.3 (kernel); ch. 17 §17.3–4 (pulse sequences, hardware) | ch. 5–6 (`stmt:lindblad`, `stmt:t1`, `stmt:tphi`) | theory vs experiment split; clean |
| Stabiliser / Clifford formalism | ch. 19 §19.3–5 (codes) | ch. 18 §18.5 `stmt:gottesman-knill` | ch. 19 cross-refs ch. 18; clean |
| Coherent states | ch. 19 §19.6 (cat codes) | ch. 10 §10.1 `stmt:coherent` | cross-ref; clean |
| Quadratures / vacuum noise | ch. 10, ch. 16, ch. 25 | ch. 9 §9.3 `stmt:quadratures` | cross-ref; clean |
| BCS gap / quasiparticles | ch. 17 §17.4 (poisoning); ch. 21 (detection) | ch. 13 §13.2–3 | "dual use" thread, cross-referenced; clean |
| Purcell effect | ch. 17, ch. 21, ch. 24 (mentions) | ch. 12 §12.3 `stmt:purcell` | cross-ref; clean |
| RWA | ch. 11, ch. 16, ch. 24 (uses) | ch. 4 §4.3 `stmt:rwa` | cross-ref; clean |

### B. Worth a decision — possible terminology clash / light overlap

1. **"Quantum limit" / "standard quantum limit" names three distinct
   concepts.** They are genuinely different physics, but share a name and
   could confuse a reader who meets them out of order:
   - ch. 9/10 — vacuum-noise / measurement quantum limit;
   - ch. 16 §16.5 — the *amplifier* quantum limit, added noise
     $n_{\rm add}\ge\tfrac12$ (Caves) (`stmt:parametric-amp`);
   - ch. 25 §25.2 — the *metrological* standard quantum limit,
     $1/\sqrt N$ scaling.
   *Recommendation:* keep all three (different topics); add one
   disambiguating sentence + cross-reference at the ch. 25 SQL definition
   noting it is distinct from the amplifier limit of ch. 16. **No content
   move.** — *needs your sign-off.*

2. **"Parity measurement" denotes two different parities.** ch. 19 §19.6
   uses *photon-number* parity (cat-code syndrome); ch. 21 §21.2 uses
   *quasiparticle/charge* parity (tunnelling). Different observables,
   same word. *Recommendation:* a half-sentence in whichever chapter the
   reader reaches second, distinguishing the two. **No content move.** —
   *needs your sign-off.*

### C. Genuine duplication to consolidate

None identified. The manuscript is disciplined about defining each result
once and cross-referencing it thereafter.
