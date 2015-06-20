#!/bin/bash

/opt/glassfish4/bin/asadmin start-domain
/opt/glassfish4/bin/asadmin set --user admin server.jms-service.jms-host.default_JMS_host.admin-password=admin

# change the password
cat  <<EOF >> /tmp/passwords.txt
AS_ADMIN_PASSWORD=
AS_ADMIN_NEWPASSWORD=admin
EOF
/opt/glassfish4/bin/asadmin --passwordfile /tmp/passwords.txt --user admin change-admin-password
rm -f /tmp/passwords.txt

cat  <<EOF >> /opt/glassfish4/bin/passwords.txt
AS_ADMIN_PASSWORD=admin
AS_ADMIN_ADMINPASSWORD=admin
AS_ADMIN_USERPASSWORD=admin
AS_ADMIN_MASTERPASSWORD=admin
EOF

/opt/glassfish4/bin/asadmin  --passwordfile /opt/glassfish4/bin/passwords.txt --user admin enable-secure-admin
/opt/glassfish4/bin/asadmin stop-domain
/opt/glassfish4/bin/asadmin start-domain

# deploy war file
yes y | /opt/glassfish4/bin/asadmin --passwordfile /opt/glassfish4/bin/passwords.txt --user admin deploy /home/glassfish/hello.war
/opt/glassfish4/bin/asadmin stop-domain
