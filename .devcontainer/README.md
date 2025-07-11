# LaTeX Devcontainer (v0.9.6-test02)

This is the core LaTeX devcontainer release, using a prebuilt Docker image.


<!-- BEGIN USAGE -->
## Usage
1. Download a release from GitHub:
   - Core: `latex-devcontainer-core-v0.9.6-test02.zip` (prebuilt image).
   - Source: `latex-devcontainer-source-v0.9.6-test02.zip` (local build).
   - Example: `latex-devcontainer-example-v0.9.6-test02.zip` (prebuilt image with demo).
2. Extract to your project:
   ```bash
   cd /path/to/your/project
   unzip ~/Downloads/latex-devcontainer-core-v0.9.6-test02.zip
   mv latex-devcontainer-core-v0.9.6-test02/.devcontainer .
   # For example release:
   unzip ~/Downloads/latex-devcontainer-example-v0.9.6-test02.zip
   mv latex-devcontainer-example-v0.9.6-test02/.devcontainer .
   mv latex-devcontainer-example-v0.9.6-test02/example .
   # Copy other dependencies as needed
   ```
3. Open in VS Code:
   ```bash
   code .
   # Reopen in Container
   ```
4. Compile LaTeX files using `Ctrl+Alt+B` in VS Code or:
   ```bash
   latexmk
   # configuration is read from latexmkrc
   ```
5. Split a PDF (using poppler-utils):
   ```bash
   pdfseparate build/main.pdf build/page-%d.pdf
   ```


<!-- BEGIN CONFIG -->
## Configuration Overrides
- Place per-project configuration files in your project directory below `.config/` to override defaults:
  - `.config/chktex-config.rc`: Overrides `~/.chktexrc`.
  - `.config/latexindent-config.yaml`: Overrides default latexindent config.
  - `.config/ohmyposh-theme.json`: Overrides default ohmyposh theme.
- Example:
  ```bash
  echo "VerbTeX {custom}" > .config/chktex-config.rc
  chktex -l .config/chktex-config.rc main.tex
  ```


<!-- BEGIN DEBUG -->
## Debugging
- **SSH Agent**: Ensure the SSH agent is running on the host (Windows/WSL2):
  ```bash
  # On WSL2
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_rsa
  # Verify
  ssh -T git@github.com
  ```
- **Git Configuration**: Verify Git configuration is passed through from the host:
  ```bash
  git config --global --list
  # Set if needed
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  ```
- **User/Permissions**: Check UID/GID in container:
  ```bash
  id dev
  # Should output: uid=1001(dev) gid=1001(dev)
  ```
- **Line Endings**: Ensure LF endings:
  ```bash
  git config --global core.autocrlf false
  file main.tex # Should show LF
  ```

