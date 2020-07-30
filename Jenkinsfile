pipeline {
    
    agent any
    

    environment {
        GIT_REPO = "https://github.com/SuryaPatra/workspace-test2"
        root = tool name: 'go', type: 'org.jenkinsci.plugins.golang.GolangInstallation'
        
    }
    
    
  

    stages {
        stage('Preparation') {
            steps {
                git "${GIT_REPO}"
                sh "ls"
                sh '''
                  curl -o tf.zip https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip ; yes | unzip tf.zip
                    sudo cp terraform /usr/bin
                    terraform version
                    
                '''
            }
        }
        stage('Go Test') {
            steps {
                withEnv(["GOROOT=${root}", "PATH+GO=${root}/bin"]) {
                    sh 'go get github.com/gruntwork-io/terratest/modules/terraform'
                    sh 'go get github.com/stretchr/testify/assert'
                    sh 'go get testing'
                    sh 'CGO_ENABLED=0 go test'
                }
   
            }
        }
        
        stage('Terraform Apply') {
            steps {
                sh "./terraform apply -auto-approve"
            }
        }
    }
}
