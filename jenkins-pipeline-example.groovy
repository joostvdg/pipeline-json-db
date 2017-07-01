node ('docker') {

    stage('SCM') {
        git 'https://github.com/joostvdg/spring-boot-demo-1.git'
    }

    stage('Inform Pipeline DB') {
        def pom = readMavenPom file: 'pom.xml'

        String buildType = 'pipeline-inline'
        String pipelineName = 'some-example'
        String applicationNamespace = 'joostvdg'
        String applicationId = "${pom.groupId}:${pom.artifactId}"
        String jobName = env.JOB_BASE_NAME
        String jobUrl = env.JOB_URL
        def branchRaw = sh returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD'
        String branch = branchRaw.trim()
        def scmUrlRaw =  sh returnStdout: true, script: 'git config --get remote.origin.url'
        String scmUrl = scmUrlRaw.trim()

        def jsonBody = """
        {
            "buildType": "${buildType}",
            "pipelineName": "${pipelineName}",
            "applicationNamespace": "${applicationNamespace}",
            "applicationId": "${applicationId}",
            "jobUrl": "${jobUrl}",
            "jobName": "${jobName}",
            "branch": "${branch}",
            "scmUrl": "${scmUrl}"
	    }
        """

        echo "jsonBody"
        echo jsonBody

        def response = httpRequest acceptType: 'APPLICATION_JSON', contentType: 'APPLICATION_JSON', httpMode: 'POST', requestBody: jsonBody, url: 'http://172.23.0.1/jsondb/builds'
    }
}