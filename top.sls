base:
  'G@role:db':
    - postgresql
    - firewall.ufw
    - monitor

  'G@role:web':
    - nginx
    - firewall.ufw
    - monitor

