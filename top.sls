base:
    "roles:containerized":
        - match: grain
        - docker

    "roles:troop_node":
        - match: grain
        - troop_node
