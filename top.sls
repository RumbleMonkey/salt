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

    "roles:chimp":
        - match: grain
        - chimp

    "roles:broker":
        - match: grain
        - broker
