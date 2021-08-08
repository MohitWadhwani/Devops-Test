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
               withCredentials([usernamePassword(credentialsId: 'dockerlogin', passwordVariable: 'login', usernameVariable: 'dokcerlogin')]) {
                    sh "docker push 8458882343/devops-springboot:latest"
                }
		    }
		}
	}
	post { 
        always { 
            archiveArtifacts artifacts: '**/*.jar'
        }
    }
}