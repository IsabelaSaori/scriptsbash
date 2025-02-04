#!/bin/bash

# Definição do login a ser removido
login="login"

for line in $(cat serverslist.txt); do
    echo "#####################################################################################"
    echo ""

    # Extrai o hostname e a porta usando o caractere delimitador ':'
    host=$(echo $line | cut -d':' -f1 | tr -d '\r')
    port=$(echo $line | cut -d':' -f2 | tr -d '\r')

    echo "Host: $host"
    echo "Porta: $port"
    echo ""

    # Comandos remotos para remover o usuário e seus diretórios
    remote_commands=(
        "sudo gpasswd -d $login grupo"  # Remove do grupo, altere para o nome do grupo que deseja remover
        "sudo userdel -r $login"            # Remove o usuário e o diretório /home
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
