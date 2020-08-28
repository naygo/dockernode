# Docker

**Cria containers para armazenar e rodar tudo que as aplicações precisam.**

*Container = mini sistema operacional*

Arquivo docker file contém todas as instruções para a aplicação rodar.

Exemplo de docker file:
```docker
# q**ual versão de qual máquina**
FROM node:alpine

# d**iretório**
WORKDIR /usr/app

# copia todo o restante dos arquivos**
COPY . .

# qual porta o servidor do container expõe para o exterior
EXPOSE 3000

# copia para o container e executa o RUN
COPY package*.json ./
RUN npm install

# indica qual o comando o servidor precisa rodar para startar 
# propriedade única por docker file
CMD ["npm", "start"]

# rodando
docker build -t nayla/dockernode .

docker run -p 3000:3000 -d nayla/dockernode

```

# Docker Compose

**Orquestrador de containers do Docker**

Ele define como cada container deve se comportar dentro de uma aplicação

Exemplo de utilização do *volumes* para atualizações no código serem feitas de forma automática com o *nodemon*

```docker
# v**ersão do compose**
version: "3"
# s**erviços da aplicação**
services:
	dockernode:
		# localização do docker file
		build: .
		# comando a ser executado quando a aplicação subir
		command: npm start
		# redirecionamento de portas
		ports:
			- "3000:3000"
		# qual pasta as alterações serão refletidas
		volumes:
			- .:/usr/app
```
