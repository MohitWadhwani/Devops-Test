pipeline {
    agent any
    environment {
    mavenHome = tool name:'M2',type:'maven'
	mavencmd= "${mavenHome}/bin/mvn"
	}
    stages {
        stage("Git code") {
            steps {
            sh "ls -lat"
            }
        }

        stage("Build Spring Boot Application") {
            steps {
                sh "$mavencmd package spring-boot:repackage"
            }
		}
        stage("build docker image"){
		    steps {
                sh "docker build -t 8458882343/devops-springboot:latest ."
		    }
		}
        stage("Push docker image"){
		    steps {
               withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'LOGIN', usernameVariable: 'USER')]) {
                    sh "docker login -u $USER -p $LOGIN"
                    sh "docker push 8458882343/devops-springboot:latest"
                }
		    }
		}
        stage("Run docker using Ansible"){
		    steps {
                sh "ansible-playbook deployment.yaml -i /opt/docker/host.txt"
		    }
		}
	}
	post { 
        always { 
            archiveArtifacts artifacts: '**/*.jar'
        }
    }
}