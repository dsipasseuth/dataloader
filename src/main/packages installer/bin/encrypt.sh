#/bin/bash
CLASSPATH=.; export CLASSPATH=$CLASSPATH$(find "$PWD/../Data Loader.app" -name '*.jar' -type f -exec echo :{} \; |  sort -u | tr -d '\n');

java com.salesforce.dataloader.security.EncryptionUtil "$@"
