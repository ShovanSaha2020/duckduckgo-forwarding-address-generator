# DuckDuckGo Email Forwarding Address Generator

This Tcl/Tk application generates the special recipient address used to send a new email from a personal Duck Address without revealing your real email address.

## Features

- Generate forwarding addresses using your personal Duck Address.
- Validate the Duck Address and recipient address.
- Protect your real email identity when sending messages.
- Simple graphical interface.

## How It Works

1. Enter your personal Duck Address, such as `jane@duck.com`.
2. Enter the recipient's email address, such as `brian@gmail.com`.
3. The application generates a special recipient address.
4. Send your email to that address from the forwarding email account connected to DuckDuckGo Email Protection.

For the example above, the generated address is:

```text
brian_at_gmail.com_jane@duck.com
```

The recipient's `@` is replaced with `_at_`, and the username from the personal Duck Address is appended before the final `@duck.com`.

See the [DuckDuckGo documentation](https://duckduckgo.com/duckduckgo-help-pages/email-protection/duck-addresses/how-do-i-compose-a-new-email/) for the official format.

