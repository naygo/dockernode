# qual versão de qual máquina 
FROM node:alpine 

# diretório
WORKDIR /usr/app

# copia para  o container e executa o RUN
COPY package*.json ./
RUN npm install

# copia todo o restante dos arquivos 
COPY . .

# qual porta o servidor do container expõe para o exterior
EXPOSE 3000

# propriedade única por docker file
# indica qual o comando o servidor precisa rodar para startar
CMD ["npm", "start"]

#### docker build -t nayla/dockernode . ####
#### docker run -p 3000:3000 -d nayla/dockernode ####


