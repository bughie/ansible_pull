# ansible_pull
Ansible Pull on lab server
cat << 'EOF' > ~/ansible_pull/README.md
# Production Infrastructure Runbook: Automated Ansible-Pull Hardened Security Environment

This runbook outlines the architecture, step-by-step installation, troubleshooting, and disaster recovery procedures for maintaining an automated, hardened security baseline across multi-node Linux infrastructure using an `ansible-pull` pull-based model.

---

## 1. Environment Architecture & Readiness

### Node Topology
* **Control Node / Repository Host:** `ansible-srv`
* **Managed Fleet (7 Nodes):**
  * Web Tier: `web1.networkbughie.net`, `web2.networkbughie.net`
  * App Tier: `appserver` (appserver-01), `appserver-02`
  * Database Tier: `db-primary`, `db-replica`
  * Staging Tier: `staging-server`

### Repository Architecture
* **Git Remote URL:** `https://github.com/bughie/ansible_pull.git`
* **Execution Strategy:** Hourly `ansible-pull` cron execution (`0 * * * *`) scheduled as root.

---

## 2. Directory Layout & Core Configuration Files

```text
~/ansible_pull/
├── site.yml
├── README.md
├── inventories/
│   └── hosts.yml
└── roles/
    └── security/
        ├── handlers/
        │   └── main.yml
        ├── tasks/
        │   ├── main.yml
        │   ├── ssh.yml
        │   ├── ufw.yml
        │   ├── fail2ban.yml
        │   ├── auditd.yml
        │   ├── unattended_upgrades.yml
        │   ├── password_policy.yml
        │   ├── filesystem_permissions.yml
        │   ├── sysctl.yml
        │   ├── ansible_pull_cron.yml
        │   ├── logrotate.yml
        │   ├── validation.yml
        │   └── audit_logging.yml
        └── templates/
            ├── audit.rules.j2
            ├── 50unattended-upgrades.j2
            ├── 20auto-upgrades.j2
            └── ansible-pull-logrotate.j2
