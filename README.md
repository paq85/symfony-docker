# symfony-docker
Docker(s) for Symfony project

Creates services required to run Symfony project.

- PHP (PHP-FPM) +
- Nginx
- MySQL

This can be used to develop Symfony based project eg. on Ubuntu (14.04, 15.04) using Docker.

INFO:
SSH username and password is "phpdev".

You can SSH to PHP-FPM container by running
    
    ssh phpdev@localhost:6022

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

### PHPStorm integration

It's possible to use PHPStorm's Remote PHP Interpreter for an efficient work.

You need to setup:

- PHP -> PHP Remote Interpreter (PHP 5.6) via SSH credentials
- PHP -> Behat via Remote Interpreter
- PHP -> PHPUnit via Remote Interpreter
- PHP -> Servers
- Deployment via SFTP with proper Path Mappings

This will allow you run your project and tests - also with debugger.

**NOTE**
If you have troubles with Xdebug try adding "magic" environment variables like
`PHP_IDE_CONFIG="serverName=docker.local"
 XDEBUG_CONFIG="idekey=phpstorm"`

 You will know path mappings are OK once you run PHPUnit from PHPStorm and click twice on concrete test
 it should open given test source code.

## Building Single Image

Go to one of folders in `phpdev`, eg. `phpdev/symfony-app`

    docker build
    docker images
    docker tag {imageId} paq85/symfony-app:latest
    docker push paq85/symfony-app