-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Format: 3.0 (quilt)
Source: cyrus-imapd
Binary: cyrus-common, cyrus-doc, cyrus-imapd, cyrus-pop3d, cyrus-admin, cyrus-murder, cyrus-replication, cyrus-nntpd, cyrus-caldav, cyrus-clients, cyrus-dev, libcyrus-imap-perl
Architecture: any all
Version: 2.5.10-3
Maintainer: Debian Cyrus Team <pkg-cyrus-imapd-debian-devel@lists.alioth.debian.org>
Uploaders: Henrique de Moraes Holschuh <hmh@debian.org>, Ondřej Surý <ondrej@debian.org>, Anthony Prades <toony.debian@chezouam.net>
Homepage: http://www.cyrusimap.org/
Standards-Version: 3.9.6
Vcs-Browser: http://anonscm.debian.org/?p=pkg-cyrus-imapd/cyrus-imapd.git
Vcs-Git: git://anonscm.debian.org/pkg-cyrus-imapd/cyrus-imapd.git
Build-Depends: autotools-dev, bison, comerr-dev, debhelper (>= 9), dh-autoreconf, dh-systemd, flex, ghostscript, groff, libdkim-dev, libdb-dev, libical-dev (>= 2.0.0), libjansson-dev, libkrb5-dev, libkvm-dev [kfreebsd-any], libldap2-dev, libopendkim-dev, libpam0g-dev, libpcre3-dev, libsasl2-dev (>= 2.1.9), libsnmp-dev, libsqlite3-dev, libssl-dev, libtool (>= 2.2~), libwrap0-dev, libxapian-dev, libxml2-dev, libzephyr-dev, perl, pkg-config, po-debconf, sqlite3, transfig, unicode-data, vim-common, xutils-dev
Package-List:
 cyrus-admin deb mail extra arch=all
 cyrus-caldav deb mail extra arch=any
 cyrus-clients deb mail extra arch=any
 cyrus-common deb mail extra arch=any
 cyrus-dev deb devel extra arch=any
 cyrus-doc deb doc extra arch=all
 cyrus-imapd deb mail extra arch=any
 cyrus-murder deb mail extra arch=any
 cyrus-nntpd deb mail extra arch=any
 cyrus-pop3d deb mail extra arch=any
 cyrus-replication deb mail extra arch=any
 libcyrus-imap-perl deb perl extra arch=any
Checksums-Sha1:
 a8330610a239a1fa16c80d417ac1519f7a9ea146 3103914 cyrus-imapd_2.5.10.orig.tar.gz
 ccc34134be0cb5e89d087bbae8ae3530ccd14055 86124 cyrus-imapd_2.5.10-3.debian.tar.xz
Checksums-Sha256:
 b38f4fd72825a298ac47426dcd2a50c8437c2947864ba50d79a9a53fe9845c5f 3103914 cyrus-imapd_2.5.10.orig.tar.gz
 d9974d29e5c08df57e7caec437eff8532b2b3f2361f38fe3b324c61fdf37ab35 86124 cyrus-imapd_2.5.10-3.debian.tar.xz
Files:
 b738adfd7b8aa2c4b95b1d10350450ca 3103914 cyrus-imapd_2.5.10.orig.tar.gz
 6ad3b62d2812cb2e70b1dcc9450f7dfc 86124 cyrus-imapd_2.5.10-3.debian.tar.xz

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJYR+UyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQzMEI5MzNEODBGQ0UzRDk4MUEyRDM4RkIw
Qzk5QjcwRUY0RkNCQjA3AAoJEAyZtw70/LsH/msQANYRyaP3xsejUER0lkyJm9Xo
S06niB8f2RioTxHbM/xIvY+HA/fF/4GYRUr9SQBhFbW4WSvDlFXwgv49GVbhKBpE
0QHjMt06kuIty99rM1cVm9YWkRrgS50triMIxRAfTodEvTzf/yVvAFQT/qOQXuPy
/4gH5SHH0lA/D+iYxrty74oI8lBJymxyLoIivI9kpch0QKoM26HBancyvXNh7/eW
g5sl4kJBWyPgwJOHTa69leJVjxeNUZD9FoLovDcTc5djdkZExRhMvcgTm1CfZDxh
44AdGtWBHit1fsl7MGtl6BOHAAEE/k6fl9l0JXC/vuUOUURKZ+UVz8w9zfzu1weH
X+elx7b3J1NFcToW+cWzadcPFT3bo+zO0u5XalmjCnCquU1umKbI6fy4hio9k7Yg
aoV7N/lqmu8OekTFS2irfnNe1d7Y6PYzQa4makm5VfxZUZ5MKM2VvxVb2VVXA4+C
4IwaQTaV7CyDDLm1tsKXln0Uq5AQYSN5jJc8AMWVSLZSA3c4wcs/R03YGZuUwkny
XvA+4MPcJ9rBFLqYRYfSNhf7WGnGtXBzGWpw15on39mlOSWMAVsax5wMl++FfCqV
jbxOnXMAtvMLqbfNSj5k0f4kLfpOeGxrdBBkL9/ZENraR+dFurlIb519MrwVbAki
mYTF8RbBVaZDJ8XVgy+C
=KL27
-----END PGP SIGNATURE-----
