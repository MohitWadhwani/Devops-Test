pipeline {
    agent any
    tools {
        // Specify the Maven installation
        maven 'M2'
    }
    environment{
        BUILD_NUMBER= '35'
    }
    stages {
        stage("Git code") {
            steps {
            bat label: '', script: 'dir'
            }
        }

        stage("Build Spring Boot Application") {
            steps {
                bat label: '', script: 'mvn -f pom.xml clean package'
            }
		}
        stage("build docker image"){
		    steps {
                bat label: '', script: "docker build -t 8458882343/devops-springboot:${env.BUILD_NUMBER} ."
		    }
		}
        stage("Push docker image"){
		    steps {
		        script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'LOGIN', usernameVariable: 'USER')]) {
                        bat "docker login -u ${USER} -p ${LOGIN}"
                        bat "docker push 8458882343/devops-springboot:${env.BUILD_NUMBER}"
                    }   
		        }

		    }
		}
        stage("Deploy Chart to Dev Env."){
		    steps {
		        script {
                        bat "helm template ./devops-test/  --set image.tag=${env.BUILD_NUMBER}"
                        
                        bat "helm upgrade --install test ./devops-test/ --set image.tag=${env.BUILD_NUMBER}"
		        }

		    }
		}
	}
	post { 
        always {
            archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
        }
    }
}