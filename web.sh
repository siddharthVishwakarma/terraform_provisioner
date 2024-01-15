yum install httpd wget unzip vim -y
systemctl start httpd
systemctl enabled httpd
wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip
unzip -o 2135_mini_finance.zip 
cp -r 2135_mini_finance/* /var/www/html/
systemctl restart httpd