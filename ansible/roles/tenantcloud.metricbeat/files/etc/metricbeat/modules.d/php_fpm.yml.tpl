# Module: php_fpm

- module: php_fpm
  #metricsets:
  #  - pool
  #  - process
  period: 10s
  hosts: ["localhost:8080"]
  status_path: "/status"
  #username: "user"
  #password: "secret"
