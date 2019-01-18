bounce:
    file.managed:
        - name: /home/ubuntu/bounce.sh
        - source: salt:///data/bounce/node.sh
