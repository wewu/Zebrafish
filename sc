--- 
:num_processors: 1024
:debug: false
:docroot: public
:user: wwwrun
:host: 0.0.0.0
:config_file: 
:mime_map: 
:prefix: /zebrafish
:port: "8000"
:daemon: true
:cwd: /srv/www/zebrafish
:includes: 
- mongrel
:environment: production
:group: www
:log_file: /srv/www/zebrafish/log/mongrel.log
:timeout: 0
:config_script: 
:pid_file: /srv/www/zebrafish/log/mongrel.pid
