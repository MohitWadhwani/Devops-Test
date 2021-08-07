#!/usr/bin/env groovy
pipeline {
    agent any

    stages {
        stage("Git Checkout") {
            steps {
                git 'https://github.com/MohitWadhwani/Devops-bootcamp-SpringBoot-Application.git'
            }
        }

        stage("Build Spring Boot Application") {
            steps {
                sh "mvn package spring-boot:repackage"
            }
		}
		stage("build docker image"){
			sh "docker build -t 8458882343/Devops-springboot:latest ."
		}
	}
	post { 
        always { 
            jar '**/*.jar'
        }
    }
}