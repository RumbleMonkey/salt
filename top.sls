base:
    "*":
        - base

    "roles:containerized":
        - match: grain
        - docker

    "roles:node":
        - match: grain
        - node

    "roles:primate":
        - match: grain
        - primate
        - docker_compose

    "roles:chimp":
        - match: grain
        - chimp
        - docker_compose

    "roles:broker":
        - match: grain
        - broker
        - docker_compose

    "roles:coconut":
        - match: grain
        - coconut
        - docker_compose

    "roles:admin":
        - match: grain
        - admin
        - docker_compose
