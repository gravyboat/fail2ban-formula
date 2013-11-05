{% from "fail2ban/map.jinja" import map with context %}

include:
  - fail2ban

fail2ban_jail:
  file:
    - managed
    - name: {{ map.jail }}
    - source: salt://fail2ban/{{ grains['os'] }}-jail.local
    - user: {{ salt['pillar.get']('fail2ban:jail:user', 'root') }}
    - group: {{ salt['pillar.get']('fail2ban:jail:group', 'root') }}
    - mode: {{ salt['pillar.get']('fail2ban:jail:group', '644') }}
    - require:
      - pkg: fail2ban
    - watch_in:
      - service: fail2ban
