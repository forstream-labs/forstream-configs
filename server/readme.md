## Server setup ##

First you need to create an OS user called "forstream":
````
setup/create-user.sh
````
Create the required server directory structure:
````
setup/create-directories.sh
````
Move this project to "/opt/forstream/apps" and set the folder owner of "/opt/forstream" as "forstream":
````
sudo mv forstream-configs /opt/forstream/apps
sudo chown -R forstream:forstream /opt/forstream/apps/forstream-configs
````
Enter with user "forstream":
````
su - forstream
````
Execute the others scripts:
````
setup/install-dependencies.sh
setup/prepare-env.sh
````

### Pulling Forstream images ###

Forstream images are stored on Amazon ECR. To pull the images just run the following command:
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

// Please read "Forstream Container" session before
docker/create-container.sh forstream
````

## Nginx Container ##

## Mongo Container ##

### Opening Shell ###
````
docker/mongo/connect.sh
````

### Security ###

#### Creating Administrator and User ####

Execute the following commands replacing <password> by users passwords, respectively.
````
> use admin
> db.createUser({
  user: "admin",
  pwd: "<password>",
  roles: [{
      role: "userAdminAnyDatabase",
      db: "admin"
  }]
})
> db.createUser({
  user: "forstream",
  pwd: "<password>",
  roles: [{
      role : "readWrite",
      db : "forstream"
  }]
})
````
Edit default.conf and set authorization attribute to "enabled"

## Redis Container ##

### Client ###

````
docker/redis/connect.sh
````

## Forstream Container ##

The project configuration file is exported as a Docker volume on /opt/forstream/configs/forstream.yml.
This file must be created before running the container.
