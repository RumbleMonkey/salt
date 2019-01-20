bounce:
    file.managed:
        - name: /home/ubuntu/bounce.sh
        - source: salt:///data/bounce/primate.sh
        - user: ubuntu
        - group: ubuntu
        - mode: 755
