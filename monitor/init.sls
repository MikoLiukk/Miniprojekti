monit:
  pkg.installed: []

  service.running:
    - name: monit
    - enable: True

  file.managed:
    - name: /etc/monit/monitrc
    - source: salt://monitor/monitrc
    - user: root
    - mode: 0700
    - require:
      - pkg: monit
