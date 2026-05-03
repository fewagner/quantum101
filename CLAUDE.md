# CLAUDE.md

Working context for Claude Code sessions on this repository. Read this first.

## What this is

LaTeX notes on quantum mechanics, quantum optics, and superconducting
circuits, by Felix Wagner. Self-styled as
"Primer, Notes, Exercises" (the eyebrow on the title page) ---
treat that phrasing as canonical and avoid the term "lecture notes".
The subtitle is "Mechanics, Optics, Circuits, Sensing".
Six parts plus an appendix:

| Part | Title | Status |
|---|---|---|
| I | Quantum mechanics foundations | drafted (chs. 1–4) |
| II | Open quantum systems | not started |
| III | Quantum optics | not started |
| IV | Superconducting circuits | not started |
| V | Quantum information processing | not started |
| VI | Quantum sensing | first chapter (dark-matter search) drafted; four mechanism chapters are placeholders |
| App. A | Auxiliary mathematical definitions | drafted |

The full topic list lives in `README.md`. Treat it as the source of truth for
"what should be in here eventually" and prune/extend with the user as the
project evolves.

## Pedagogical convention (load-bearing)

**Every topic** is presented in four blocks:

1. **Phenomenon** — what is observed, in words; motivation.
2. **Statement** — the result, formally (theorem / proposition / postulate /
   definition / statement).
3. **Derivation** — the math.
4. **Example / application** — a concrete case (often forward-pointing to a
   later chapter where the result is used).

Each chapter has:
- an unheaded overview / motivation paragraph as the very first text after
  the chapter title (no "Chapter overview" subheading; the chapter title
  is the heading);
- `\paragraph{Transition.}` blocks between sections (mini-recap + outlook);
- at the end: a brief unheaded summary-and-outlook prose block (a few
  sentences recapping the chapter, then a transition to the next), then a
  `\clearpage`, then the boxed `\begin{chaptersummary}...\end{chaptersummary}`
  with the take-home formulas. The takeaway box always starts on a new page;
- after the takeaway box, an `\section*{Exercises}` block with ten worked
  exercises.

These structural blocks are non-optional — the user has explicitly asked for
them more than once.

## Notation conventions

- `\hbar` is **always explicit**. No natural-units convention. Hamiltonians
  built from angular frequencies read `\hbar\omega ...`.
- **All operators wear a hat**: `\hat\sigma_x`, `\hat a`, `\hat a^\dagger`,
  `\hat U`, etc. The custom command `\op{X}` expands to `\hat{X}` and is the
  preferred form for multi-letter operator names (`\op{H}`, `\op{\rho}`).
- The identity is `\id`, rendered as `\mathbf{1}` (the user does not want the
  blackboard `\mathbb{1}`).
- Pauli convention: `\hat\sigma_z \ket{0} = +\ket{0}`, so `\ket{0}` is ground.
- Ladder commutator: `[\hat a, \hat a^\dagger] = \id`.
- Hilbert space: `\hilbert` (= `\mathcal H`).
- Sets: `\C, \R, \Z, \N` are defined in `preamble.tex`.

The "Notation and conventions" section in `introduction.tex` is the canonical
statement of this — keep it in sync if conventions change.

## Repository layout

```
main.tex                # master, includes custom title page
preamble.tex            # packages, colours, mdframed boxes, custom shortcuts
abstract.tex            # frontmatter abstract
introduction.tex        # frontmatter introduction
chapters/01..04         # Part I (drafted)
appendices/A_*.tex      # Appendix A (drafted)
bibliography.bib        # empty for now (see "Build" gotcha below)
Makefile                # local build via latexmk
.github/workflows/build-pdf.yml   # CI that publishes to GitHub Pages
index.html              # landing page that embeds the PDF
README.md               # public-facing scope, TODO list of topics
```

## Build / preview

- CI: every push runs `xu-cheng/latex-action@v3` (TeX Live container) and
  deploys `_site/{main.pdf,index.html}` via `actions/deploy-pages@v4`.
- Preview URL: <https://fewagner.github.io/quantum101/>.
- **Forward `\cref`s into Parts II–V are expected to produce *warnings***
  (undefined reference). They are not errors and do not break the build.

### Build gotchas to avoid (each has cost us a CI run)

- **`physics` package collisions.** `physics` defines `\op`, `\Tr`, plus a
  long list of others. Every custom shortcut in `preamble.tex` is preceded by
  `\let\name\undefined` so redefinition is unconditional. Keep this pattern
  for any new shortcut.
- **Empty bibliography kills bibtex.** With no `\cite{...}` calls and an
  empty `bibliography.bib`, bibtex exits non-zero and latexmk aborts. The
  `\bibliographystyle{plain}` and `\bibliography{bibliography}` lines in
  `main.tex` were originally commented out for this reason. They were
  re-enabled in commit "On the nature of quantum randomness" once the
  first batch of citations was added; keep them on.
- **Undefined control sequences abort pdflatex.** Always grep for `\Foo` if
  you introduce a new symbol; if it isn't defined, no `.aux` files are
  written for any chapter after the one with the error, and you'll see
  spurious "undefined reference" warnings everywhere.

## Theorem environments

All defined in `preamble.tex` with `\newtheorem` (counter shared per chapter)
and visually wrapped via `mdframed`.

| Environment(s) | Box style |
|---|---|
| `theorem`, `proposition`, `lemma`, `corollary`, `statement`, `postulate` | thick blue left rule + light blue background |
| `definition` | teal rule + light teal background |
| `example`, `application` | amber rule + light amber background |
| `phenomenon`, `intuition`, `remark`, `note` (unnumbered) | thin purple rule + light purple background |

Use `statement` for results that are not formal theorems
(picture transformations, RWA, etc.). Use `postulate` for axioms of QM.

## Visual design

Restrained four-colour palette defined at the top of `preamble.tex`
(`primary`, `accent`, `example`, `remark`). Sans-serif headings via
`titlesec`. Run-in `\paragraph` headings in teal terminated with a period.
Custom title page in `main.tex`. **Do not** introduce additional colours
without checking — the document should keep reading as a quiet book.

## Working agreements

- Branch: `claude/setup-quantum-notes-repo-QIEUz`. Never push to `main`.
- After each substantive edit: commit + push so the user can see the
  rendered PDF on Pages.
- Commit messages: short subject line + 1–3 sentence body explaining the
  *why* of the change, not just the what.
- Cross-check before introducing a term: every new term must already have
  been defined in an earlier chapter or section, or you must define it
  inline. (The user has flagged this multiple times.)
- When the user asks for a clarification or rewrite, read the surrounding
  passages first — pedagogy depends on what is and isn't yet defined.
- Trust the user's judgement on scope. They prefer pedagogical depth over
  breadth.

## Glossary (where each term is introduced)

| Term | Defined at | File / section |
|---|---|---|
| Hilbert space | `def:hilbert` | ch. 1 §1.1 |
| Hermitian / unitary / projector | `def:operator-types` | ch. 1 §1.2 |
| Position / momentum operators | `def:position-momentum` | ch. 1 §1.4 |
| Schrödinger / Heisenberg / interaction pictures | `stmt:pictures` | ch. 1 §1.5 |
| Quantum randomness / interpretations (foundational discussion) | `sec:quantum-randomness` | ch. 1 §1.3 |
| Qubit | `def:qubit` | ch. 2 §2.2 |
| Pauli operators | `def:pauli` | ch. 2 §2.2 |
| Density matrix (single-qubit) and purity | `def:density-tls` | ch. 2 §2.3 |
| Density matrix (general) | `def:density` | ch. 3 §3.2 |
| Partial trace | `def:partial-trace` | ch. 3 §3.3 |
| Bell states | `ex:bell-states` | ch. 3 §3.1 |
| Decoherence (kernel via partial trace) | `ex:decoherence-by-partial-trace` | ch. 3 §3.3 |
| Pure dephasing (informally) | (within decoherence example) | ch. 3 §3.3 |
| Ebit | (worked example) | ch. 3 §3.4 |
| Quantum teleportation (qualitative) | (within ebit example) | ch. 3 §3.4 |
| CNOT gate (qualitative) | (within ebit example) | ch. 3 §3.4 |
| Two-qubit gate (qualitative) | (within ebit example) | ch. 3 §3.4 |
| Rotating-wave approximation | `stmt:rwa` | ch. 4 §4.3 |
| Sesquilinear, conjugate-symmetric, positive definite | `def:sesquilinear,…` | App. A |
| Inner product, norm, Cauchy completeness, separability | `def:inner-product,…` | App. A |
| Dual space, linear/bounded operator, adjoint | `def:dual-space,…` | App. A |
| Tensor product (Hilbert spaces) | `def:tensor-product` | App. A |

When introducing new terms in future chapters, **append to this table**.

## Open todos

- Part I done; Parts II–V outlined in `README.md` only.
- Bibliography active (53 entries; foundations + decoherence +
  interpretations + superdeterminism + Part VI dark-matter
  references including Lewin-Smith / Helm form factor /
  Essig-Mardon-Volansky / Knapen-Kozaczuk-Lin (DarkELF) /
  Feldman-Cousins / Cowan-Cranmer-Gross-Vitells profile-likelihood
  + cQED textbooks/reviews and historical-milestone papers cited
  in the introduction; one entry on magic-state distillation for
  Part V). Add new entries thematically grouped in
  `bibliography.bib` as future chapters acquire citations.
- No figures yet. `figures/` is empty; consider TikZ for diagrams when
  needed (Bloch sphere, circuit diagrams, level diagrams, …).
