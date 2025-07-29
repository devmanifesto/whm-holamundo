#!/bin/bash

PLUGIN_NAME="hostium_holamundo"

echo "📁 Instalando plugin WHM: $PLUGIN_NAME"

# Eliminar versión anterior si existe
rm -f /usr/local/cpanel/whostmgr/docroot/cgi/$PLUGIN_NAME.cgi
rm -f /var/cpanel/apps/$PLUGIN_NAME.conf

# Copiar CGI
cp $PLUGIN_NAME.cgi /usr/local/cpanel/whostmgr/docroot/cgi/$PLUGIN_NAME.cgi
chmod 755 /usr/local/cpanel/whostmgr/docroot/cgi/$PLUGIN_NAME.cgi

# Copiar archivo de configuración
cp var/cpanel/apps/$PLUGIN_NAME.conf /var/cpanel/apps/$PLUGIN_NAME.conf

# Registrar el plugin
/usr/local/cpanel/bin/register_appconfig /var/cpanel/apps/$PLUGIN_NAME.conf
/usr/local/cpanel/bin/rebuild_whm_chrome

echo "✅ Plugin instalado. Aparece en WHM > Plugins > Hola Mundo"
