ecr_creds:
    cmd.run:
        - name: $(aws ecr get-login --region {{pillar.ecr.region}} --no-include-email)
        - runas: ubuntu

troop_image:
    docker_image.present:
        - name: 989485622078.dkr.ecr.us-west-2.amazonaws.com/rumblemonkey/alpha:latest
