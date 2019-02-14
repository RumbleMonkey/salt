bounce:
    file.managed:
        - name: /home/ubuntu/bounce.sh
        - source: salt:///data/admin/bounce.sh
        - user: ubuntu
        - group: ubuntu
        - mode: 755

container_mounts:
    file.directory:
        - name: /home/ubuntu/admin
        - user: ubuntu
        - group: ubuntu
        - makedirs: true

docker_compose_yaml:
    file.managed:
        - name: /home/ubuntu/docker-compose.yml
        - source: salt:///data/admin/docker-compose.yml
        - user: ubuntu
        - group: ubuntu
