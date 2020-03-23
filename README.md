# simple_openfoam-extend-v4
Docker environment to perform OpenFOAM-extend-4.0

## Installation guide
* [Installation/Linux/foam\-extend\-4\.0 \- OpenFOAMWiki](https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-4.0)
* [Installation/Linux/foam\-extend\-4\.0/Ubuntu \- OpenFOAMWiki](https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-4.0/Ubuntu#Ubuntu_18.04)

I followed this manual and create Dockerfile so that you can install OpenFOAM-extend-4.0 on your Mac. 

## How to build
- Put Dockerfile your current directory
- Run the following command to build the image (Note: This takes a lot of time)

```
$ docker build -t nishiys/simple_openfoam-extend-v4:v1.0 .
```

## How to use

```shell
$ docker container run -ti --rm -v $PWD:/data -w /data nishiys/simple_openfoam-extend-v4:v1.0

# after entering the container
## source etc/bashrc to enable environmental variables $FOAM_...  
> fe40 
> ... (e.g. ./Allrun)
```

You can use docker.sh to avoid the long command everytime

```
$ ./docker.sh
```
