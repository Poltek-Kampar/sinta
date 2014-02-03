sinta
=====

Description (in Bahasa)
-----------------------

Sistem Informasi Tugas Akhir

SINTA adalah sebuah sistem informasi untuk mendata tugas akhir mahasiswa. Dibuat menggunakan JSP.
Dibuat pertama kali oleh Mahasiswa Teknik Informatika Politeknik Kampar, Andri Noviar, A.Md

Hak Cipta Program Studi Teknik Informatika Politeknik Kampar.


INSTALL
-------

SINTA berjalan sebagai servlet, dan Anda harus menginstal Tomcat. 

Optional: AJP Proxy
-------------------

Jika memang ingin diakses melalui apache port 80, dapat dilakukan VirtualHosting,
contoh konfigurasi VirtualHost apache untuk AJP:
{{{
root@webserver:/etc/apache2/sites-enabled# cat sinta.poltek-kampar.ac.id
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
        ProxyPass / ajp://localhost:6009/ smax=0 ttl=60 retry=5
</VirtualHost>
}}}
