Creating a debian package
=========================


Creating the debian package
---------------------------


### Create the package skeleton using the command `dh_make` as shown below:

~~~
~$ mkdir shellter-2.1
~/shellter.1$ cd shellter-2.1/
~/shellter-2.1$ ls
~/shellter-2.1$ dh_make --createorig -e debian@libcrack.so

Type of package: single binary, indep binary, multiple binary, library, kernel module, kernel patch?
 [s/i/m/l/k/n] i

Maintainer name  : Borja Ruiz
Email-Address    : debian@libcrack.so 
Date             : Mon, 12 Jan 2015 01:49:20 +0100
Package Name     : shellter
Version          : 2.1
License          : blank
Type of Package  : Independent
Hit <enter> to confirm: 
Currently there is no top level Makefile. This may require additional tuning.
Done. Please edit the files in the debian/ subdirectory now. You should also
check that the shellter Makefiles install into $DESTDIR and not in / .
~/shellter-2.1$ 
~~~

### Delete unnecessary generated files (or at least files we won't use)

~~~
~/shellter-2.1$ rm -rf debian/{emacsen-*,manpage.*,post*,pre*,README.*,shellter.*}
~/shellter-2.1$ rm -rf debian/{init.d,menu,watch}.ex debian/source
~~~

### Create the `debian/docs`  file

~~~
~/shellter-2.1$ echo shellter/faq.txt > debian/docs
~/shellter-2.1$ echo shellter/readme.txt >> debian/docs
~/shellter-2.1$ echo shellter/version_history.txt  >> debian/docs
~/shellter-2.1$ echo shellter/shellcode_samples/info.txt  >> debian/docs
~~~

### Create the `debian/copyright` file:

~~~
~/shellter-2.1$ cat > debian/copyright < EOF
Format: http://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
Upstream-Name: shellter
Source: http://www.shellterproject.com

Files: debian/*
Copyright: 2014  KyREcon <shellterproject@hotmail.com>
License: Custom

 By using this software you understand that it has been exclusively developped by
 Kyriakos Economou (@kyREcon) during his free time and his past, current or future 
 employers may assume no prior knowledge of existence for it.

 This software makes use of the BeaEngine Disassemble library (http://www.beaengine.org)
 as stated in the Readme.txt file.

 This license was updated the 15th of July 2014.

 Terms of Use
 ==============

 1) You can use this software and share it with anyone as long as you do this for free.

 2) You assume every responsibility for any damage caused by this software either this applies
    to you or to someone else.

 3) You assume every responsibility for any unlawful actions taken by using this software.

 4) You are allowed to modify this software, but if you do then you have to explicitly state so
    in case you share it with other people.

 5) You are allowed to reverse engineer it, disassemble it, debug it, for any reason that might be,
    but in case you find a bug then please report it to the author and give him the necessary amount
    of time to fix it before disclosing it.

 6) You are allowed to distribute this software from your own website, but if you do then you have
    to include a link to its original source along with the license agreement.

 7) You are allowed to use this software for work purposes, but you are not allowed to charge for it.
    This means that you have the right to use it as a complementary tool to assist you at work, but
    you are not allowed to build a commercial service based on this tool or exploit this tool financially
    by any means without the written agreement of its author.

 8) You are not allowed to use this software to gain unauthorized access to a computer system or 
    network without a written agreement of its owner.

 9) It is responsibility of the user to check for any modifications in this license agreement, and
    adjust the way he is using this software accordingly.

 10) You are allowed to use this software for as long as you want only if you respect all the 
     previous terms.

 Good luck! - kyREcon

EOF
~~~

### Create the `debian/control` file

~~~
~/shellter-2.1$ cat > debian/control < EOF
cat debian/control 
Source: shellter
Section: devel
Priority: extra
Maintainer: Borja Ruiz <borja@libcrack.so>
Build-Depends: unzip
Standards-Version: 3.9.3
Homepage: http://www.shellterproject.com

Package: shellter
Architecture: all
Depends: wine-bin | wine64-bin, ${misc:Depends} 
Description: A Dynamic ShellCode Injector

~~~

### Create the `debian/dirs` and `debian/files` files

~~~
~/shellter-2.1$ echo /usr/share/shellter > dirs
~/shellter-2.1$ echo shellter_2.0-1_all.deb devel extra > files
~~~

### Create also the `debian/install` file which will be executed as installation script

~~~
~/shellter-2.1$ echo bin/shellter /usr/bin/ > install
~/shellter-2.1$ echo 'shellter/*' /usr/share/shellter/ >> install 
~~~

### Unzip the shellter files. A directory named `shellter` will be created:
    
~~~
~/shellter-2.1$ unzip shellter.zip
bin  debian  shellter  shellter.zip
~/shellter-2.1$ ls shellter
faq.txt  icon  license.txt  readme.txt  shellcode_samples  shellter.exe  version_history.txt
~~~

### Finally, create the package using `dpkg-buildpackage`

~~~
~/shellter-2.1$ dpkg-buildpackage 
dpkg-buildpackage 
dpkg-buildpackage: paquete fuente shellter
dpkg-buildpackage: versión de las fuentes 2.0-1
dpkg-buildpackage: fuentes modificadas por KyREcon <shellterproject@hotmail.com>
dpkg-buildpackage: arquitectura del sistema amd64
 dpkg-source --before-build shellter-2.1
 debian/rules clean
dh clean 
   dh_testdir
   dh_auto_clean
   dh_clean
 dpkg-source -b shellter-2.1
dpkg-source: aviso: no se ha definido un formato de fuentes en «debian/source/format», consulte dpkg-source(1)
dpkg-source: información: usando el formato de fuente «1.0»
dpkg-source: aviso: el directorio de fuentes «shellter-2.1» no es <paquete-fuente>-<versión-desarrollador-original> «shellter-2.0»
dpkg-source: información: construyendo shellter en shellter_2.0-1.tar.gz
dpkg-source: información: construyendo shellter en shellter_2.0-1.dsc
 debian/rules build
dh build 
   dh_testdir
   dh_auto_configure
   dh_auto_build
   dh_auto_test
 debian/rules binary
dh binary 
   dh_testroot
   dh_prep
   dh_installdirs
   dh_auto_install
   dh_install
   dh_installdocs
   dh_installchangelogs
   dh_installexamples
   dh_installman
   dh_installcatalogs
   dh_installcron
   dh_installdebconf
   dh_installemacsen
   dh_installifupdown
   dh_installinfo
   dh_pysupport
dh_pysupport: This program is deprecated, you should use dh_python2 instead. Migration guide: http://deb.li/dhs2p
   dh_installinit
   dh_installmenu
   dh_installmime
   dh_installmodules
   dh_installlogcheck
   dh_installlogrotate
   dh_installpam
   dh_installppp
   dh_installudev
   dh_installwm
   dh_installxfonts
   dh_installgsettings
   dh_bugfiles
   dh_ucf
   dh_lintian
   dh_gconf
   dh_icons
   dh_perl
   dh_usrlocal
   dh_link
   dh_compress
   dh_fixperms
   dh_installdeb
   dh_gencontrol
   dh_md5sums
   dh_builddeb
dpkg-deb: construyendo el paquete `shellter' en `../shellter_2.0-1_all.deb'.
 dpkg-genchanges  >../shellter_2.0-1_amd64.changes
dpkg-genchanges: incluyendo el código fuente completo en la subida
 dpkg-source --after-build shellter-2.1
dpkg-buildpackage: subida completa; paquete nativo de Debian (se incluye la fuente completa)
~~~

### Check that the package was generated correctly:
    
~~~    
~/shellter-2.1$ ls ../shellter_2.0-1_all.deb
../shellter_2.0-1_all.deb
~~~


Updating the package for a new release
--------------------------------------

If you are going to release the package version x.y-pv:

~~~
x = major number
y = minor number
p = package version
~~~


1- Add entry to `shellter-x.y/debian/changelog`

~~~
shellter (2.1-1) unstable; urgency=low

  * Release 2.1
  * Debian package release 1

 -- KyREcon <shellterproject@hotmail.com>  Thu, 18 Dec 2014 01:26:22 +0100
~~~

2- Rebuild the debian package

~~~
$ debian/rules clean
$ debian/rules binary
~~~


**Note:** Use the script [build.sh](build.sh) to automate the update and build process.


