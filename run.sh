#check for curl
#check if password is filled
#check if publish url starts with ftp
#check if publish url endswith wwwroot

#FTP_URL=$WERCKER_AZURE_FTP_DEPLOY_PUBLISH_URL
#FTP_PASSWORD=$WERCKER_AZURE_FTP_DEPLOY_PASSWORD
#FTP_USERNAME=$WERCKER_AZURE_FTP_DEPLOY_USERNAME
FTP_URL="ftps://waws-prod-sn1-089.ftp.azurewebsites.windows.net"
FTP_PASSWORD="yamahaow01"
FTP_USERNAME="AzureCIExample\\gurezo"

echo "Test connection"

#echo "curl -u $FTP_USERNAME:FTP_PASSWORD $FTP_URL/"
#curl -u $FTP_USERNAME:$FTP_PASSWORD $FTP_URL/

#echo "find . -type f -exec curl -u $FTP_USERNAME:FTP_PASSWORD --ftp-create-dirs -T {} $FTP_URL/{} \;"
#find . -type f -exec curl -u $FTP_USERNAME:$FTP_PASSWORD --ftp-create-dirs -T {} $FTP_URL/{} \;

echo "install angular-cli...."
npm install -g angular-cli

echo "ng build...."
ng build

echo "azure ftp deploy...."
lftp -u AzureCIExample\\gurezo,yamahaow01 -e "mirror -Rev dist/. /site/wwwroot/." ftp://waws-prod-sn1-089.ftp.azurewebsites.windows.net
