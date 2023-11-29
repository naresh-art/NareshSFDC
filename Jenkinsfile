#!groovy
import groovy.json.JsonSlurperClassic
node {

    def BUILD_NUMBER=env.BUILD_NUMBER
    def RUN_ARTIFACT_DIR="tests/${BUILD_NUMBER}"
    def SFDC_USERNAME

    def HUB_ORG=env.HUB_ORG_DH
    def SFDC_HOST = env.SFDC_HOST_DH
    def JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
    def CONNECTED_APP_CONSUMER_KEY=env.CONNECTED_APP_CONSUMER_KEY_DH

    println 'KEY IS' 
    println JWT_KEY_CRED_ID
    println HUB_ORG
    println SFDC_HOST
    println CONNECTED_APP_CONSUMER_KEY
    //def toolbelt = tool 'toolbelt'
CLIENT_ID="3MVG9d8..z.hDcPKb3CaFlz_MgBZGRRsr.bFUAjw7XI7xEaCe9SwRirxvlQVuYpGmypfz.ctucsF2c8jaodV1"
JWT_KEY_FILE="server.key"
USERNAME="nareshpunagani316@gmail.com"
INSTANCE_URL="https://login.salesforce.com"
    stage('checkout source') {
        // when running in multi-branch job, one must issue this command
        checkout scm
    }

    withCredentials([file(credentialsId: JWT_KEY_CRED_ID)]) {
        stage('Deploye Code') {
          sfdx force:auth:jwt:grant \
    --clientid "$CLIENT_ID" \
    --jwtkeyfile "$JWT_KEY_FILE" \
    --username "$USERNAME" \
    --instanceurl "$INSTANCE_URL" \
    --setdefaultdevhubusername
        }
    }
}
