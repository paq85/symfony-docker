# symfony-docker
Docker(s) for Symfony project

Creates services required to run Symfony project.

- PHP (PHP-FPM)
- Nginx
- MySQL

NOTICE: 

    By default this project includes development tools as Xdebug and SSH access for remote test running 
    - they SHOULD NOT be used in production.
    They will be disabled in the coming versions of this project.
    
## Usage

Adjust the environment variables in `common.env` and run: 

    docker-compose up -e USER_NAME=bigsoda USER_PASSWORD=myPassword

Add `symfony.local` to your /etc/hosts and project should be available at

    http://symfony.local:6080
    
You should see `Your Symfony project should work.`

## TODOs 

- Remove root's SSH access
- Make it possible to disable Xdebug and SSH agent
- Check the setup using Symfony's validation tool (app/check.php)
- Allow specifying custom host domain instead of symfony.local