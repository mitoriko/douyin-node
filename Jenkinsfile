pipeline {
  agent any
  stages {
    stage('set-cache') {
      steps {
        sh '''if [ ! -d "/home/docker/build-cache/douyin-node" ];then
mkdir /home/docker/build-cache/douyin-node;
fi'''
      }
    }

    stage('build') {
      steps {
        sh '''docker run --rm -v "$PWD":/server -v /home/docker/build-cache/douyin-node:/server/node_modules -w /server node:onbuild npm install 
&& cp -rf /home/docker/build-cache/douyin-node node_modules
&& docker build -t "$REGISTRY_URL"/"$REGISTRY_IMAGE" .
'''
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
    DOCKER_USERNAME = 'a_cubic_cloud'
    DOCKER_PASSWORD = 'Lh82625001'
  }
}