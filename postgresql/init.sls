postgresql-pkg:
  pkg.installed:
    - name: postgresql

postgresql-service:
  service.running:
    - name: postgresql
    - enable: True
    - require:
      - pkg: postgresql-pkg

create-db-user:
  cmd.run:
    - name: "sudo -u postgres psql -c \"CREATE USER {{ pillar['postgres']['user'] }} WITH PASSWORD '{{ pillar['postgres']['password'] }}';\""
    - unless: "sudo -u postgres psql -tAc \"SELECT 1 FROM pg_roles WHERE rolname='{{ pillar['postgres']['user'] }}'\" | grep -q 1"
    - require:
      - service: postgresql-service

create-database:
  cmd.run:
    - name: "sudo -u postgres createdb -O {{ pillar['postgres']['user'] }} {{ pillar['postgres']['database'] }}"
    - unless: "sudo -u postgres psql -lqt | cut -d \\| -f 1 | grep -w {{ pillar['postgres']['database'] }}"
    - require:
      - cmd: create-db-user
