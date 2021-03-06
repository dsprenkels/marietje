mongo packages:
    pkg.installed:
        - pkgs:
            - mongodb-server
mongodb:
    service:
        - running
{% if grains.get('vagrant') %}
/root/ensure-adminUser-exists.py:
    file.managed:
        - mode: 700
        - source: salt://store/ensure-adminUser-exists.py
    cmd:
        - run
        - require:
            - file: /root/ensure-adminUser-exists.py
            - service: mongodb
{% endif %}
