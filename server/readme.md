## Server setup ##

1. First you need to create an OS user called "forstream":
````
setup/create-user.sh
````
2. Create the required server directory structure:
````
setup/create-directories.sh
````
3. Move this project to "/opt/forstream/apps" and set the folder owner of "/opt/forstream" as "forstream":
````
sudo mv forstream-configs /opt/forstream/apps
sudo chown -R forstream:forstream /opt/forstream/apps/forstream-configs
````
4. Enter with user "forstream":
````
su - forstream
````
5. Execute the others scripts:
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

1. Edit default.conf and disable authorization
2. Execute the following commands to create users. Don't forget to replace <password> by user password.
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
3. Edit default.conf and enable authorization

## Redis Container ##

### Client ###

````
docker/redis/connect.sh
````

## Forstream Container ##

The project configuration file is exported as a Docker volume on /opt/forstream/configs/forstream.yml.
This file must be created before running the container.
