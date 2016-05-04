# Sistema de Control de Prácticas Profesionales y Proyectos de Graduación (Syspg)
## Generalidades 
Existen dos ramas principales para el desarrollo de *Syspg*: la rama [development](https://github.com/efgm1024/syspg/tree/development) y la rama [master](https://github.com/efgm1024/syspg/tree/master).

El propósito de la rama ```development``` es el de estandarizar el entorno de desarrollo y las pruebas que
se hagan en éste. El flujo debe de exigir que una característica que se agregue al sistema *Syspg*
debe ser programada sobre la rama ```development``` y luego transportada a la rama ```master```.

El propósito de la rama ```master``` es contener solamente código que haya sido probado y esté listo para pasar al servidor
de producción que se designe. Tenga en cuenta que exite un apartado para [configuraciones del servidor de producción](#configuraciones-para-el-servidor-de-producción)

## Instalación
### Prerequisitos
Para continuar con la instalación de *Syspg* debe de poseer lo siguiente:

* Un servidor con Ubuntu 14.04 o alguna nueva versión LTS (Long Time Support).
* Un usuario no root que posea privilegios ```sudo```.
* El repositorio con el código fuente del sistema _Syspg_. 

### Requisitos
#### Paso 0 - Instalar NodeJS
Coloque los siguientes comandos para instalar NodeJS
```bash
	sudo apt-get update
	sudo apt-get install nodejs
```

#### Paso 1 - Instalar Nginx
Coloque los siguientes comandos para instalar Nginx
```bash
	sudo apt-get update
	sudo apt-get install curl git-core nginx -y
```

#### Paso 2 - Instalar MySQL
Coloque los siguientes comandos para instalar MySQL
```bash
	sudo apt-get update
	sudo apt-get install mysql-server
```

#### Paso 3 - Crear un usuario para PostgreSQL
PostgreSQL agregó un usuario por defecto llamado ```postgres``` al sistema, a partir de él se crea un nuevo usuario ```syspg``` para
el sistema. Coloque lo siguiente en la terminal
```bash
	sudo -i -u postgres
	createuser --interactive
	# Colocar de nombre syspg
	# Aceptar que sea superusuario
	createdb syspg
	exit
	adduser syspg
	# Colocar las descripciones necesarias
	# Utilizar de password SySpG2016!
```

Para probar que todo se haya realizado correctamente escriba en la consola:
```bash
	sudo -i -u test1
	psql
	\q
```

Para más información visite el [tutorial proporcionado por DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04)

#### Paso 4 - Instalar RVM (Ruby Virtual Machine)
Coloque los siguientes comandos para instalar RVM:
```bash
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	curl -sSL https://get.rvm.io | bash -s stable
	source ~/.rvm/scripts/rvm
	rvm requirements
	rvm install 2.1.8 # Revisar versiones mas actuales si existen
	rvm use 2.1.8 --default # Revisar en función de la versión instalada
```

#### Paso 5 - Instalar Ruby y Bundler
Coloque los siguientes comandos para instalar Rails y Bundler
```bash
	gem install rails -V --no-ri --no-rdoc
	gem install bundler -V --no-ri --no-rdoc
```

#### Paso 6 - Configurar las claves SSH
Verifique antes de comenzar que las claves SSH hayan sido configuradas anteriormente, esto con el propósito de conectarse con Github.com a través del siguiente comando:
```bash
	ssh -T git@github.com
```

Si el resultado es ```Permission denied (publickey).``` proceda a generar una nueva clave SSH, coloque en la consola:
```bash
	ssh-keygen -t rsa
```

Con esto se creó en el directorio ```~/.ssh/id_rsa.pub``` una nueva clave pública. Siga el [tutorial](https://developer.github.com/guides/managing-deploy-keys/) para configurar dicha clave en Github.com

#### Paso 6 - Clonar el repositorio
Clone este repositorio mediante el siguiente comando en la consola:
```bash
	git clone git@github.com:efgm1024/syspg.git
```

#### Paso 7 - Agregar una PC para realizar el deploy
Desde una PC configurada para hacer el deploy hasta el servidor, suponiendo que dicha PC generó su clave pública corra el siguiente comando:

```bash
	cat ~/.ssh/id_rsa.pub | ssh -p <your_port_num> <user_name>@<your_server_ip> 'cat >> ~/.ssh/authorized_keys'
```

Actualmente el puerto es ```2235```, el usuario es ```henry``` y el server es ```fia.unitec.edu```

#### Paso 8 - Realizar el deploy
Desde la misma PC utilizada en el paso anterior descargar el repositorio y posicionarse en la carpeta del mismo en la rama ```master```. Desde ella escribir el siguiente comando:
```bash
	# Si es por primera vez que se realiza el deploy escribir
	cap production deploy:initial
	# caso contrario escribir
	cap production deploy
```

### Configuraciones para el servidor de producción