maintainer       "maxw"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures fail2ban"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"


recipe "fail2ban::default", "install and configure fail2ban"