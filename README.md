# Quantum 101 — Primer, Synthesis, Reflections

Primer-style LaTeX summary of quantum physics and quantum optics, with
focus on selected topics in superconducting circuits, by Felix Wagner.

## Pedagogical style

Each topic follows a four-step structure:

1. **Phenomenon** — describe what is observed and why it matters, in words.
2. **Statement** — state the result formally (theorem / proposition / postulate
   / definition).
3. **Derivation** — work through the math.
4. **Examples / use cases** — where it shows up (need not be fully worked out;
   a pointer to the application is fine).

Theorem-like environments for these are predefined in `preamble.tex`:
`phenomenon`, `theorem`, `proposition`, `definition`, `postulate`, `example`,
`application`, `remark`.

## Repository structure

```
quantum101/
├── main.tex              # master document, includes all chapters
├── preamble.tex          # packages, theorem environments, macros
├── bibliography.bib      # BibTeX references
├── Makefile              # `make` to build, `make watch` for live preview
├── chapters/             # one .tex file per chapter
└── figures/              # figures, TikZ snippets, image assets
```

## Building

```bash
make            # full build (pdflatex + bibtex + 2x pdflatex)
make watch      # latexmk continuous build (recommended while writing)
make clean      # remove aux files
```

Requires a TeX Live distribution with the `physics`, `tikz`/`quantikz`,
`siunitx`, `cleveref`, and `hyperref` packages.

## Online preview

Every push to this repository triggers a GitHub Actions workflow
(`.github/workflows/build-pdf.yml`) that compiles `main.tex` and
publishes the resulting PDF to GitHub Pages, embedded in
`index.html`.

**One-time setup** (repository owner only):

1. Open *Settings → Pages* on the GitHub repo.
2. Under **Build and deployment → Source**, choose **GitHub Actions**.
3. Push any change (or re-run the latest workflow). Once the deploy
   job succeeds, the PDF is available at
   `https://<user>.github.io/quantum101/` (with a "Download PDF"
   link), and the raw file at `https://<user>.github.io/quantum101/main.pdf`.

Build status and the deploy URL are visible under the *Actions* tab.

---

## TODO — Topics to cover

This is a **draft** list of suggested topics; review and prune/extend as
needed. Each `[ ]` becomes a section or chapter.

### Part I — Quantum mechanics foundations

- [ ] Postulates of quantum mechanics (states, observables, measurement, time evolution)
- [ ] Hilbert spaces and Dirac (bra-ket) notation
- [ ] Operators: Hermitian, unitary, projectors; spectral theorem
- [ ] Commutators, uncertainty principle
- [ ] Schrödinger vs. Heisenberg vs. interaction picture
- [ ] Quantum harmonic oscillator and ladder operators
- [ ] Two-level systems: Pauli matrices, Bloch sphere, Rabi oscillations
- [ ] Density matrices, pure vs. mixed states, partial trace
- [ ] Composite systems, tensor products, entanglement
- [ ] Time-dependent perturbation theory and Fermi's golden rule
- [ ] Rotating-wave approximation (RWA)

### Part II — Open quantum systems

- [x] System–bath models, Born–Markov approximation
- [x] Lindblad master equation
- [x] Relaxation and dephasing: $T_1$, $T_2$, $T_2^*$
- [x] Input–output theory
- [x] Quantum Zeno effect (measurement-induced freezing of dynamics)
- [x] Stochastic master equation / quantum trajectories

### Part III — Quantum optics

- [x] Quantization of the electromagnetic field
- [x] Fock states and photon-number statistics
- [x] Coherent states and their (over)completeness
- [x] Squeezed states, displacement and squeeze operators
- [x] Beam splitters and interferometry
- [x] Atom–field interaction, dipole approximation
- [x] Jaynes–Cummings model: dressed states, vacuum Rabi splitting
- [x] Dispersive regime and dispersive shift $\chi$
- [x] AC Stark shift (photon-number-dependent qubit frequency shift) and measurement-induced dephasing
- [x] Cavity QED basics (strong, weak, bad-cavity limits)
- [x] Purcell effect

### Part IV — Superconducting circuits

- [ ] DiVincenzo criteria for a quantum computer
- [ ] Superconductivity primer: BCS ground state, Bogoliubov quasiparticles
- [ ] Lumped-element circuit quantization (node flux / charge)
- [ ] LC oscillator as a quantum harmonic oscillator
- [ ] Josephson junctions: current–phase and voltage–phase relations, Josephson energy
- [ ] Josephson effects: DC effect, AC effect, inverse AC effect (Shapiro steps)
- [ ] Cooper pair box and charge qubit
- [ ] Transmon qubit: anharmonicity, charge-noise insensitivity
- [ ] Flux qubit and fluxonium (overview)
- [ ] Capacitive and inductive coupling between elements
- [ ] Qubit–resonator coupling and dispersive readout
- [ ] Drive Hamiltonians and single-qubit gates
- [ ] Parametric / mixing processes: three- and four-wave mixing in Josephson nonlinearities
      (e.g., two resonator modes + drive + qubit as a four-wave-mixing example)
- [ ] Two-qubit gates: cross-resonance, iSWAP, CZ (overview)
- [ ] Decoherence channels in cQED hardware (incl. quasiparticle poisoning)
- [ ] Parametric amplifiers and quantum-limited readout (optional)

#### Experimental basics (qubit calibration)

- [ ] Resonator spectroscopy ($S_{21}$ vs. drive frequency; bare vs. dressed cavity)
- [ ] Two-tone (drive) spectroscopy of the qubit
- [ ] Rabi experiment: drive amplitude → $\pi$-pulse calibration
- [ ] Ramsey experiment: detuning and $T_2^*$ measurement
- [ ] Echo / CPMG sequences for $T_2$ (optional)
- [ ] $T_1$ measurement (optional)

### Part V — Quantum information processing

A general primer that progresses from the language of quantum
computing into quantum error correction. Topics in order:

- [ ] Quantum gates and the universal gate set; gate notation and
      diagrammatic conventions for circuit diagrams
- [ ] Quantum teleportation, fully worked
- [ ] Magic states and stabiliser-vs-non-stabiliser dichotomy
- [ ] Notes on quantum cryptography (BB84, E91) and quantum
      communication (no-cloning, dense coding)
- [ ] Why QEC: noise channels, no-cloning, the digitization theorem
- [ ] Repetition codes: bit-flip and phase-flip
- [ ] Shor and Steane codes (overview)
- [ ] Stabiliser formalism
- [ ] Surface code (overview)
- [ ] Bosonic codes in cQED: cat / GKP (overview, optional)

### Part VI — Quantum sensing

Six chapters total (all drafted):

- **Experimental search for dark matter** (`chapters/15_dark_matter_search.tex`).
  Detector-agnostic walk-through of both detection channels:
  fermion-like DM via elastic recoil and bosonic DM via absorption.
  Pipeline: model parameters → predicted in-detector spectrum →
  measured spectrum → statistical limit on the model parameter
  (Poisson + profile likelihood). Cross-references the four
  mechanism chapters below.
- **Superconducting sensors and quasiparticle-based detection**
  (`chapters/16_superconducting_qp_detection.tex`). Cooper-pair
  breaking by an athermal phonon above $2\Delta$, read out by a TES
  or KID. Recoil channel.
- **Qubit antenna modes and infrared absorption**
  (`chapters/17_qubit_antenna.tex`). Direct IR/THz photon absorption
  via the qubit's antenna modes; sensitive to dark photons with
  $m_{A'}\geq 2\Delta/c^2$. Absorption channel.
- **Phonon-qubit coupling via piezoelectricity**
  (`chapters/18_phonon_qubit_piezoelectric.tex`). Single-phonon
  detection on AlN/GaAs substrates. Recoil channel.
- **Cavity microwave-photon counting**
  (`chapters/19_microwave_absorption.tex`). Single-microwave-photon
  haloscope front end via dispersive photon counting. Absorption
  channel.
- **Coherent multi-qubit sensing and the Heisenberg limit**
  (`chapters/20_coherent_multiqubit.tex`). Entanglement-enhanced
  sensing: from the standard quantum limit of $N$ independent probes
  to the Heisenberg limit of GHZ-correlated qubits.

### Appendices (optional)

- [ ] Useful Gaussian integrals and operator identities (BCH, Hadamard lemma)
- [ ] Notation and conventions
- [ ] Bibliography / suggested reading
