# awscli
Runs AWS commands using docker container

For example:

In order to deploy UI on your current UI repository that has UI built in `dist` folderyou can run the following command that mounts your current directory to `/home/aws/src` and sync's it with the S3 bucket of your choice.  The mounted `dist` folder is at `/home/aws/src/dist` in your container.

```sh
docker run --rm --name aws_sync -v `pwd`:/home/aws/src -v ~/.aws:/home/aws/.aws academicmerit/awscli:latest aws --profile amerit-nuevo s3 sync /home/aws/src/dist/ s3://ui-metadata-import.staging.academicmerit.com
```

## Build and Push

```sh
$ docker build -t academicmerit/awscli .
$ docker images     # check the image has been built in your local repository
$ docker push academicmerit/awscli:latest
```

## Note on different tags
- awscli:ec2 tag is used to run on bastion host and it uses uid 500 for aws user inside docker container
- awscli:latest or awscli:macos tag is used to run on local dev environmnet and uses uid 1000 for aws user inside docker container
  - this is necessary for mounted volume to be writeable on MacOS when running `bin/init](https://github.com/academicmerit/service-fym/blob/dev/bin/init)` redacted db refresh script
