---
slug: /poscreators/middleware-doc/instore-app/printer-guide
title: 'Printer Guide'
---


# InStore App - Printer Setup Guide

**Introduction**

This guide will walk you through the process of setting up and configuring a printer with
the **fiskaltrust InStore App**. Whether you are using a Bluetooth, ESC POS Network printing, or USB printer,
follow the instructions carefully to ensure your printer works seamlessly with the app.

**Note:** Before you can access the settings to configure your printer, make sure that you have the **fiskaltrust InStore App** installed on your device. To access the settings:

1. Open the **fiskaltrust InStore App**.
2. Swipe right to navigate to the main menu.
3. Select the **Settings** category to proceed with configuring your printer.
4. In the **Settings** section, scroll down to find **Printer Settings**. All the printing-
    related configurations, including printer setup, delay, paper width, and test
    options, are located here.

---

**1. Printer Setup**

**Steps to Set Up Your Printer**

Follow the steps below to properly connect and configure your printer with the
fiskaltrust InStore App.

**1.1 Connect the Printer**

- **Bluetooth Printers** :
    1. Ensure Bluetooth is enabled on your device.
    2. Pair your device with the Bluetooth printer. This can typically be done from your device's Bluetooth settings.
    3. Ensure that the printer is within range and is powered on.
- **ESC POS Network Printing** :
    1. Ensure that both your printer and device are connected to the **same network** (Wi-Fi or LAN).
    2. Note down the printer's IP address and port number. You can find this information
       through the printer's display or by printing a configuration page (refer to the
       printer's manual for instructions).
    3. You will need to enter these details (IP address and port) in the InStore App settings.


- **USB Printers** :
    1. Connect the printer directly to your device using a USB cable.
    2. Ensure that your device recognizes the printer as a connected peripheral.

**1.2 Install Drivers (If Required)**

Some printers may require specific drivers or software to function correctly with your
device. If prompted, follow these steps:

1. Download the required drivers from the **printer manufacturer's website** or the
    **app store** (if applicable).
2. Install the driver on your device following the on-screen instructions.

**1.3 Configure Printer in fiskaltrust InStore App**

Once the printer is physically connected and recognized by your device, you will need to
configure it within the fiskaltrust InStore App.

1. Open the **fiskaltrust InStore App** on your device.
2. Navigate to **Settings** > **Printer Settings**.
3. Scroll down to find the **Printer Settings** section and click on **Printers** to open the list of available printer options.
4. Select the type of printer you want to use from the list.
5. If you select **ESC POS Network Printer** which allows printing via the local network (Wi-Fi/LAN), you will need to manually enter the printer's **IP address** and **port number**:
    - **IP Address**: Enter the IP address of your network printer (e.g., 192.168.1.100). You can find this information in your printer's network settings or by printing a network configuration page.
    - **Port**: Enter the port number used by your printer (typically 9100 for most network printers, but check your printer's documentation for the correct port).

---

**2. Supported Printer Types**


The fiskaltrust InStore App supports the following printer types:
- **External printers** connected to the InStore App via Bluetooth, USB cable or the local Wi-Fi or Ethernet network.
- **Device internal printers** which have special integration but sometimes also show up as USB or Bluetooth printers similar to the external printers. Please check the supported device list to get an understanding which internal printers are supported.

**Note:** Ensure your printer is compatible with the fiskaltrust InStore App before starting
the setup process. If you are unsure, please refer to your printer's documentation.

**3. Testing Printer Functionality**

Once your printer is set up, it's essential to test its functionality to ensure everything is
working correctly.

**3.1 Test Print**


Follow these steps to test your printer:

1. Open the **fiskaltrust InStore App** and navigate to **Settings** > **Printer Settings**.
2. Under the **Printer Settings** section, scroll down and click on **Print Demo**.
3. Ensure your printer is selected as the default printer in the app and that it is
    properly connected.
4. Select the **Print Demo** button to initiate a test print.

This test print will verify that the printer is working correctly with your device and the
fiskaltrust InStore App.

---

**4. Printer Configuration Options**

In addition to connecting and selecting your printer, the **Printer Settings** section allows
you to configure other important settings for your printer. These include:

**4.1 Print Delay (only available in Consumer mode)**
In Consumer mode the idea is, that the consumer will handle the receipt interaction on the device independently of any staff member. The consumer has multiple options to choose how to receive the receipt.

The **Print Delay** is the time in seconds until the receipt gets printed automatically on the configured printer. So it is the time the consumer has to choose for a different option (like send per SMS or MAIL) until the printed receipt is forced.
Default: 30s

**4.2 Paper Width**

- If your printed receipt or document has a different size or is not fitting on the
    paper correctly, you can adjust the **Paper Width** setting.
- In the **Printer Settings** section, you can specify the paper width to match your
    printer's paper size (e.g., 80mm or 57mm), ensuring that the print fits properly on
    the page.

**Note:** Both **Delay** and **Paper Width** settings are adjustable by scrolling down in the
**Printer Settings** section.

---


**5. FAQ and Troubleshooting**

**5.1 Frequently Asked Questions (FAQ)**

**Q1: Which printer types are compatible with the fiskaltrust InStore App?**

**A:** See section 2 "Supported Printer Types" for details on external and device internal printers.

**Q2: My printer is not appearing in the app, what should I do?**

**A:** Ensure your printer is powered on and properly connected. For Bluetooth printers,
ensure Bluetooth is enabled on your device and the printer is paired. For ESC POS Network printing,
make sure both your printer and device are connected to the **same network** and you have entered the correct IP address and port number in the InStore App. For
USB printers, check that the USB connection is secure.

**Q3: My prints are faded or blank, how can I fix this?**

**A:** Check the ink or toner levels in your printer. If the ink or toner is low, replace the
cartridge. Additionally, check if the print head needs cleaning. If the issue persists, refer
to your printer's manual for further troubleshooting steps.

**Q4: What should I do if my ESC POS Network printer is not connecting?**

**A:** First, check that both the printer and your device are connected to the **same network**.
Verify that you have entered the correct IP address and port number in the InStore App settings.
If the connection still fails, restart both the printer and the device. If the issue persists,
consult your printer's manual for network troubleshooting steps.

**Q5: Do I need to install any special drivers for my printer?**

**A:** Some printers may require additional drivers. If the app prompts you to install drivers,
follow the on-screen instructions or download them from the manufacturer's website.
Generally, the fiskaltrust InStore App will work with printers that are supported by your
device's operating system.

**Q6: Why is my Bluetooth printer not connecting to my device?**

**A:** Make sure Bluetooth is enabled on both your device and the printer. Check that the
printer is within range of the device and properly paired. If needed, unpair and then re-
pair the devices to ensure a fresh connection.

**Q7: Can I use a printer with the fiskaltrust InStore App if it is not listed in the
supported types?**

**A:** See section 2 "Supported Printer Types" for compatibility details. If your printer is not covered, contact fiskaltrust support for guidance.

**Q8: How do I select a default printer in the fiskaltrust InStore App?**

**A:** After configuring your printer in the app, navigate to **Settings** > **Printer Settings**.
Scroll down and select the desired printer from the list and mark it as the default printer.
This will ensure that all print jobs are sent to the correct printer automatically.
