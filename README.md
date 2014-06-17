M-Files extension for LemonLDAP::NG
===================================

An extension for LemonLDAP::NG to to Single Sign On on M-Files.

Presentation
------------

[M-Files](https://en.wikipedia.org/wiki/M-Files) is an enterprise content management solution, developed by the M-Files Corporation.

[LemonLDAP::NG](http://lemonldap-ng.org) is a free WebSSO product.

This extension allows to request a token to M-Files, and use it in a header to provide SSO trough LemonLDAP::NG. The use of M-Files webservices is documented on [M-Files site](http://www.m-files.com/mfws/gettingstarted.html).

Installation
------------

Install this extension like documented on [LemonLDAP::NG project wiki](http://lemonldap-ng.org/documentation/latest/customfunctions):
+ Load module in Handler apache configuration file
    PerlRequire /root/lemonldap-ng/MFilesExtension.pm
+ Declare `MFilesExtension::getMFilesToken` in custom functions
+ Desactive Safe jail
+ Store password in session
+ Create a macro to fetch the token at authentication step:
    MFilesToken => getMFilesToken($uid,$_password,"{Vault Guid}","https://xxx/REST/server/authenticationtokens")
+ In virtual host, add the `X-Authentication` header:
    X-Authentication => $MFilesToken

