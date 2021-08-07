pipeline {
    agent any
    stages {
        stage("Git code") {
            steps {
            sh "ls -lat"
            }
        }

        stage("Build Spring Boot Application") {
            steps {
                sh "mvn package spring-boot:repackage"
            }
		}
        stage("build docker image"){
		    steps {
                sh "docker build -t 8458882343/Devops-springboot:latest ."
		    }
		}
	}
	post { 
        always { 
            jar '**/*.jar'
        }
    }
}