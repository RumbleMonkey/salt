base:
    "*":
        - base

    "roles:containerized":
        - match: grain
        - docker

    "roles:node":
        - match: grain
        - node
