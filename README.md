# Debian Stretch cyrus-imapd

IF YOU USE THIS REPO AND THE FILES PROVIDED YOU DO IT ON YOUR OWN RISK!<br>
IF YOU USE THIS REPO AND THE FILES PROVIDED YOU DO IT ON YOUR OWN RISK!<br>
IF YOU USE THIS REPO AND THE FILES PROVIDED YOU DO IT ON YOUR OWN RISK!

For me the packages work fine and my problems are fixed but use them at your own risk, if in doubt keep using the official debian packages


It seem that the cyrus imapd in Debian isn't realy maintained at the moment ( 11/16/2017 ).<br>
I recompiled it for my own use with some bugfixes:

[#863520 - cyrus-imapd version 2.5.10-3 Fatal error with SSL](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863520)

[#879007 - cyrus-imapd does not accept new connections](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=879007)

Not an official Bug but useless and anoying is this warning:<br>
"cyrus/imaps[1518]: TLS server engine: No client CA certs specified. Client side certs may not work"<br>
It fills up the logs if you use TLS without client certs because it gets triggered everytime a new connection is initialized.
I removed it in this packages. 

To install this version you can either use the compiled amd64 debs in [Packages](Packages/) or recompile the package by cloning this repo and applying the patches under [Patches](Patches/)

And again:

For me the packages work fine and my problems are fixed but use them at your own risk, if in doubt keep using the official debian packages

IF YOU USE THIS REPO AND THE FILES PROVIDED YOU DO IT ON YOUR OWN RISK!<br>
IF YOU USE THIS REPO AND THE FILES PROVIDED YOU DO IT ON YOUR OWN RISK!<br>
IF YOU USE THIS REPO AND THE FILES PROVIDED YOU DO IT ON YOUR OWN RISK!
