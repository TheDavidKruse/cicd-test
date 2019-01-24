# install AWS SDK
pip install --user awscli
export PATH=$PATH:$HOME/.local/bin


# login AWS ECR
eval $(aws ecr get-login --no-include-email --region us-west-2)


# build the docker image and push to an image repository.
docker build -t cicd-test .
docker tag cicd-test:latest $IMAGE_REPO_URL:latest
docker push $IMAGE_REPO_URL:latest

