# Ti*k*Z External Autocache Library

A LaTeX/Ti*k*Z library for caching and externalizing Ti*k*Z figures with automatic directory management.

## Features
- Externalizes Ti*k*Z figures using the ``external`` library to a specified output directory (default: `tmp/`).
- Maintains the source structure for temporary artifacts.
- Supports custom input extensions (e.g., `.tikz`).
- Handles multi-root project structures with nested figure paths.
- Preserves subcaption labels across multiple documents with correct counter numbering.
- Provides verbose output and cache cleaning capabilities.

## Requirements
- TeX Live 2025 or compatible LaTeX distribution.
- Packages: `tikz`.
- Ti*k*Z libraries: `external`.
- Compiler option: `-shell-escape` (for system calls like `mkdir`, `rm`, `del`).

## Installation
1. Download the ``-core.zip`` release.
2. Unpack texmf tree into your project directory.
3. Add to your ``latexmkrc`` configuration:
    ```perl
    # Move the compiled files (and synctex) to a separate directory
    $out_dir = 'tmp';
    $out2_dir = "build";

    # if there is a local texmf tree in this project directory, make it available
    ensure_path('TEXINPUTS', "./texmf/tex/latex//");
    ```
4. Add to your latex project:
    ```latex
    \usetikzlibrary{external,external-autocache}
    ```

## Configuration
Add to your LaTeX document:
```latex
\documentclass{article}
\usepackage{tikz}
\usetikzlibrary{external,external-autocache}

% setting parameters is optional
\tikzset{
  external-autocache/output dir = tmp,
  external-autocache/input extensions = {.tikz},
  external-autocache/verbose = true
}
\begin{document}
\begin{figure}
  \input{src/example-directory/equations.tikz}
  \caption{Control system responses}
  \label{fig:equations}
\end{figure}
\end{document}
```

### Configuration Options
- `external-autocache/output dir = <path>`: Set output directory (default: `tmp`).
- `external-autocache/input extensions = {<ext1>,<ext2>,...}`: Define input file extensions (default: `.tikz`).
- `external-autocache/verbose = true/false`: Enable/disable verbose logging.
- `external-autocache/clean~cache = <jobname>`: Clean cache for a job.

## Examples
The `example/` directory demonstrates:
- **Multi-root structure**: Both `main1.tex` and `main2.tex` reference `src/example-directory/equations.tikz`, a `pgfplots` groupplot with subcaptions.
- **Subcaption counters**: Labels `\subcap{pid}` and `\subcap{state}` resolve to different numbers (e.g., 1.1, 1.2 in `main1.tex`; 1.1, 1.2 in `main2.tex`) due to figure placement.
- **Library access**: The library is symlinked to `example/texmf/tex/latex/tikzlibraryexternal-autocache.code.tex`.

Run:
```bash
cd example
latexmk
```

Outputs: `tmp/main1/src/example-directory/equations.pdf`, `tmp/main2/src/example-directory/equations.pdf`.

## Troubleshooting
- **Error: `cannot create ... Directory nonexistent`**: Use `-shell-escape` and check permissions.
- **Symlink issues**: On Windows, enable `git config core.symlinks true` or copy `src/tikzlibraryexternal-autocache.code.tex` to `example/texmf/tex/latex/`.

## Development
- Use `.devcontainer/devcontainer.json` for a VSCode environment with TeX Live 2025.

## Note for Windows Users
The library is symlinked from `example/texmf/tex/latex/tikzlibraryexternal-autocache.code.tex` to `src/tikzlibraryexternal-autocache.code.tex`. Enable Git symlink support:
```bash
git config core.symlinks true
```
Alternatively, copy `src/tikzlibraryexternal-autocache.code.tex` to `example/texmf/tex/latex/`. Ensure Windows Developer Mode or administrator privileges for symlinks.
