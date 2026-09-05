ansible all -b -m shell -a '
echo "=========================================="
echo "HOST: $(hostname)"
echo "IP:   $(hostname -I | awk "{print \$1}")"
echo "=========================================="

echo
echo "===== UFW ====="
ufw status verbose || true

echo
echo "===== UFW SERVICE ====="
echo "Enabled: $(systemctl is-enabled ufw 2>/dev/null || echo unknown)"
echo "Active:  $(systemctl is-active ufw 2>/dev/null || echo unknown)"

echo
echo "===== FAIL2BAN ====="
echo "Enabled: $(systemctl is-enabled fail2ban 2>/dev/null || echo unknown)"
echo "Active:  $(systemctl is-active fail2ban 2>/dev/null || echo unknown)"

echo
echo "===== FAIL2BAN CLIENT ====="
fail2ban-client status 2>/dev/null || true

echo
echo "===== ASLR ====="
sysctl kernel.randomize_va_space

echo
echo "===== AUDITD ====="
echo "Active: $(systemctl is-active auditd 2>/dev/null || echo unknown)"

echo
echo "===== UNATTENDED UPDATES ====="
echo "Enabled: $(systemctl is-enabled unattended-upgrades 2>/dev/null || echo unknown)"
echo "Active:  $(systemctl is-active unattended-upgrades 2>/dev/null || echo unknown)"

echo
echo "===== SHADOW ====="
stat -c "%a %U:%G %n" /etc/shadow

echo
echo "=========================================="
'
