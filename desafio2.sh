#!/bin/bash

echo "Iniciando a atualização do servidor..."
sudo apt update -y
sudo apt upgrade -y
echo "Servidor atualizado."

echo "Instalando o Apache2 e o Unzip..."
sudo apt install apache2 -y
sudo apt install unzip -y
echo "Apache2 e Unzip instalados."

echo "Criando diretório temporário..."
sudo mkdir /tmp
echo "Diretório /tmp criado."

echo "Baixando o site de exemplo..."
sudo wget -O /tmp/main.zip https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
echo "Site baixado para /tmp/main.zip"

echo "Descompactando o arquivo..."
sudo unzip /tmp/main.zip -d /tmp
echo "Arquivo descompactado."

echo "Copiando os arquivos do site para o diretório do Apache2..."
sudo cp -R /tmp/linux-site-dio-main/* /var/www/html/
echo "Arquivos copiados. O site já está disponível."

echo "Limpando arquivos temporários..."
sudo rm -rf /tmp/main.zip /tmp/linux-site-dio-main
echo "Limpeza concluída."

echo "Processo finalizado com sucesso."