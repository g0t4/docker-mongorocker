RockMongo
=======================

### Usage Instructions

``` bash
docker run -d -p 80:8080 -e "MONGO_SERVER=localhost" ykocaman/rockmongo  
```
By default there's no auth to RockMongo, see below to change this.

### Configuration

Name                              | Default         | Description
----------------------------------|-----------------|------------
`MONGO_SERVER`                    |`localhost`      | MongoDB server hostname or IP address. This will show up in rockmongo drop down selector when you login.
`MONGO_PORT`                      |`27017`          |
`MONGO_DATABASE`                  |                 | Default database to connect to
 | | 
`MONGO_AUTH`                      |`false`          | If your MongoDB server requires auth, set this to `true`.
`MONGO_USERNAME`                  |                 | Username if you set MONGO_AUTH=true
`MONGO_PASSWORD`                  |                 | Password if you set MONGO_AUTH=true
 | | 
`ROCKMONGO_AUTH`                  |`false`          | If you want to enable login to RockMongo set this to `true`.
`ROCKMONGO_USER`                  |`admin`          | Username if you set ROCKMONGO_AUTH=true
`ROCKMONGO_PASSWORD`              |`admin`          | Password if you set ROCKMONGO_AUTH=true
 | | 
`NGINX_HOSTNAME`                  |`rockmongo.docker.local` | A hostname you can bind to your docker host's IP to access rockmongo's nginx site by name.
 | | 
`ROCKMONGO_BASE_URI`                  |				| Base URI for links, running behind reverse proxy. eg: `/rockmongo`

### Notes

- RockMongo project site: [http://rockmongo.com/](http://rockmongo.com/).
- This image is not an official part of the RockMongo project.
- This image modifies the RockMongo config file when you run it, injecting the above environment variable configuration into the static config.php file for RockMongo to use.
