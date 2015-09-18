#/bin/bash
directory=$1
operation=$2
if [ -z $directory ] 
then
	echo
	echo Usage: process ^<configuration directory^> ^[process name^]
	echo
	echo      configuration directory -- directory that contains configuration files,
	echo          i.e. config.properties, process-conf.xml, database-conf.xml
	echo
	echo      process name -- optional name of a batch process bean in process-conf.xml,
	echo          for example:
	echo
	echo              process ../myconfigdir AccountInsert
	echo
	echo          If process name is not specified, the parameter values from config.properties
	echo          will be used to run the process instead of process-conf.xml,
	echo          for example:
	echo
	echo              process ../myconfigdir
	echo
else
	PROCESS_OPTION=process.name=$operation
	if [ -z $operation ]
	then
		PROCESS_OPTION=
	fi

	CLASSPATH=.; export CLASSPATH=$CLASSPATH$(find "$PWD/../Data Loader.app" -name '*.jar' -type f -exec echo :{} \; |  sort -u | tr -d '\n');

	java -Dsalesforce.config.dir=$directory com.salesforce.dataloader.process.ProcessRunner $PROCESS_OPTION

fi


