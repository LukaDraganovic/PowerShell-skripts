# SiteBlocker: PowerShell Firewall Automation

This repository contains a streamlined PowerShell script designed to help you manage network traffic or minimize distractions by blocking specific websites at the **Firewall level**.

---

## 🚀 Features
* **System-Wide Blocking**: Prevents access across all browsers and applications by creating a Windows Defender Firewall Rule.
* **Automatic IP Resolution**: Automatically resolves domains (e.g., "example.com") into their associated IPv4 addresses using `Resolve-DnsName`.
* **Native Implementation**: Uses the `New-NetFirewallRule` command, requiring no third-party software.
* **Duplicate Handling**: Automatically filters for unique IP addresses to keep firewall rules efficient.

---

## 🛠️ How to Use

1.  **Modify the Script**:
    Open `website_blocking_template.ps1` and add your target domains to the `$sites` array:
    ```powershell
    $sites = @(
        "[www.distractionsite.com](https://www.distractionsite.com)",
        "socialmedia.com"
    )
    ```

2.  **Run as Administrator**:
    Firewall modifications require elevated privileges.
    * Right-click your PowerShell terminal and select **Run as Administrator**.
    * Execute the script: `.\website_blocking_template.ps1`.

3.  **Verification**:
    The script will output "Found [domain]" for every successful resolution and create an outbound rule named **"Network stability script"**.

---

## ⚠️ Important Considerations

* **Dynamic IPs**: Some large platforms change their IP addresses frequently; re-run the script to update the blocklist if a site becomes accessible again.
* **DNS Resolution**: The script specifically looks for "Type A" (IPv4) records and will skip a site silently if it cannot be resolved.
* **Unblocking**: To remove the restrictions and delete the firewall rule, run the following command in an elevated PowerShell prompt:
    ```powershell
    Remove-NetFirewallRule -DisplayName "Network stability script"
    ```

---

## 📜 Technical Breakdown

The script operates through the following logic:
1.  **Resolution**: It loops through the `$sites` array and uses `Resolve-DnsName` to find the IP addresses.
2.  **Collection**: Unique IPs are gathered into the `$allIps` variable using `Select-Object -Unique`.
3.  **Enforcement**: It uses `New-NetFirewallRule` to block all outbound traffic to the identified `RemoteAddress` list.

## License
This script is provided as-is for personal or organizational use.
## Disclaimer
This tool is intended for legitimate purposes such as:

* Parental controls
* Workplace productivity
* Personal focus and time management
* Network administration

Users are responsible for ensuring their use complies with applicable laws and regulations.
