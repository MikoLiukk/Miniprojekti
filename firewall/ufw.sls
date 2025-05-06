ufw:
  pkg.installed: []

ufw-defaults:
  cmd.run:
    - name: |
        ufw default deny incoming &&
        ufw default allow outgoing &&
        ufw allow ssh &&
        ufw allow 5432/tcp &&
        ufw allow 80/tcp &&
        ufw --force enable
    - unless: "ufw status | grep -q 'Status: active'"
    - require:
      - pkg: ufw
