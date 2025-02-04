#!/bin/bash

# Definição do login e senha
login="login"
senha="senha"

for line in $(cat serverslist.txt); do
    echo "#####################################################################################"
    echo ""

    # Extrai o hostname e a porta usando o caractere delimitador ':'
    host=$(echo $line | cut -d':' -f1 | tr -d '\r')
    port=$(echo $line | cut -d':' -f2 | tr -d '\r')

    echo "Host: $host"
    echo "Porta: $port"
    echo ""

    # Comandos remotos para criação de usuário, setar senha e adicionar ao grupo 
    remote_commands=(
        "sudo useradd $login -s /bin/bash"
        "echo '$login:$senha' | sudo chpasswd"
        "sudo gpasswd -a $login Grupo" #Nome do grupo
    )

    # Loop para executar os comandos remotos
    for command in "${remote_commands[@]}"; do
        echo "#####################################################################################"
        echo "Executando comando remoto: $command"
        echo ""
        sshpass -p 'senhadeacessoaoservidor' ssh -o ConnectTimeout=5 -p "$port" -o StrictHostKeyChecking=no -t usuariodeacessoaoservidor@$host "$command"
    done
done

#Importante! Nesta última parte utilize seu login e senha de acesso aos servidores

