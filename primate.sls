bounce:
    file.managed:
        - name: /home/ubuntu/bounce.sh
        - source: salt:///data/primate/bounce.sh
        - user: ubuntu
        - group: ubuntu
        - mode: 755

container_mounts:
    file.directory:
        - name: /home/ubuntu/primate
        - user: ubuntu
        - group: ubuntu
        - makedirs: true

docker_compose_yaml:
    file.managed:
        - name: /home/ubuntu/docker-compose.yml
        - source: salt:///data/primate/docker-compose.yml
        - user: ubuntu
        - group: ubuntu

docker_compose:
    file.managed:
        - name: /usr/local/bin/docker-compose
        - source: https://github.com/docker/compose/releases/download/1.23.2/docker-compose-Linux-x86_64
        - source_hash: 4d618e19b91b9a49f36d041446d96a1a0a067c676330a4f25aca6bbd000de7a9
        - mode: 755
