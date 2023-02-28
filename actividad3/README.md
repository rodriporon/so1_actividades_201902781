# Solución al problema en el contendedor de React

## Problema

El problema se da por el motivo que react solo sirve un archivo index.html, por lo que se le debe indicar cómo redireccionar rutas correctamente.

Para ello se debe crear un archivo de configuración Nginx que incliya las reglas de redireccionamiento que se necesiten, como el siguiente:

```nginx
server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html;
        try_files $uri $uri/ /index.html;
    }
}
```

Y en el Dockerfile se debe incluir la copia del archivo de configuración y la ejecución del servidor Nginx:

```dockerfile
COPY nginx.conf /etc/nginx/nginx.conf
COPY build /usr/share/nginx/html
```

Con esto se copia el archivo "nginx.conf" en el directorio "/etc/nginx" del contenedor y se copia la aplicación React compilada en el directorio "/usr/share/nginx/html". Se debe asegurar que la aplicación React esté compilada antes de construir el contendedor.

Por ultimo para construir el contenedor se debe ejecutar el siguiente comando:

```bash
docker build -t my-nginx-container .
docker run -p 80:80 my-nginx-container
```

## Referencias

- [React in Docker with Nginx, built with multi-stage Docker builds, including testing](https://tiangolo.medium.com/react-in-docker-with-nginx-built-with-multi-stage-docker-builds-including-testing-8cc49d6ec305)

