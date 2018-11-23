# awscli
Runs AWS commands using docker container

For example:

In order to deploy UI on your current UI repository that has UI built in `dist` folder you can run the following command that mounts your current directory to `/home/aws/src` and sync's it with the S3 bucket of your choice.  The mounted `dist` folder is at `/home/aws/src/dist` in your container.

```sh
docker run --rm --name aws_sync -v `pwd`:/home/aws/src -v ~/.aws:/home/aws/.aws academicmerit/awscli:latest aws --profile amerit-nuevo s3 sync /home/aws/src/dist/ s3://ui-metadata-import.staging.academicmerit.com
```

## Build and Push

Build images and push to Docker hub:
```sh
bin/build
```

## Note on different tags
- awscli:ec2 tag is used to run on bastion host. It uses uid 500 for aws user inside docker container.
- awscli:latest or awscli:macos tag is used to run on local dev environment. It uses uid 1000 for aws user inside docker container. This is necessary for mounted volume to be writeable on MacOS when running [bin/init](https://github.com/academicmerit/service-fym/blob/dev/bin/init) redacted db refresh script.
