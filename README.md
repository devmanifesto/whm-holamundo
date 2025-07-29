# WHM Plugin - Hola Mundo

Este es un ejemplo mínimo de un plugin para WHM que muestra "Hola Mundo" y se integra al menú lateral.

## Instalación

```bash
git clone https://github.com/TU_USUARIO/whm-holamundo.git
cd whm-holamundo
chmod +x install.sh
sudo ./install.sh
```

Luego ingresá a WHM > Plugins > Hola Mundo.

## Estructura

- `hostium_holamundo.cgi`: Script que responde al clic del plugin.
- `hostium_holamundo.conf`: Configuración para registrar el plugin.
- `install.sh`: Script de instalación automatizado.
