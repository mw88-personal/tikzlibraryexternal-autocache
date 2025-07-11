# Ti*k*Z External Autocache Library

A LaTeX/Ti*k*Z library for caching and externalizing Ti*k*Z figures with automatic directory management.

<!-- BEGIN FEATURES -->
## Features
- Externalizes Ti*k*Z figures using the `external` library to a specified output directory (default: `tmp/`).
- Maintains the source structure for temporary artifacts.
- Supports custom input extensions (e.g., `.tikz`).
- Handles multi-root project structures with nested figure paths.
- Preserves subcaption labels across multiple documents with correct counter numbering.
- Provides verbose output and cache cleaning capabilities.
<!-- END FEATURES -->

<!-- BEGIN REQUIREMENTS -->
## Requirements
- TeX Live 2025 or compatible LaTeX distribution.
- Packages: `tikz`, `pgfplots`, `subcaption`.
- Ti*k*Z libraries: `external`.
- Compiler option: `-shell-escape` (for system calls like `mkdir`, `rm`, `del`).
<!-- END REQUIREMENTS -->

<!-- BEGIN INSTALLATION -->
## Installation
1. Download the latest release:
   - [Core Release](https://github.com/mw88-personal/tikzexternal-autocache/releases/latest/download/tikzexternal-autocache-core.zip): Library only.
   - [Example Release](https://github.com/mw88-personal/tikzexternal-autocache/releases/latest/download/tikzexternal-autocache-example.zip): Includes example files.
   - For specific versions, visit [Releases](https://github.com/mw88-personal/tikzexternal-autocache/releases).
2. Unpack the ZIP into your project directory:
   ```bash
   unzip tikzexternal-autocache-core.zip
   mv tikzexternal-autocache-core-{{TAG}}/* .
   ```
3. Add to your `latexmkrc` configuration (create if not present):
   ```perl
   $out_dir = 'tmp';
   $out2_dir = 'build';
   ensure_path('TEXINPUTS', './texmf/tex/latex//');
   ```
4. Add to your LaTeX document:
   ```latex
   \usetikzlibrary{external,external-autocache}
   ```
<!-- END INSTALLATION -->

<!-- BEGIN CONFIG -->
## Configuration
Add to your LaTeX document:
```latex
% Optional settings
\tikzset{
  external-autocache/output dir = tmp,
  external-autocache/input extensions = {.tikz},
  external-autocache/verbose = true
}

```

### Configuration Options
- `external-autocache/output dir = <path>`: Set output directory (default: `tmp`).
- `external-autocache/input extensions = {<ext1>,<ext2>,...}`: Define input file extensions (default: `.tikz`).
- `external-autocache/verbose = true/false`: Enable/disable verbose logging.
- `external-autocache/clean~cache = <jobname>`: Clean cache for a job.
<!-- END CONFIG -->

<!-- BEGIN EXAMPLES -->
## Examples
The `example/` directory includes:
- `main1.tex` and `main2.tex`: Demonstrate referencing `src/example-directory/equations.tikz` with subcaptions.
- Example usage in `main1.tex`:
  ```latex
  \documentclass{article}
  \usepackage{tikz,pgfplots,subcaption}
  \usetikzlibrary{external,external-autocache}
  \begin{document}
  \begin{figure}
    \input{src/example-directory/equations.tikz}
    \caption{Control system responses}
    \label{fig:equations}
  \end{figure}
  \end{document}
  ```
Run:
```bash
cd example
latexmk -r latexmkrc
```
Outputs: `tmp/main1/src/example-directory/equations.pdf`, `tmp/main2/src/example-directory/equations.pdf`.
<!-- END EXAMPLES -->

<!-- BEGIN TROUBLESHOOTING -->
## Troubleshooting
- **Error: `cannot create ... Directory nonexistent`**: Ensure `-shell-escape` is enabled (`latexmk -pdf -shell-escape`) and check directory permissions.
- **Missing library**: Verify `texmf/tex/latex/tikzlibraryexternal-autocache.code.tex` is in `TEXINPUTS`.
- **Subcaption issues**: Ensure `\usepackage{subcaption}` is included before `\usetikzlibrary{external-autocache}`.
<!-- END TROUBLESHOOTING -->

<!-- BEGIN DEVELOPMENT -->
## Development
Use the provided `.devcontainer/` for a VS Code environment with TeX Live 2025. Ensure it matches the latest [LaTeX Devcontainer core release](https://github.com/mw88-personal/devcontainer-latex/releases/latest/download/latex-devcontainer-core.zip):
```bash
unzip latex-devcontainer-core.zip
mv latex-devcontainer-core-{{TAG}}/.devcontainer .
```
<!-- END DEVELOPMENT -->

<!-- BEGIN WINDOWS -->
## Note for Windows Users
The library is symlinked in `example/texmf/tex/latex/tikzlibraryexternal-autocache.code.tex`. To enable symlinks:
```bash
git config core.symlinks true
```
Alternatively, copy the library:
```bash
cp src/tikzlibraryexternal-autocache.code.tex example/texmf/tex/latex/
```
Ensure Windows Developer Mode or administrator privileges for symlinks.
<!-- END WINDOWS -->

<!-- BEGIN LICENSE -->
## License
[MIT License](LICENSE)
<!-- END LICENSE -->