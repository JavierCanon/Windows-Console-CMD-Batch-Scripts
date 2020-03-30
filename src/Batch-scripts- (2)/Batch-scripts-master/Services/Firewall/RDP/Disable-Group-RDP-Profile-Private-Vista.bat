netsh advfirewall firewall set rule profile=private name="Remote Desktop - Shadow (TCP-In)" new enable=No
netsh advfirewall firewall set rule profile=private name="Remote Desktop - User Mode (TCP-In)" new enable=No
netsh advfirewall firewall set rule profile=private name="Remote Desktop - User Mode (UDP-In)" new enable=No
