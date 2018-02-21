FROM tutum/lamp

MAINTAINER Elias Alves <elias.alves@ufvjm.edu.br>

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_BRANCH
ARG LS_VERSION

LABEL Name="LimeSurvey on Docker" \
	Version=${VCS_BRANCH} \
	Architecture="x86_64" \
	org.label-schema.build-date=${BUILD_DATE} \
	org.label-schema.name="LimeSurvey on Docker" \
	org.label-schema.description="LimeSurvey on Docker" \
	org.label-schema.vcs-ref=${VCS_REF} \
	org.label-schema.vcs-url="https://github.com/unixelias/limesurvey" \
	org.label-schema.vendor="Elias Alves at UFVJM" \
	org.label-schema.version=${LS_VERSION} \
	org.label-schema.version=${VCS_BRANCH} \
	org.label-schema.version="latest" \
	org.label-schema.schema-version="1.0" \
	org.label-schema.docker.cmd="docker run -d --name limesurvey -v mysql:/var/lib/mysql -p 80:80 unixelias/limesurvey:latest"

# Localização pt-br
RUN locale-gen pt_BR \
	&& locale-gen pt_BR.UTF-8 \
	&& dpkg-reconfigure locales \
	&& update-locale LANG=pt_BR.UTF-8

# Atualizando e instalando dependências
RUN apt-get update \
	&& apt-get upgrade -q -y \
	&& apt-get install -q -y curl php5-gd php5-ldap php5-imap php5-curl sendmail \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* \
	&& php5enmod imap \
	&& php5enmod ldap \
	&& php5enmod curl \
	&& rm -rf /app

RUN curl -o limesurvey.tar.gz -L https://github.com/LimeSurvey/LimeSurvey/archive/${LS_VERSION}.tar.gz \
	&& mkdir limetmp \
	&& tar -zxf limesurvey.tar.gz -C limetmp \
	&& rm limesurvey.tar.gz \
	&& LIME_TAG=$(ls limetmp) \
	&& mv limetmp/$LIME_TAG app \
	&& rm -rf limetmp \
	&& mkdir -p /uploadstruct \
	&& chown -R www-data:www-data /app \
	&& cp -r /app/upload/* /uploadstruct \
	&& chown -R www-data:www-data /uploadstruct \
	&& chown www-data:www-data /var/lib/php5

#Mysql externo
RUN rm /etc/supervisor/conf.d/supervisord-mysqld.conf

ADD ldap.php /app/application/config/
ADD apache_default /etc/apache2/sites-available/000-default.conf
ADD start.sh /
RUN chmod +x /start.sh

RUN chown -R www-data:www-data /app

VOLUME /app/upload

EXPOSE 80

CMD ["/start.sh"]
