#This is small automation PowerShell script to check IP address from the computer and then check the address to see if it is in a certain range.
#Under Microsoft Windows 10.
#Created date: 2019-08-17
#Created by Tommas Huang


$ipLow = [IPAddress] "192.168.0.170"
$ipHigh = [IPAddress] "192.168.0.180"

[Net.NetworkInformation.NetworkInterface]::GetAllNetworkInterfaces() | ? {$_.OperationalStatus -eq "Up"} | % {
    $addrs = $_.GetIPProperties().UnicastAddresses
    if ($addrs) {
        foreach ($addr in $addrs) {
            if ($addr.Address.AddressFamily -eq 'InterNetwork') {
                if ($addr.Address.Address -ge $ipLow.Address -and $addr.Address.Address -le $ipHigh.Address) {
                    $addr.Address
                }
            }
        }
    }
}