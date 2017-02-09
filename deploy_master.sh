#!/bin/sh

set -ex

echo "install angular-cli...."
npm install -g angular-cli

echo "ng build...."
ng build

echo "azure ftp deploy...."
lftp -u AzureCIExample\\gurezo,yamahaow01 -e "mirror -Rev dist/. /site/wwwroot/." ftp://waws-prod-sn1-089.ftp.azurewebsites.windows.net
