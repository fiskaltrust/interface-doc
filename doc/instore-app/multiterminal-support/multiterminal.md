---
slug: /poscreators/middleware-doc/digital-receipt/multiterminal-settings
title: 'Multinerminal Settings'
---

# Multi terminal settings

To configure multi-terminal support, the following settings should be applied:

1. **Terminal ID** :
    Ensure that all terminals are associated with the same Terminal ID. This ID links
    the transactions to a single cash management system.
2. **Operation Mode** :
    Set the operation mode to **Merchant** on each terminal to ensure they operate
    connected within the multi-terminal environment.
3. **Use Local Configuration** :
    It is recommended to enable the **Use Local Configuration** setting if local
    adjustments are necessary. This allows terminals to operate with specific
    settings while still connecting to the main configuration from the backend.
4. **Enable NFS** :
    Activate the NFC feature if required for payment processing. This setting should
    be consistent across all terminals.
5. **Printers** :
    Configure each terminal to use the same printer settings or ensure network
    printers are set up properly for seamless printing across all devices.

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


