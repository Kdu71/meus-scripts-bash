#!/bin/bash

# --- Verifica se o script está sendo executado como root ---
if [[ $EUID -ne 0 ]]; then
   echo "Este script deve ser executado como root. Use 'sudo ./setup.sh'." 
   exit 1
fi

echo "--- Iniciando a configuração... ---"

# --- Criação dos diretórios na raiz ---
echo "Criando diretórios..."
mkdir /publico /adm /ven /sec

# --- Atribuindo a propriedade dos diretórios ao usuário root ---
chown root:root /publico /adm /ven /sec
echo "Diretórios criados e propriedade definida para root."

# --- Criação dos grupos de usuários ---
echo "Criando grupos de usuários..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo "Grupos criados."

# --- Criação dos usuários e atribuição aos grupos ---
echo "Criando usuários e adicionando aos grupos..."

# Grupo GRP_ADM
useradd carlos -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM

# Grupo GRP_VEN
useradd debora -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN

# Grupo GRP_SEC
useradd josefina -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC

echo "Usuários criados e adicionados aos seus respectivos grupos. A senha padrão para todos é 'Senha123'."

# --- Configuração das permissões de diretório ---
echo "Definindo permissões de diretório..."

# Permissão para o diretório publico: total para todos os usuários
chmod 777 /publico

# Permissões para os diretórios de grupo
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Permissões de diretório configuradas com sucesso!"
echo "--- Configuração finalizada. ---"