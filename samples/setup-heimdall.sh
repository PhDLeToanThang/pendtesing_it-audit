#!/bin/sh
clear
cd ~
############### Tham số cần thay đổi ở đây ###################
echo "FQDN: e.g: portal.company.vn"   # Đổi địa chỉ web thứ nhất Website Master for Resource code - để tạo cùng 1 Source code duy nhất 
read -e FQDN
echo "Portal Folder Data: e.g: portaldata"   # Tên Thư mục chưa Data vs Cache
read -e FOLDERDATA

echo "run install? (y/n)"
read -e run
if [ "$run" == n ] ; then
  exit
else

#Step 1. First, we will install Heimdall 2.2.2 dashboard from its GitHub repo:
cd /opt

#RELEASE=$(curl -sX GET "https://api.github.com/repos/linuxserver/Heimdall/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]'); echo $RELEASE &&\
#curl --silent -o ${RELEASE}.tar.gz -L "https://github.com/linuxserver/Heimdall/archive/${RELEASE}.tar.gz"
wget https://github.com/linuxserver/Heimdall/archive/refs/tags/v2.5.6.tar.gz
tar xvzf *.tar.gz

sudo cp -R /opt/Heimdall-2.5.6 /var/www/html/$FQDN
sudo mkdir /var/www/html/$FOLDERDATA
#Change the folder permissions.
sudo chown -R www-data:www-data /var/www/html/$FQDN/ 
sudo chmod -R 755 /var/www/html/$FQDN/ 
sudo chown www-data /var/www/html/$FOLDERDATA


#Step 2. Install PHP modules on Ubuntu 20.04:
# Next, because Heimdall is written in PHP and more specifically, the Laravel PHP web framework, 
# we will need to install 2 PHP module dependencies php-sqlite3 and php-zip on Ubuntu 20.04 in order to install Heimdall
sudo apt install php-sqlite3 php-zip

#Step 3 — Run Heimdall Dashboard with php artisan serve:
# Now change to the directory by cd Heimdall*/, which is your Heimdall installation, and try to start serving it with php artisan serve, 
#which is indeed the way to start any Laravel application. 
#You might see the following error because it’s not yet compatible with PHP 7.4 on Ubuntu 20.04.
#To fix it, edit the ArrayInput.php at line 135 with vim ./vendor/symfony/console/Input/ArrayInput.php +135 and comment on the elseif line and what’s inside. 
#The following screenshot shows the 2 lines of file: /ArrayInput.php 135,13 66%.
	#);
	# //} elseif ('-' === $key[0] {
	#// $this->addShortOption(substr($key,1), $value);
	#} else {

# Now run php artisan serve twice (at least for me) to see Laravel development server has started.
sudo php artisan SERVE
#Laravel development server started: <http://127.0.0.1:8000>
#Right-click “http://127.0.0.1:8000/” and open it, you should see portal dashboard running on your Ubuntu 20.04 OS like the following screenshot. 
#It says “There are currently no pinned applications, Add an application here or Pin an item to the dash”.
#Let’s add an entry to see if it works. To see it on the homepage, i.e., pinned, 
#make sure to click “PINNED” on the top right before you hit the “Save” button.
#As seen below, we successfully added LGTM.cf website to homepage!
	
#Step 4 — Auto-start portal using systemd service
#We are almost done, except we want it to start automatically after we install portal when Ubuntu 20.04 reboots even after an power outage.
#We will use systemd to to auto start portal dashboard when the OS boots. 
#Add the file portal.service in /etc/systemd/system/.
#sudo nano /etc/systemd/system/portal.service

#Add the following content to the file. Make sure you change the user, group, and WorkingDirectory as yours. 
#I also used an uncommon port 7889, you might want to change it if you want. 
#If you access portal from another computer, add --host 0.0.0.0 after 7889.

echo '[Unit]' >> /etc/systemd/system/portal.service
echo 'Description=portal' >> /etc/systemd/system/portal.service
echo 'After=network.target' >> /etc/systemd/system/portal.service
echo '[Service]' >> /etc/systemd/system/portal.service
echo 'Restart=always' >> /etc/systemd/system/portal.service
echo 'RestartSec=5' >> /etc/systemd/system/portal.service
echo 'Type=simple' >> /etc/systemd/system/portal.service
echo 'User=lgtm' >> /etc/systemd/system/portal.service
echo 'Group=lgtm' >> /etc/systemd/system/portal.service
echo 'WorkingDirectory=/var/www/html/${FQDN}' >> /etc/systemd/system/portal.service
echo 'ExecStart="/usr/bin/php" artisan serve --port 7889' >> /etc/systemd/system/portal.service
echo 'TimeoutStopSec=30' >> /etc/systemd/system/portal.service
echo '[Install]' >> /etc/systemd/system/portal.service
echo 'WantedBy=multi-user.target' >> /etc/systemd/system/portal.service
#Save and close the file. 

#To enable the service now, run the following command:
sudo systemctl enable --now portal.service

#Now open your browser and enter http://127.0.0.1:7889/. You should see the same interface as seen before. 
#Now if you reboot your computer or server, you should still be able to visit the URL. 
#If you added --host 0.0.0.0 before, you’ll need to find and type the IP of your computer instead of 127.0.0.1:7889. 
#You can usually find the IP address in your WiFi/wired network properties or with ifconfig. 
# Before we conclude, you might be wondering why not use php-fpm with Apache or Nginx. 
#The reason is that if you are the only user of Heimdall, the current setup will be fine (Thinks of you as the developer). 
#The complexity of using these web servers outweighs the gain of high-performance. 

#Step 5. Configure NGINX
#Next, you will need to create an Nginx virtual host configuration file to host FileRun:
sudo rm /etc/nginx/conf.d/$FQDN.conf
echo 'server {'  >> /etc/nginx/conf.d/$FQDN.conf
echo '    root '/var/www/html/${FQDN}';'>> /etc/nginx/conf.d/$FQDN.conf
echo '    index index.php index.html index.htm;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    server_name '${FQDN}';'>> /etc/nginx/conf.d/$FQDN.conf
echo '    client_max_body_size 512M;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    autoindex off;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    location / {'>> /etc/nginx/conf.d/$FQDN.conf
echo '        try_files $uri $uri/ =404;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    }'>> /etc/nginx/conf.d/$FQDN.conf
echo '    #enable gzip compression:'>> /etc/nginx/conf.d/$FQDN.conf
echo '    gzip on;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    gzip_vary on;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    gzip_min_length 1000;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    gzip_comp_level 5;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    gzip_types application/json text/css application/x-javascript application/javascript image/svg+xml;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    gzip_proxied any;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    # A long browser cache lifetime can speed up repeat visits to your page:'>> /etc/nginx/conf.d/$FQDN.conf
echo '    location ~* \.(jpg|jpeg|gif|png|webp|svg|woff|woff2|ttf|css|js|ico|xml)$ {'>> /etc/nginx/conf.d/$FQDN.conf
echo '    access_log        off;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    log_not_found     off;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    expires           360d;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    }'>> /etc/nginx/conf.d/$FQDN.conf
echo '    # disable access to hidden files'>> /etc/nginx/conf.d/$FQDN.conf
echo '    location ~ /\.ht {'>> /etc/nginx/conf.d/$FQDN.conf
echo '    access_log off;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    log_not_found off;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    deny all;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    }'>> /etc/nginx/conf.d/$FQDN.conf
echo '    location /dataroot/ {'>> /etc/nginx/conf.d/$FQDN.conf
echo '      internal;'>> /etc/nginx/conf.d/$FQDN.conf
echo '      alias '/var/www/html/$FOLDERDATA/';'>> /etc/nginx/conf.d/$FQDN.conf
echo '    }'>> /etc/nginx/conf.d/$FQDN.conf
echo '    location ~ [^/].php(/|$) {'>> /etc/nginx/conf.d/$FQDN.conf
echo '        include snippets/fastcgi-php.conf;'>> /etc/nginx/conf.d/$FQDN.conf
echo '        fastcgi_pass unix:/run/php/php8.2-fpm.sock;'>> /etc/nginx/conf.d/$FQDN.conf
echo '        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;'>> /etc/nginx/conf.d/$FQDN.conf
echo '        include fastcgi_params;'>> /etc/nginx/conf.d/$FQDN.conf
echo '    }'>> /etc/nginx/conf.d/$FQDN.conf
echo '	  location ~ ^/(doc|sql|setup)/{'>> /etc/nginx/conf.d/$FQDN.conf
echo '		deny all;'>> /etc/nginx/conf.d/$FQDN.conf
echo '	  }'>> /etc/nginx/conf.d/$FQDN.conf
echo '}'>> /etc/nginx/conf.d/$FQDN.conf

# Step 6. Uninstall apache:
sudo service apache2 stop
sudo apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
sudo apt-get purge apache2 apache2-utils apache2-bin apache2.2-common

sudo apt-get autoremove
whereis apache2
#apache2: /etc/apache2
sudo rm -rf /etc/apache2

sudo systemctl restart nginx
systemctl restart php8.2-fpm.service

sudo nginx -t
sudo systemctl reload nginx

#Step 7. Install Certbot
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d $FQDN

# You should test your configuration at:
# https://www.ssllabs.com/ssltest/analyze.html?d=$FQDN
#/etc/letsencrypt/live/$FQDN/fullchain.pem
#   Your key file has been saved at:
#   /etc/letsencrypt/live/$FQDN/privkey.pem
#   Your cert will expire on yyyy-mm-dd. To obtain a new or tweaked
#   version of this certificate in the future, simply run certbot again
#   with the "certonly" option. To non-interactively renew *all* of
#   your certificates, run "certbot renew"

fi
