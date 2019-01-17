docker:
    pkgrepo.managed:
        - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{salt.cmd.run("lsb_release -cs")}} stable
        - gpgkey: salt://data/docker.gpg

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
