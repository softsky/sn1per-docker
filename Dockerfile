FROM ubuntu:16.04
MAINTAINER menzo@menzo.io
MAINTAINER Arsen A.Gutsal <a.gutsal@softsky.com.ua>


RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list.d/kali.sources.list
RUN gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6
RUN gpg -a --export ED444FF07D8D0BF6 | apt-key add -


ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get install -y \
	amap \
	arachni \
	bsdmainutils \
	build-essential \
	cisco-torch \
	curl \
	cutycapt \
	dirb \
	dnsenum \
	dnsrecon \
	dnsutils \
	dos2unix \
	enum4linux \
	git \
	git-core \
	golismero \
	host \
	hydra \
	iceweasel \
	iputils-ping \
	joomscan \
	libcurl4-openssl-dev \
	libffi-dev \
	libreadline-dev \
	libsqlite3-dev \
	libssl-dev \
	libxml2-dev \
	libxslt1-dev \
	libyaml-dev \
	metasploit-framework \
	nbtscan \
	nikto \
	nmap \
	php \
	php-curl \
	python \
	python-software-properties \
	python2.7 \
	rubygems \
	ruby-bcrypt \
	smtp-user-enum \
	software-properties-common \
	sqlite3 \
	sqlmap \
	sslscan \
	sslyze \
	theharvester \
	unicornscan \
	uniscan \
	w3af \
	waffit \
	wapiti \
	whatweb \
	whois \
	wpscan \
	xprobe2 \
	zenmap \
	zlib1g-dev \
	&& apt-get clean


COPY ./install.sh /root

# Install python and ruby + dependencies
RUN mv /usr/bin/python /usr/bin/python.unknown && \
	ln -s /usr/bin/python2.7 /usr/bin/python && \
	curl https://bootstrap.pypa.io/get-pip.py | python && \
	gem install  \
		mechanize \
		bcrypt \
		net-http-persistent \
		rake \
		ruby-nmap \
		text-table && \
	pip install  \
		colorama \
		dnspython \
		ipaddress \
		tldextract \
		urllib3

# INSTALL SN1P3R
RUN cd /root && \
	git clone https://github.com/1N3/Sn1per.git && \
	cd ~/Sn1per && \
	rm install.sh && \
	mv ~/install.sh ./install.sh; sync && \
	chmod +x install.sh && \
	./install.sh

# Always start container into a bash shell
CMD /bin/bash