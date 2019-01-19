sshkeys:
    ssh_auth.present:
        - user: ubuntu
        - source: salt://data/ssh_keys/gocd_agent.pub
        - config: '%h/.ssh/authorized_keys'
