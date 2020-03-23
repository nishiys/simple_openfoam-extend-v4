# simple_openfoam-extend-v4
Docker environment to perform OpenFOAM-extend-4.0

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
