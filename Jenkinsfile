pipeline {
    agent any
	def mavenHome = tool name:'M2',type:'maven'
    def mavencmd= "${mavenHome}/bin/mvn"
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