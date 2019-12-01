pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''docker run --rm -v "$PWD":/server -v /home/docker/build-cache/node_modules:/server/node_modules -w /server node:onbuild npm install && docker build -t "$REGISTRY_URL"/"$REGISTRY_IMAGE" .
'''
      }
    }

    stage('update-image') {
      steps {
        sh '''docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD" "$REGISTRY_URL"
docker push "$REGISTRY_URL"/"$REGISTRY_IMAGE"'''
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