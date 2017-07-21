#!/bin/bash

PAGE="http://tiggy.tthtesting.co.uk/"
THEME="tiggy-divi"

if perl $HOME/bin/check-wp-theme.pl "$PAGE" "$THEME"; then

  cd /tmp

  chromium --headless --disable-gpu --window-size=1200,900 --screenshot "$PAGE"

  rsync -avP --remove-source-files screenshot.png spike.hexten.net:/opt/tiggy/www/wp-content/themes/tiggy-divi/

  ssh spike.hexten.net 'cd /opt/tiggy; ./tools/fixperms.sh'

else
  echo "$PAGE is not using the $THEME theme"
fi

# vim:ts=2:sw=2:sts=2:et:ft=sh

