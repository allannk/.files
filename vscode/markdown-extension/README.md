# Personal Markdown Preview Style

Build and install this local VS Code extension from PowerShell:

```powershell
cd "$HOME\.files\vscode\markdown-extension"
npm ci
npm run package
code --install-extension .\personal-markdown-preview-style-1.0.5.vsix --force
```

The VSIX filename follows the version in `package.json`; update the install command when you bump the version. Reload VS Code after installing. Changes to this source folder do not affect the installed extension until you package and install it again.