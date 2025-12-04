---
slug: /poscreators/middleware-doc/instore-app/multiterminal-settings
title: 'Multiterminal Settings'
---

## Rules for Multi-Terminal Setups

To execute actions on connected devices, like executing a payment or display a receipt, the devices, on which an action is executed, are determined by the Terminal ID configuration which acts as a filter. 

The following rules apply:

| **Scenario** | **Behavior** |
|--------------|--------------|
| POS has Terminal ID “A1”, none of the devices have a Terminal ID | All devices display the receipt |
| POS has Terminal ID “A1”, one device has Terminal ID “A1” | All devices display the receipt |
| POS has Terminal ID “A1”, multiple (but not all) devices have Terminal ID “A1” | All devices display the receipt |
| POS has Terminal ID “A1”, all devices have Terminal ID “A1” | All devices display the receipt |
| POS has Terminal ID “A1”, all devices have different Terminal IDs (e.g., “B1”) | No device displays the receipt |
| POS has no Terminal ID, one device has Terminal ID “A1” (others have none) | All devices without a Terminal ID display the receipt; the device with “A1” does not |
| POS has no Terminal ID, all devices have Terminal IDs (e.g., “A1”, “B1”) | No device displays the receipt |

---

**Use Cases**

1. **Retail Environment** :
    In a busy retail store, multiple cash registers may be used during peak hours.
    Multi-terminal support allows sales associates to serve customers at different
    points without generating separate receipts, streamlining the checkout process.
2. **Food and Beverage Service** :
    Restaurants with multiple service stations can utilize the same queue for orders.
    Waitstaff can take orders at different tables while ensuring that all transactions
    are tracked in a unified manner.
3. **Events and Exhibitions** :
    During events with various merchandise stands, having multiple terminals
    connected to the same queue allows for efficient transaction handling without
    confusion over receipts or payments.


---


**Potential Error Cases**

1. **Receipt Duplication** :
    If terminals are not properly configured with the same Terminal ID, it may lead to
    duplicate receipts being generated across devices.
2. **Network Issues** :
    Connectivity problems between terminals and the central server can cause
    delays or failures in processing transactions, resulting in an inconsistent user
    experience.
3. **Configuration Mismatches** :
    If different terminals have varying settings (e.g., different operation modes), it
    may cause confusion or errors during transactions, especially in a high-paced
    environment.
4. **Printer Discrepancies** :
    If terminals are set to use different printers without proper configuration, this may
    lead to printing errors or misdirected receipts.

---

## FAQ

**Q: Can I use different types of cash registers with multi-terminal support?**

A: Yes, as long as all cash registers are connected to the same Terminal ID and
configured correctly, you can use different types of cash registers.

**Q: What happens if one terminal goes offline?**

A: If a terminal goes offline, it may not process transactions until it reconnects. However,
other terminals can continue operating normally as long as they are connected.

**Q: Is there a limit to how many terminals can be connected?**

A: While there is no specified limit to the number of terminals that can be connected,
performance may vary based on network capacity and backend server capabilities.

**Q: Can I manage settings for multiple terminals simultaneously?**

A: Yes, if you enable local configuration, you can manage specific settings for each
terminal independently while still maintaining connection to the main configuration.


