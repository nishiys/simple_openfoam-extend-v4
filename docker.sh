#!/bin/sh
docker container run -ti --rm -v $PWD:/data -w /data nishiys/simple_openfoam-extend-v4:v1.0
