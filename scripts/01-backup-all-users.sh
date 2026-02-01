#!/bin/bash

DA_BIN="/usr/local/directadmin/directadmin"
USERS_DIR="/usr/local/directadmin/data/users"
BACKUP_DIR="/home/admin/admin_backups/migration"

mkdir -p "$BACKUP_DIR"

echo "Starting DirectAdmin full backup..."
echo "Backup directory: $BACKUP_DIR"
echo "-------------------------------"

for user in $(ls "$USERS_DIR"); do
  echo "Backing up user: $user"

  echo "action=backup&value=select&where=local&owner=admin\
&select0=$user\
&domain=all\
&email=all\
&ftp=all\
&database=all\
&subdomain=all\
&ssl=all\
&dns=all" \
  | $DA_BIN taskq

done

echo "Backup finished."
