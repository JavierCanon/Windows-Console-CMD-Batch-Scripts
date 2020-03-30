netsh advfirewall firewall set rule profile=public name="Remote Desktop - Shadow (TCP-In)" new enable=Yes
netsh advfirewall firewall set rule profile=public name="Remote Desktop - User Mode (TCP-In)" new enable=Yes
netsh advfirewall firewall set rule profile=public name="Remote Desktop - User Mode (UDP-In)" new enable=Yes
