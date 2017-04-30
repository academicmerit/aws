# awscli
Runs AWS commands using docker container

For example:

```sh
docker run --rm --name aws_sync -v `pwd`:/home/aws/src -v ~/.aws:/home/aws/.aws academicmerit/awscli:latest aws --profile amerit-nuevo s3 sync /home/aws/src/dist/ s3://ui-metadata-import.staging.academicmerit.com
```

## Build and Push

```sh
$ docker build -t academicmerit/awscli .
$ docker images     # check the image has been built in your local repository
$ docker push academicmerit/awscli:latest
```
