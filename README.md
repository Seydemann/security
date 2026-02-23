# applied-security

Hands-on security and systems administration work — DFIR investigations, network scanning methodology, and Linux fundamentals.

## Structure

### `dfir-sherlocks/`

Digital forensics challenge documentation from HackTheBox Sherlock scenarios. Each investigation is reconstructed as an executable Google Colab notebook, preserving the investigative methodology. Local triage with VisiData for exploratory analysis, then translated into Python notebooks with interactive tables.

- **BFT** — MFT forensics (file system timeline analysis)
- **Brutus** — Authentication log analysis (session/login tracking)
- **Unit42** — Windows event log investigation (Sysmon, security events)
- **In-Progress/** — Active investigations (Meerkat, logjammer)
- **notebooks/** — Published Colab notebooks for completed challenges

### `nmap-compendium/`

Structured Nmap reference compiled as LaTeX documents, covering TCP/UDP host discovery, basic port scanning, and aggressive scanning techniques. 26 diagrams illustrating scan mechanics.

```bash
cd nmap-compendium && devenv shell
compile  # builds the combined PDF
```

### `linux-admin/`

Linux system administration lab notebooks covering system checking, kernel management, package management, and disk operations.
