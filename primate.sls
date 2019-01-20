bounce:
    file.managed:
        - name: /home/ubuntu/bounce.sh
        - source: salt:///data/bounce/primate.sh
        - user: ubuntu
        - group: ubuntu
        - mode: 755

docker_compose:
    file.managed:
        - name: /usr/local/bin/docker-compose
        - source: https://github.com/docker/compose/releases/download/1.23.2/docker-compose-Linux-x86_64
        - mode: 755
