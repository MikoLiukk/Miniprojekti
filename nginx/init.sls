nginx:
  pkg.installed: []

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - require:
      - pkg: nginx

