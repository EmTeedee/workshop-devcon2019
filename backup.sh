#!/bin/bash
#Database 
rm -rf backup
mkdir backup

docker exec -it dba.liferay.com mysqldump -ulportal -p123456 lportal > backup/database.sql
sed -i '' "1s/.*/use lportal;/" backup/database.sql
cd backup
tar -czvf database.tgz database.sql
rm database.sql
cd ..

#DL
docker exec -it lfr.liferay.com tar -czvf volume.tgz -C /opt/liferay/data document_library
docker cp lfr.liferay.com:/opt/liferay/volume.tgz backup/