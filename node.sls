bounce:
    file.managed:
        - name: /home/ubuntu/bounce.sh
        - source: salt:///data/node/bounce.sh
        - user: ubuntu
        - group: ubuntu
        - mode: 755

container_mounts:
    file.directory:
        - name: /home/ubuntu/troop/config
        - user: ubuntu
        - group: ubuntu
        - makedirs: true
