# SaltServer – Automatisoitu palvelinympäristö Miko Liukkonen 2025

Tässä projektissa toteutetaan automatisoitu palvelinympäristö Vagrantin ja SaltStackin avulla. Tavoitteena on rakentaa helposti hallittava ja laajennettava infrastruktuuri, johon sisältyy tietokanta, web-palvelin, palomuuri sekä palveluiden valvonta.

## Teknologiat

- **Vagrant** – Virtuaaliympäristön hallintaan
- **SaltStack** – Konfiguraation hallintaan ja automaatioon
- **PostgreSQL** – Tietokantapalvelin
- **Nginx** – Web-palvelin
- **UFW (Uncomplicated Firewall)** – Palomuuri
- **Monit** – Palveluiden valvontaan ja hälytyksiin
- **GitHub Actions** – CI/CD-putken toteutukseen

## Hakemistorakenne
/srv/salt/
├── top.sls
├── postgresql/
│ └── init.sls
├── nginx/
│ └── init.sls
├── firewall/
│ └── ufw.sls
└── monitor/
├── init.sls
└── monitrc

/srv/pillar/
├── top.sls
└── db.sls


Miko Liukkonen
Haaga-Helia ammattikorkeakoulu
Kurssi: Palvelinten hallinta
