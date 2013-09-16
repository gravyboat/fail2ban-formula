{% from "fail2ban/map.jinja" import map with context %}
{% set fail2ban = salt['grains.filter_by']({
    'Debian': {'conf': 'salt://fail2ban/debian-fail2ban.conf'},
    'RedHat': {'conf': 'salt://fail2ban/redhat-fail2ban.conf'},
}) %}

include:
  - fail2ban

fail2ban_config:
  file:
    - managed
    - name: {{ map.config }}
    - source: {{ salt['pillar.get']('fail2ban:config:tmpl', {{ fail2ban.conf }}) }}
    - user: {{ salt['pillar.get']('fail2ban:config:user', 'root') }}
    - group: {{ salt['pillar.get']('fail2ban:config:group', 'root') }}
    - mode: {{ salt['pillar.get']('fail2ban:config:group', '644') }}
    - require:
      - pkg: fail2ban
    - watch_in:
      - service: fail2ban
