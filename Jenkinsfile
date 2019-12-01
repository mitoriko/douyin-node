pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh '''docker run -it --rm -v /home/docker/dy/douyin-node:/server -w /server node:onbuild npm install
'''
      }
    }

    stage('docker-build') {
      steps {
        sh 'docker build -t "$REGISTRY_URL"/"$REGISTRY_IMAGE" .'
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