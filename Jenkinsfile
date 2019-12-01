pipeline {
  agent any
  stages {
    stage('set-cache') {
      steps {
        sh '''if [ ! -d "/cache/"$CACHE"" ];then
mkdir /cache/"$CACHE";
fi'''
      }
    }

    stage('build') {
      steps {
        sh '''docker run --rm -v "$PWD":/server -v /cache/"$CACHE":/server/node_modules -w /server node:onbuild npm install 
&& cp -rf /cache/"$CACHE" node_modules
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
    CACHE = 'douyin-node'
  }
}