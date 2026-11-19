pipeline {
  agent any
  options { timestamps(); disableConcurrentBuilds(); skipDefaultCheckout(true) }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Test') { steps { sh 'bash scripts/test.sh' } }
    stage('Build') { steps { sh 'docker compose -p devops-engineer-portfolio build web' } }
    stage('Deploy') { steps { sh 'docker compose -p devops-engineer-portfolio up -d --no-deps web' } }
    stage('Verify') {
      steps {
        sh '''
          set -eu
          for i in $(seq 1 30); do
            HEALTH=$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}none{{end}}' devops-portfolio-site)
            [ "$HEALTH" = healthy ] && break
            sleep 2
          done
          [ "$HEALTH" = healthy ]
          curl --fail --silent --show-error http://127.0.0.1:8082/ | grep -F 'Hasnain Abbas | DevOps Engineer Portfolio'
          docker compose -p devops-engineer-portfolio ps
        '''
      }
    }
  }
  post { success { echo 'DEVOPS ENGINEER PORTFOLIO: AUTOMATED DEPLOYMENT SUCCESSFUL!' } }
}
