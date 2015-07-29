# symfony-docker
Docker(s) for Symfony project

Creates services required to run Symfony project.

- PHP (PHP-FPM)
- Nginx
- MySQL

This can be used to develop Symfony based project on Ubuntu (14.04) using Docker.

INFO:
SSH username and password is "bigsoda".

You can SSH to PHP-FPM container by running
    
    ssh bigsoda@localhost:6022

**CAUTION:** 

    Images build by this project are NOT production ready yet.
    
**NOTICE:** 

    By default this project includes development tools as Xdebug and SSH access for remote test running 
    - they SHOULD NOT be used in production.
    
## Usage

Depending if you want to use images or build them from scratch you can:
 
1. Use prepared images. This is recommended as it's much faster:

    docker-compose up
    
2. Build images from scratch

    docker-compose -f docker-compose-build.yml up

Add `symfony.local` to your /etc/hosts and project should be available at

    http://symfony.local:6080
    
You should see PHP Info output.

## TODOs 

- Remove root's SSH access
- Custom (ssh) user name and password
- Make it possible to disable Xdebug and SSH agent
- Check the setup using Symfony's validation tool (app/check.php)
