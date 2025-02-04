# 🚀 Scripts de Automação em Bash para Linux  

Este repositório contém scripts de automação em **Bash** para facilitar a administração de usuários em múltiplos servidores Linux.

## 📌 O que você vai encontrar?  
✅ **Script para criação de usuários** 🔹 `create_user.sh`  
✅ **Script para deleção de usuários** 🔹 `delete_user.sh`  

Ambos os scripts permitem a criação e remoção de usuários de forma **automatizada**, evitando a necessidade de realizar essas tarefas manualmente em cada servidor.

## 🛠️ Como funciona?  
Os scripts utilizam uma **lista de servidores** armazenada em um arquivo `.txt`, onde cada linha deve seguir o seguinte formato:

```txt
172.30.175.6:22
192.168.1.10:2222
10.0.0.5:2200
```
📌 **Formato:** `<IP>:<PORTA>`  
📌 **Cada servidor deve estar em uma nova linha**  

## ▶️ Como executar os scripts?  
Para executar um dos scripts, basta rodar o seguinte comando no terminal:

```bash
./nomescript
```

📌 **Atenção!** Antes de rodar os scripts, não esqueça de:  
✅ **Atualizar o arquivo da lista de servidores** com os IPs e portas corretas.  
✅ **Substituir as informações dos usuários** de acordo com sua necessidade.  
✅ **Garantir que seu usuário tenha permissão de execução** nos scripts:

```bash
chmod +x create_users.sh delete_users.sh
```
## Aviso!

O script deve funcionar corretamente na maioria das distribuições Linux baseadas em **Debian (Ubuntu), RHEL (Red Hat, CentOS, Oracle Linux), SUSE, Fedora, AlmaLinux e Rocky Linux**, desde que os seguintes pacotes estejam instalados:

- **bash:** Shell usado no script (presente na maioria das distribuições).
- **sshpass:** Necessário para autenticação SSH automática.
- **useradd:** Utilitário para criar usuários (padrão em distribuições Linux).
- **chpasswd:** Usado para definir a senha do usuário.
- **gpasswd:** Gerencia grupos no Linux.
