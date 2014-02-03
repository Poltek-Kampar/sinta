sinta
=====

Description (in Bahasa)
-----------------------

Sistem Informasi Tugas Akhir

SINTA adalah sebuah sistem informasi untuk mendata tugas akhir mahasiswa. Dibuat menggunakan JSP.
Dibuat pertama kali oleh Mahasiswa Teknik Informatika Politeknik Kampar, Andri Noviar AM, A.Md

Hak Cipta &copy; 2013 Program Studi Teknik Informatika Politeknik Kampar.


INSTALL
-------

SINTA berjalan sebagai servlet, dan Anda harus menginstal Tomcat. 
### Instaling VirtualHost di tomcat

#### Set VirtualHost di Tomcat6
Tambahkan host berikut, ganti sinta.poltek-kampar.ac.id sesuai dengan settingan DNS Anda.
```
      <Host name="sinta.poltek-kampar.ac.id"  appBase="sinta"
            unpackWARs="true" autoDeploy="true"
            xmlValidation="false" xmlNamespaceAware="false">
      </Host>
```

di ubuntu, berkas server.xml ada di
/etc/tomcat6/server.xml

#### Buat User Baru, sinta
```
sudo adduser sinta
mkdir /home/sinta/public_html
```

#### Point appBase "sinta" seperti yang ada di server.xml
```
sudo mkdir /var/lib/tomcat6/sinta
ln -s /home/sinta/public_html ROOT
```
sehingga nantinya ROOT akan mempoint ke /home/sinta/public_html
```
root@tomcat6svr:/var/lib/tomcat6/sinta# dir
total 5464
drwxr-xr-x 2 root  root     4096 2013-11-07 12:05 .
drwxr-xr-x 7 root  root     4096 2013-10-29 15:16 ..
lrwxrwxrwx 1 root  root       24 2013-10-29 15:35 ROOT -> /home/sinta/public_html/
```

#### download berkas master.zip disini, dan extract ke /home/sinta/public_htmll/
download berkas disini, dan point ke /home/sinta/public_html/
jangan sampai ada folder master atau nama branch lainnya di sana, tapi langsung ke folder yang ada README.md ini.

#### restart tomcat6
restart tomcat6
```
sudo /etc/init.d/tomcat6 restart
```

### Optional: AJP Proxy
Jika Apache telah berjalan di port 80, dan tomcat di port 8080, maka Anda dapat melakukan proxy sehingga apache yang di port 80 dapat mengakses SINTA tanpa harus menggunakan port 8080.

Contoh tanpa proxy:
http://sinta.poltek-kampar.ac.id:8080/

Contoh dengan proxy:
http://sinta.poltek-kampar.ac.id/

Caranya adalah dengan membuat sebuah berkas di /etc/apache2/sites-available
```
sudo pico /etc/apache2/sites-available/sinta.poltek-kampar.ac.id
```
Kemudian isikan settingan VirtualHost Apache berikut:
```
<VirtualHost _default_:80>
  ServerName sinta.poltek-kampar.ac.id
  ServerAlias www.sinta.poltek-kampar.ac.id
  UseCanonicalName Off
  VirtualDocumentRoot /home/sinta/public_html
  <Directory "/home/sinta/public_html">
    allow from all
    Options +Indexes +FollowSymLinks
  </Directory>
        <Proxy *>
                Order deny,allow
                allow from all
        </Proxy>
        ProxyRequests Off
        ProxyPass / ajp://localhost:8009/ smax=0 ttl=60 retry=5
</VirtualHost>
```
Pastikan Tomcat melakukan layanan AJP di port 8009 (default)
check di settingan server.xml tomcat
```
    <!-- Define an AJP 1.3 Connector on port 8009 -->
    <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" />

```

Enable VirtualHost
```
sudo a2ensite sinta.poltek-kampar.ac.id
```
Check apakah sites sudah enabled:
```
cat /etc/apache2/sites-enabled/sinta.poltek-kampar.ac.id
```
Reload Apache
```
sudo /etc/init.d/apache2 reload
```

Pada contoh di atas, berkas sinta ada di /home/sinta/public_html, sehingga user
