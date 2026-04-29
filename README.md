# Quantum 101

Lecture-note style LaTeX summary of quantum physics and quantum optics, with
focus on selected topics in superconducting circuits.

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

- [ ] System–bath models, Born–Markov approximation
- [ ] Lindblad master equation
- [ ] Relaxation and dephasing: $T_1$, $T_2$, $T_2^*$
- [ ] Input–output theory
- [ ] Quantum Zeno effect (measurement-induced freezing of dynamics)
- [ ] Stochastic master equation / quantum trajectories (optional)

### Part III — Quantum optics

- [ ] Quantization of the electromagnetic field
- [ ] Fock states and photon-number statistics
- [ ] Coherent states and their (over)completeness
- [ ] Squeezed states, displacement and squeeze operators
- [ ] Beam splitters and interferometry
- [ ] Atom–field interaction, dipole approximation
- [ ] Jaynes–Cummings model: dressed states, vacuum Rabi splitting
- [ ] Dispersive regime and dispersive shift $\chi$
- [ ] AC Stark shift (photon-number-dependent qubit frequency shift) and measurement-induced dephasing
- [ ] Cavity QED basics (strong, weak, bad-cavity limits)
- [ ] Purcell effect

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

### Part V — Quantum error correction (introduction)

- [ ] Why QEC: noise channels, no-cloning, the digitization theorem
- [ ] Repetition codes: bit-flip and phase-flip
- [ ] Shor and Steane codes (overview)
- [ ] Stabilizer formalism (overview)
- [ ] Surface code (overview)
- [ ] Bosonic codes in cQED: cat / GKP (overview, optional)

### Appendices (optional)

- [ ] Useful Gaussian integrals and operator identities (BCH, Hadamard lemma)
- [ ] Notation and conventions
- [ ] Bibliography / suggested reading
