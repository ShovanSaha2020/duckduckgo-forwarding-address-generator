# DuckDuckGo Email Forwarding Address Generator

A small Tcl/Tk application for generating the special recipient address used to send a new email from a personal Duck Address.

## Requirements

- Ubuntu or another Debian-based Linux distribution with `apt`
- A graphical session:
  - Ubuntu Desktop needs a working desktop display.
  - WSL2 needs WSLg, or an X server configured for GUI applications.

## Install and start

From the project directory, run:

```bash
bash start.sh
```

The launcher checks for Tcl/Tk and installs it with Ubuntu's `apt` command when it is missing:

```bash
sudo apt update
sudo apt install -y tk
```

The `-y` flag confirms the package installation automatically. The launcher may ask for your administrator password and needs an internet connection the first time.

After Tcl/Tk is installed, the same command starts the application. Users do not need to run `duck.tcl` directly.

## Use the application

1. Enter your personal Duck Address, such as `jane@duck.com`.
2. Enter the recipient's email address, such as `brian@gmail.com`.
3. Select **Generate**.
4. Send your email to the generated address from the forwarding email account connected to DuckDuckGo Email Protection.

For the example above, the generated address is:

```text
brian_at_gmail.com_jane@duck.com
```

The recipient's `@` is replaced with `_at_`, and the username from the personal Duck Address is appended before the final `@duck.com`.

## Troubleshooting

### `apt: command not found`

This launcher supports Debian/Ubuntu systems. Install Tcl/Tk using your distribution's package manager, then run:

```bash
wish duck.tcl
```

### The GUI does not open in WSL

WSL needs GUI support. WSL2 with WSLg provides this automatically on supported Windows versions. Otherwise, run the project from Ubuntu Desktop or configure an X server and its `DISPLAY` environment variable.

## Official format

See the [DuckDuckGo documentation](https://duckduckgo.com/duckduckgo-help-pages/email-protection/duck-addresses/how-do-i-compose-a-new-email/) for the official address format.

