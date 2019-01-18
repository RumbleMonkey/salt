python-dev:
    pkg.installed:
        - pkgs:
            - python3
            - libpython3-dev
            - python3-distutils

pip:
    cmd.run:
        - name: curl https://bootstrap.pypa.io/get-pip.py | python3.6 -
        - unless:
            - which pip3.6
        - require:
            - python-dev

awscli:
    cmd.run:
        - name: pip3.6 install awscli
        - require:
            - cmd: pip
        - unless:
            - pip3.6 freeze | grep awscli

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
