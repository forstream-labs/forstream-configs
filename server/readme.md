## Server setup ##

First you need to create an OS user called "forstream":
````
setup/create-user.sh
````
Enter with user "forstream":
````
su - forstream
````
Create the required server directory structure:
````
setup/create-directories.sh
````
Move this project to "$FORSTREAM_HOME/apps" and change set the owner as "forstream" user:
````
mv forstream-configs $FORSTREAM_HOME/apps
sudo chown -R forstream:forstream $FORSTREAM_HOME/apps/forstream-configs
````
Execute the others scripts:
````
setup/install-dependencies.sh
setup/prepare-env.sh
````

### Pulling Vamu.la images ###

Vamu.la images are stored on Amazon ECR. To pull the images just run the following command:
````
docker/pull-images.sh
````

### Running Containers ###

First you need to create the network "forstream" on Docker:
````
docker/create-network.sh
````
And then you can run the containers:
````
// Please read "Nginx Container" session before
docker/create-container.sh nginx

// Please read "Mongo Container" session before
docker/create-container.sh mongo

// Please read "Redis Container" session before
docker/create-container.sh redis

// Please read "Vamu.la Container" session before
docker/create-container.sh forstream/forstream
````

## Nginx Container ##

## Mongo Container ##

### Opening the Shell ###
````
docker/mongo/connect.sh
````

### Security ###

#### Creating Administrator and User ####

Don't forget to replace the password token by the user password.
````
use admin
db.createUser({
  user: "admin",
  pwd: "<password>",
  roles: [{
      role: "userAdminAnyDatabase",
      db: "admin"
  }]
})
db.createUser({
  user: "forstream",
  pwd: "<password>",
  roles: [{
      role : "readWrite",
      db : "forstream"
  }]
})
````

## Redis Container ##

### Client ###

````
docker/redis/connect.sh
````

## Vamu.lá Container ##

The project configuration file is exported as a Docker volume on $FORSTREAM_HOME/configs/forstream.yml.
This file must be created before running the container.

## Vamu.lá Web Container ##

The project configuration file is exported as a Docker volume on $FORSTREAM_HOME/configs/forstream-web.yml.
This file must be created before running the container.
