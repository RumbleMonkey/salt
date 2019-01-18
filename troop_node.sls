ecr_creds:
    cmd.run:
        - name: |
            $(aws ecr get-login --region {{pillar.ecr.region}} --no-include-email)
