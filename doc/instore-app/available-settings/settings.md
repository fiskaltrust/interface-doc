---
slug: /poscreators/middleware-doc/instore-app/available-settings
title: 'Available settings'
---

## InStore App – Available Settings (v1.2.6)

:::info Important

All settings and options described here apply **only** to version **1.2.6** of the InStoreApp.  
If you are using an older version, some settings may differ or may not be available at all.

:::

### DeviceId
Shows the unique identifier of this device. Quote this ID when contacting support or managing a fleet. *(Read‑only.)*

### DeviceType
Displays the device model/type (e.g., terminal vendor and model). Useful to identify hardware-specific behavior. *(Read‑only.)*

### IP Address
Shows the current IP address of the device on your network. Use it when setting up network printing or firewall rules. *(Read‑only.)*

---

## Base settings

### CashBoxId
The CashBox the app is paired with. It links the app to the correct fiscal/payment configuration.

### Unpair CashBox
Disconnects the current CashBox to pair another one (e.g., when moving the device to a new store).

### Refresh DeviceConfiguration
Pulls the latest configuration from the backend and applies it on the device.

### End App
Closes the app gracefully and persists configuration changes.  
*Note:* Closing during an active process (e.g., printing) may interrupt that process, finish ongoing tasks first.

### Terminal ID Filter
Filters receipts and data for a specific terminal within the CashBox.  
For advanced multi-terminal options, see [Multiterminal Settings](https://docs.fiskaltrust.eu/docs/poscreators/middleware-doc/instore-app)

### Operation Mode
Defines which features are available in the UI. Some options and sections appear or hide based on this selection:

- **Consumer** – Customer-facing (receipt display/printing). Allows changing **Print Delay**, which is not available in Merchant mode.
- **Merchant** – Merchant/admin. Cannot change Print Delay, but offers extra gestures:  
  - Pull **down** on the QR code screen to show the receipt.  
  - Pull **up** to reveal action buttons.


### Use local configuration

If enabled, local device settings override the backend configuration.

If disabled, the app follows centrally managed (backend) settings.

:::info Note

Currently, this setting can only be configured by internal staff via the backend. Customers do not yet have the ability to change this setting themselves.

:::


Once the setting is disabled and the app is restarted, the configuration stored in the backend will be loaded into the app.

This configuration can be applied:
- **Per device**: A specific configuration for each individual device.
- **Per cashbox**: A shared configuration for all devices connected to a particular cashbox.


---

## App settings

### Enable NFC
Enables **receipt transmission via NFC**.  
**Preview:** This feature currently works **only on fiskaltrust‑provided devices**.

### Enable running in Foreground
Runs the app as a **foreground service** so it stays active for continuous use (e.g., receipt and payment flows).  
When this is enabled, the app **auto‑starts after device boot** so staff do not need to launch it manually.

---

## Printer settings

:::info Note

Some options depend on the selected mode.

:::

#### Printers
Shows all available printers (USB, Bluetooth, or Network). Select the one you want to use.

#### Print Delay
Delay before printing starts (0–99 seconds).  
**Available only in Consumer mode.**

#### Paper width
Set the receipt width: **48 mm**, **72 mm**, or **80 mm**.

#### Print Demo
Prints a test receipt to check basic printer functionality (not the full layout).

#### Enable Network Print Server
Opens a network print server on port **9100** so other systems can print through this device.

---

## Payment settings

:::info Note

The UI first asks you to pick a **Payment** method. Depending on the method, additional fields can appear.

:::

#### Payment
Select the payment provider to use on this device (e.g., **Hobex ECR**, **Softpay.io**, **Viva Wallet**, etc.).  
After selection, provider‑specific options appear as needed.

##### Hobex ECR (example of provider‑specific fields)
- **Hobex ECR TerminalId** – The terminal ID assigned by Hobex.
- **Hobex ECR Password** – The password for ECR integration.
- **Hobex ECR Host** – Hostname or IP of the ECR endpoint.
- **Hobex ECR Port** – TCP port of the ECR endpoint.
- **Test Communication** – Checks connectivity with the configured ECR endpoint before going live.

---

## Middleware

### Middleware URL
The endpoint the app uses to communicate with the fiskaltrust Middleware.

### Start Middleware
Starts the connection to the Middleware using the configured URL.

### Stop Middleware
Stops the live connection (use before changing URL, switching networks, or during maintenance).

---

## Update settings

### Use prerelease
If enabled, the updater considers **prerelease** builds in addition to stable releases (for early access and testing).

### Check For Update
Runs an update check immediately and offers the newest version available for your selected track.

---

## Danger Zone

### Factory reset
Restores the app to factory defaults and clears all local data/configuration.  
Use this when giving the device to a different store/location or if a clean setup is needed.

---

## Best practices

- Keep **Use local configuration** **off** if you manage settings centrally—this prevents drift from backend policies.
- After changing **Middleware URL**, tap **Stop Middleware** → update the URL → **Start Middleware**.
- For **Network Print Server**, consider setting a **static IP** or DHCP reservation; otherwise clients can lose the printer when the IP changes.
- For **Hobex ECR**, use **Test Communication** before going live.
