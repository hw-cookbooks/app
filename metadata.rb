maintainer       "Heavy Water Software Inc."
maintainer_email "darrin@heavywater.ca"
license          "Apache 2.0"
description      "Installs/Configures a Rails app"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.0"

supports "ubuntu"

depends "xml"
depends "xslt"
depends "imagemagick"

depends "nginx"
depends "bluepill"
