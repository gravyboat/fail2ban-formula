{% from "fail2ban/map.jinja" import map with context %}

fail2ban:
  pkg:
    - installed
    - name: {{ fail2ban.pkg }}
  service:
    - running
    - name: {{ fail2ban.service }}
    - enable: true
