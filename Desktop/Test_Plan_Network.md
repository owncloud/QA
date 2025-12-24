# Network

## 1. HTTPS

### Precondition

Create a valid certificate on Ubuntu (more info in [here][1]):

### Enable the SSL module

sudo a2enmod ssl

### Generate the CSR

sudo openssl req -new > new.ssl.csr

### Generate the Certificate

sudo openssl rsa -in privkey.pem -out new.cert.key
sudo openssl x509 -in new.ssl.csr -out new.cert.cert -req -signkey new.cert.key -days 365
sudo cp new.cert.cert /etc/ssl/certs/server.crt
sudo cp new.cert.key /etc/ssl/private/server.key

### Configure Apache

cd /etc/apache2/sites-enabled

vim 000-default.conf

paste:

<VirtualHost *:443>  
  
        ServerAdmin webmaster@localhost  
        DocumentRoot /var/www/owncloud

        ErrorLog ${APACHE\_LOG\_DIR}/error.log  
        CustomLog ${APACHE\_LOG\_DIR}/access.log combined

    SSLEngine on  
    SSLOptions +StrictRequire  
    SSLCertificateFile /etc/ssl/certs/server.crt  
    SSLCertificateKeyFile /etc/ssl/private/server.key

</VirtualHost>

### Restart Apache

sudo service apache2 restart

 

Mac SSL: [Certificate][2]

 [1]: https://www.linux.com/tutorials/creating-self-signed-ssl-certificates-apache-linux/
 [2]: https://gist.github.com/tboerger/dd93239d19908ec1eed13d6e644fab72#certificate

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify client can connect via HTTPS and connection status is shown | Log in and verify the connection in the Account tab by clicking on the lock icon | User can connect using https and the it is also shown in the Account tab | | | 

## 2. Download/Upload bandwidth

### Precondition

Measure how long it takes to upload/download a file at your currect connection speed

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify download bandwidth limit is effective | 1.  Set your Download Bandwidth to 8KBytes/s <br/> 2.  Upload a file to the server via webUI <br/> 3.  Sync the file to the client | Download has been significantly slower | | | 
| 2  | Verify upload bandwidth limit is effective | 1.  Set your Upload Bandwidth to 8KBytes/s <br/> 2.  Add a new file to the sync folder <br/> 3.  Sync the file to the server | Upload has been significantly slower | | | 

## 3. Proxy

### Precondition

1.  Open desktop client
2.  Go to Network tab
3.  There are Proxy setting at the top

Start HTTP(S) proxy: mitmproxy --listen-port 10000

Start SOCKS5 proxy: mitmproxy --listen-port 10000 --mode socks5

Start proxy server that requires authentication: mitmproxy --listen-port 10000 --proxyauth username:password

Change system proxy

macOS: System Preferences -> Network -> Wi-Fi -> Advanced -> Proxies -> Select HTTPS proxy

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify 'No Proxy' setting works | Use No Proxy | No proxy has been used | | | 
| 2  | Verify 'Use System Proxy' setting works | Use System Proxy | System proxy has been used | | | 
| 3  | Verify manually configured HTTP(S) proxy works | Specify proxy manually as **HTTP(S)** proxy. Host: localhost:10000 | HTTP(S) Proxy has been used | | | 
| 4  | Verify manually configured SOCKS5 proxy works | Specify proxy manually as **SOCKS5** proxy. Host: localhost:10000 | SOCKS5 Proxy has been used | | | 
| 5  | Verify proxy with authentication works | Specify proxy manually as Host: localhost:10000. Tick Proxy server requires **authentication**. Enter username and password | Proxy with authentication has been used | | | 

## 4. HTTP2

### Precondition

Based on [this][1] 

This is expected to fail with Qt-5.12.5 or ealier. Retest whenevr we have a newer QT, that promises aother HTTP2 fix. See also: https://github.com/owncloud/client/issues/7610

## HTTP/2 Requirements

#### Requirement #1: HTTPS

How to in [desktop-92: HTTPS][2]

#### Requirement #2: Apache 2.4.24

Check with the following command: apache2 -v

#### Requirement #3: [PHP FPM][3]

sudo apt-get install php7.2-fpm

sudo vim /etc/apache2/conf-available/php-fpm.conf

paste:

<IfModule mod_fastcgi.c>
        AddHandler php7-fcgi .php
        Action php7-fcgi /php7-fcgi
        Alias /php7-fcgi /usr/lib/cgi-bin/php7-fcgi
        FastCgiExternalServer /usr/lib/cgi-bin/php7-fcgi -socket /run/php/php7.2-fpm.sock -pass-header Authorization -idle-timeout 60
        <Directory /usr/lib/cgi-bin>
                Require all granted
        </Directory>
</IfModule>

sudo a2enconf php-fpm

sudo service apache2 reload

## Configuration Changes for HTTP/2

Switching Apache’s PHP Module from MPM Prefork to Event

sudo a2enmod proxy_fcgi
sudo a2enconf php7.2-fpm
sudo a2dismod php7.2
sudo a2dismod mpm_prefork
sudo a2enmod mpm_event
sudo service apache2 restart

**Enable the module mod_http2:**

sudo a2enmod http2
sudo service apache2 restart

**Enable the HTTP/2 protocol by adding the following to */etc/apache2/apache2.conf*:**

Protocols h2 http/1.1

 [1]: https://helgeklein.com/blog/2018/11/enabling-http-2-in-apache-on-ubuntu-18-04/
 [2]: https://testlink.owncloud.team/linkto.php?tprojectPrefix=desktop&item=testcase&id=desktop-92
 [3]: https://www.interserver.net/tips/kb/apache-php-fpm-ubuntu-18-04/

| ID | Test Case                                   | Steps to reproduce                                                                                                                                                                                                              | Expected Result                                                                                                                                | Result | Related Comment |
|----|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------|
| 1  | Verify client connection indicates HTTP/2 usage | Log in and verify the connection in the Account tab by clicking on the lock icon | User can see in the Account tab if HTTP2 is used. | | | 
