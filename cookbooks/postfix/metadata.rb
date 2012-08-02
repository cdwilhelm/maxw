maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures postfix"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe "postfix::default" , "Install and configure postfix"

attribute "smtp_provider/fqdn",
  :display_name => "",
  :description => "",
  :required => "required",
  :default => "",
  :recipes => [
    "postfix::default"
  ]
  
attribute "smtp_provider/user",
  :display_name => "",
  :description => "",
  :required => "required",
  :recipes => [
    "postfix::default"
  ]

attribute "smtp_provider/password",
  :display_name => "",
  :description => "",
  :required => "required",
  :recipes => [
    "postfix::default"
  ]