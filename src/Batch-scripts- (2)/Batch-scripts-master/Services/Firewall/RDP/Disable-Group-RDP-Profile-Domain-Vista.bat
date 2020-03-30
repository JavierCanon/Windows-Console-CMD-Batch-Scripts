netsh advfirewall firewall set rule profile=domain name="Remote Desktop - Shadow (TCP-In)" new enable=No
netsh advfirewall firewall set rule profile=domain name="Remote Desktop - User Mode (TCP-In)" new enable=No
netsh advfirewall firewall set rule profile=domain name="Remote Desktop - User Mode (UDP-In)" new enable=No
