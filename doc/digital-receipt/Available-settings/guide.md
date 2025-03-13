# Instore App – available settings

**CashBoxId**

Identifies the cash box used in the application. This ID is crucial for linking the
application to the corresponding cash management system, ensuring accurate financial
transactions.

**Unpair CashBox**

Unpairs the current cash box from the app. This action is useful when switching to a
different cash box.

**Refresh Device Configuration**

Refreshes the device configuration settings. This allows the app to retrieve the latest
configurations from the backend, ensuring that all settings are up to date.

**Terminal ID Filter**

Allows filtering of terminal IDs for better management. This feature helps in scenarios
where multiple terminals are used, enabling users to quickly locate specific terminals.

**Operation Mode**

Select the operation mode:

- **Consumer** : Ideal for customer-facing interactions, focusing on sales
    transactions.
- **Merchant** : Designed for merchant-specific operations, managing inventory and
    sales data.
- **PSP (Payment Service Provider)** : Tailored for integration with payment service
    providers for transaction processing.

**Use Local Configuration**

Enables local configuration. When enabled, local settings will override backend
configurations, allowing for quick adjustments. If disabled, the app will use the
configurations retrieved from the backend.

---

**App Settings**

**Enable NFS**

Activates the NFC feature within the app. This setting is essential for near-field
communication for transactions, such as mobile payments.


**Enable Running in Foreground**

Allows the app to run as a foreground service, ensuring it remains active during use. This
is particularly important for continuous operations like payment processing, where the
app should not be interrupted.

---

**Printer Settings**

**Printers**

Select the printer to be used for printing tasks. This setting allows choosing between
multiple connected printers.

**Print Delay**

Specifies the delay time before printing begins. Adjusting this delay can help in
scenarios where multiple print jobs are queued or where timing is crucial for user
experience.

**Paper Width**

Configures the width of the paper for printing. This is important for ensuring that printed
receipts fit correctly on the selected paper type.

**Print Demo**

Initiates a demo print to test printer functionality. This feature is useful for verifying
printer connections and settings before proceeding with actual transactions.

**Enable Network Print Server**

Opens a network print server via port 9100 for printing over the network. This setting is
essential for businesses that require remote printing capabilities.

---

**Payment Settings**

**Hobex SoftPay Payment**

Enables local Hobex SoftPay payment functionality. This feature is necessary for
businesses using Hobex as their payment processing solution.

**GPTom SoftPay Payment**

Enables local GpTom SoftPay payment functionality. This setting is required for
integrating GpTom payment solutions into the app.


**GPTom DEV SoftPay Payment**

Enables local GpTom DEV SoftPay payment functionality. Useful for development and
testing environments that require GpTom payment processing.

**WPI SoftPay Payment**

Enables local WPI SoftPay payment functionality. This feature supports businesses that
utilize WPI for their payment processing needs.

**GPPay Payment**

Enables local GPPay payment functionality. This setting is critical for integrating GPPay
payment solutions into the app.

---

**Update Settings**

**Use Prerelease**

If enabled, all new versions are considered for updates, allowing users to access the
latest features and improvements before they are officially released.

**Check For Update**

Checks for available updates to the app. This ensures that users can easily keep the
application up to date with the latest features and security patches.

---

**Danger Zone**

**Factory Reset**

Resets the app to factory settings, erasing all configurations and data. This feature is
typically used for troubleshooting or when transferring the app to a new device.


