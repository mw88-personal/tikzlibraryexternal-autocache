# Ti*k*Z External Autocache Library (v{{version}})

A LaTeX/Ti*k*Z library for caching and externalizing Ti*k*Z figures with automatic directory management.

{{features}}

{{requirements}}

{{installation}}

## Configuration
Add to your LaTeX document:
```latex
\documentclass{article}
\usepackage{tikz}
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
\usetikzlibrary{external,external-autocache,groupplots}
\tikzexternalize
\tikzset{
  external-autocache/output~dir=tmp,
  external-autocache/input~extensions={.tikz},
  external-autocache/verbose=true
}
\begin{document}
\begin{figure}
  \input{src/subdirA/equations.tikz}
  \caption{Control system responses}
  \label{fig:equations}
\end{figure}
\end{document}
```

{{troubleshooting}}

{{windows}}

{{license}}

{{issues}}