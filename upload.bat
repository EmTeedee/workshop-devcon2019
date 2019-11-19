@echo off

set number=%1

echo Upload to workshop %number%

curl -X POST https://backup-workshop%number%-prd.lfr.cloud/backup/upload -H "Content-Type: multipart/form-data" -F "database=@backup/database.tgz" -F "volume=@backup/volume.tgz" -u "workshop%number%@liferay.com:devcon2019@MAINZ!?"