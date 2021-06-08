#!/usr/bin/env bash

### PAKETIERE LOKAL

# db dump via mysql-docker-instanz erstellen lassen -> var/lib/mysql
docker exec -ti dockerwordpress_db_1 /usr/bin/mysqldump -u wordpress -wordpress -d wordpress > dump.sql

# zip-file mit user-generated data -> /wp-content/uploads
tar -C ./db_data/wp-content/ -cvzf uploads.tar.gz ./uploads

# zip-file mit themes -> /wp-content/themes
tar -C -/db_data/wp-content/ -cvzf themes.tar.gz ./themes

# zip-file mit plugins -> /wp-content/plugins
tar -C ./db_data/wp-content/ -cvzf plugins.tar.gz ./plugins

# wp-config.php -> wp-config.localdev.php - dies stellt nur eine andere Zugriffsmöglichkeit dar, geht auch einfacher
docker exec -ti wp-deploy_wordpress_1 cat wp-config.php > wp-config.localdev.php