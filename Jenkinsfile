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
        sh '''ls
docker run --rm -v "$PWD":/app -v /cache/"$CACHE":/app/node_modules -w /app node:onbuild npm install 
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