# check if nginx is installed
which curl nginx || {
  apt-get update
  apt-get install -y nginx 
}

# stop nginx service
service nginx stop

# remove default conf of nginx
[ -f /etc/nginx/sites-available/default ] && {
  rm -fr /etc/nginx/sites-available/default
}

# copy our nginx conf
cp /vagrant/nginx.conf /etc/nginx/sites-available/default

# deploy our website
mkdir -p /var/www/html/
cp /vagrant/index.html /var/www/html/index.html

# start nginx service
service nginx start

