pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''if [ ! -d "/cache/"$CACHE"" ];then
mkdir /cache/"$CACHE";
fi
REAL_CACHE=/home/docker/build-cache/"$CACHE"
echo "$REAL_CACHE"
local_path=`echo ${PWD/var/home}`
local_path=`echo ${local_path/jenkins_home/"docker/jenkins"}`
echo "$local_path"
REAL_PATH="$local_path"
echo "$REAL_PATH"'''
        sh '''echo "$REAL_PATH"
echo "$REAL_CACHE"
docker run --rm -v "$REAL_PATH":/app -v "$REAL_CACHE":/app/node_modules -w /app node:onbuild ls'''
        sh '''cp -rf $REAL_CACHE" node_modules 
docker build -t "$REGISTRY_URL"/"$REGISTRY_IMAGE" .'''
      }
    }

    stage('update-image') {
      steps {
        sh '''docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD" "$REGISTRY_URL" && docker push "$REGISTRY_URL"/"$REGISTRY_IMAGE"
'''
      }
    }

  }
  environment {
    REGISTRY_URL = 'registry.cn-qingdao.aliyuncs.com'
    REGISTRY_IMAGE = 'a-cubic/douyin-node'
    DOCKER_USERNAME_USR = 'credentials(\'Docker_Push\')'
    DOCKER_PASSWORD_PSW = 'credentials(\'Docker_Push\')'
    CACHE = 'douyin-node'
  }
}