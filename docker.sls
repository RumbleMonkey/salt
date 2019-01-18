pip:
    cmd.run:
        - name: curl https://bootstrap.pypa.io/get-pip.py | python -
        - unless:
            - which pip

awscli:
    cmd.run:
        - name: pip install awscli docker
        - require:
            - cmd: pip
        - unless:
            - pip freeze | grep awscli
            - pip freeze | grep docker

docker:
    pkgrepo.managed:
        - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{salt.cmd.run("lsb_release -cs")}} stable
        - key_url: salt://data/docker.gpg

    pkg.installed:
        - name: docker-ce

main_user:
    user.present:
        - name: ubuntu
        - groups:
            - docker
        - remove_groups: false
        - require:
            - pkg: docker
