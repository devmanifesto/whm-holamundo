#!/bin/bash

PLUGIN_NAME="hostium_holamundo"

echo "🔍 Verificando plugin WHM: $PLUGIN_NAME"

echo -n "📁 Verificando existencia del archivo de configuración... "
if [ -f /var/cpanel/apps/$PLUGIN_NAME.conf ]; then
  echo "✅"
else
  echo "❌ NO ENCONTRADO"
fi

echo -n "🔧 Registrando plugin... "
/usr/local/cpanel/bin/register_appconfig /var/cpanel/apps/$PLUGIN_NAME.conf 2>/dev/null && echo "✅" || echo "❌"

echo -n "🔄 Reconstruyendo menú de WHM... "
/usr/local/cpanel/bin/rebuild_whm_chrome 2>/dev/null && echo "✅" || echo "❌"

echo -n "🎯 Verificando CGI en su lugar... "
if [ -x /usr/local/cpanel/whostmgr/docroot/cgi/$PLUGIN_NAME.cgi ]; then
  echo "✅"
else
  echo "❌ CGI no encontrado o sin permisos"
fi

echo -n "🧪 Test de salida CGI... "
output=$(bash /usr/local/cpanel/whostmgr/docroot/cgi/$PLUGIN_NAME.cgi | grep 'Hola Mundo')
if [[ "$output" == *"Hola Mundo"* ]]; then
  echo "✅ OK"
else
  echo "❌ NO responde correctamente"
fi
