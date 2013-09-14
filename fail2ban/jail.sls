{% from "fail2ban/map.jinja" import map with context %}
{% set fail2ban = salt['grains.filter_by']({
    'Debian': {'jail': 'salt://fail2ban/debian_jail.local'},
    'RedHat': {'jail': 'salt://fail2ban/redhat_jail.local'},
}) %}

include:
  - fail2ban

fail2ban_jail:
  file:
    - managed
    - name: {{ map.jail }}
    - source: {{ salt['pillar.get']('fail2ban:jail:tmpl', {{ fail2ban.jail }}) }}
    - user: {{ salt['pillar.get']('fail2ban:jail:user', 'root') }}
    - group: {{ salt['pillar.get']('fail2ban:jail:group', 'root') }}
    - mode: {{ salt['pillar.get']('fail2ban:jail:group', '644') }}
    - require:
      - pkg: fail2ban
    - watch_in:
      - service: fail2ban
