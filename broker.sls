bounce:
    file.managed:
        - name: /home/ubuntu/bounce.sh
        - source: salt:///data/broker/bounce.sh
        - user: ubuntu
        - group: ubuntu
        - mode: 755

container_mounts:
    file.directory:
        - name: /home/ubuntu/broker
        - user: ubuntu
        - group: ubuntu
        - makedirs: true

docker_compose_yaml:
    file.managed:
        - name: /home/ubuntu/docker-compose.yml
        - source: salt:///data/broker/docker-compose.yml
        - user: ubuntu
        - group: ubuntu
