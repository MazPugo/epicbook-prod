epicbook-prod/
├─ terraform/                    # choose azure/ or aws/ below
│  └─ (azure|aws)/
│
├─ ansible/
│  ├─ inventory.ini
│  ├─ site.yml                   # calls roles in order
│  ├─ group_vars/
│  │  └─ web.yml
│  └─ roles/
│     ├─ common/
│     │  └─ tasks/main.yml
│     ├─ nginx/
│     │  ├─ tasks/main.yml
│     │  └─ templates/epicbook.conf.j2
│     ├─ epicbook/
│     │  └─ tasks/main.yml      # installs Node app & PM2/systemd
│     └─ database/
│        ├─ tasks/main.yml      # creates DB, user, imports schema
│        └─ files/schema.sql    # ✅ DB schema + seed data file
│
└─ README.md
