# Ansible Role: Wordpress Install

Install multiple WordPress website via wp-cli in Debian/Ubuntu based Server

## Requirements

This role requires root access

## Role Variables

wp-cli variables

    wp_cli_phar_url: https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    wp_cli_install_path: /usr/local/bin
    wp_cli_command_name: wp

WordPress installation details

    wp_details:
      - path: "/var/www/example.com"        # Path to install wordpress(required)
        url: "http://example.com"           # Wordpress site url(required)
        title: "Generic Wordpress site"     # Wordpress site title
        admin_user: "admin"                 # Wordpress admin user(required)
        admin_password: "password"          # Wordpress admin password(required)
        admin_email: "admin@example.com"    # Wordpress admin email(required)
        dbname: "wordpress"                 # Database name(required)
        dbuser: "wordpress"                 # Database User(required)
        dbpass: "wordpress"                 # Database password(required)
        dbhost: "localhost"                 # Database host.
        dbcreate: true                      # Set to false, if database and user exist
        server_user: www-data               # wp directory and file owner user
        server_group: www-data              # wp directory and file owner group

Following default values are used if omitted in `wp_details` variable

    wp_defaults:
      title: "Just Another Wordpress Website"
      dbhost: "localhost"
      dbcreate: true
      server_user: www-data
      server_group: www-data


## Dependencies

No dependencies.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
        - sakibmoon.ansible_wordpress_install
          become: yes
      vars:
        wp_details:
          - path: "/var/www/example.com"
            url: "http://example.com"
            title: "Generic Wordpress site"
            admin_user: "admin"
            admin_password: "password"
            admin_email: "admin@example.com"
            dbname: "wordpress"
            dbuser: "wordpress"
            dbpass: "wordpress"
            dbhost: "localhost"
            dbcreate: true
            server_user: www-data
            server_group: www-data

## License

MIT

## Author Information
This role was created by sakibmoon in 2019
