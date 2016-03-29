FROM thomasredstone/base 
# Install php-fpm
RUN apt-get update -qq && apt-get -y upgrade
RUN apt-get -y -qq install php5-fpm php5-mysql
RUN apt-get -y -qq install curl libcurl3 libcurl3-dev php5-curl php5-mcrypt php5-gd
RUN usermod -u 1000 www-data
# Adding the configuration files
ADD conf/www.conf /etc/php5/fpm/pool.d/www.conf
ADD conf/php-fpm.conf /etc/php5/fpm/php-fpm.conf
# Add the run script to run the services and configure db
ADD run.sh /run.sh

#add the volume for the wordpress application
VOLUME /var/www/app

# Expose the port 9000
EXPOSE 9000
# Run the run.sh script
ENTRYPOINT [ "/bin/bash", "/run.sh"]
