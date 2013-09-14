{% from "fail2ban/map.jinja" import map with context %}

include:
  - fail2ban

fail2ban_config:
  file:
    - managed
    - name: {{ map.config }}
    - source: {{ salt['pillar.get']('fail2ban:config:tmpl', 'salt://fail2ban/files/jail.local') }}
    - user: {{ salt['pillar.get']('fail2ban:config:user', 'root') }}
    - group: {{ salt['pillar.get']('fail2ban:config:group', 'root') }}
    - mode: {{ salt['pillar.get']('fail2ban:config:group', '644') }}
    - require:
      - pkg: fail2ban
    - watch_in:
      - service: fail2ban
