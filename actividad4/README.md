# systemd unit de tipo servicio

## Proceso de instalación

1. Crear un script que imprima un saludo y la fecha actual.

```bash
#!/bin/bash
echo "Hola mi carnet es 201902781, hoy es $(date)"
```

Se debe asegurar que el script tenga lo permisos de ejecución.

```bash
chmod +x saludo.sh
```

2. Crear un systemd service unit. El archivo debe llamarse `saludo.service` y debe estar en la carpeta `/etc/systemd/system/`.

```bash
[Unit]
Description=Saludo

[Service]
Type=simple
ExecStart=/home/usuario/saludo.sh

[Install]
WantedBy=multi-user.target
```

3. Recargar los archivos de configuración de systemd.

```bash
systemctl daemon-reload
```

4. Habilitar el servicio para que se ejecute al iniciar el sistema.

```bash
systemctl enable saludo.service
```

5. Iniciar el servicio.

```bash
systemctl start saludo.service
```

6. Verificar que el servicio se está ejecutando.

```bash
systemctl status saludo.service
```
