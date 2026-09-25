# Cluster Kubernetes Local - DevOps

Este projeto tem como objetivo o provisionamento automatizado de um cluster Kubernetes local utilizando **Terraform** em conjunto com a ferramenta **Kind (Kubernetes in Docker)**.

## Especificações do Ambiente
* **Nome do Cluster:** `devops`
* **Topologia:** 3 nodes no total (1 `control-plane` e 2 `workers`)
* **Ferramenta de Provisionamento:** Terraform (Provedor `tehcyx/kind`)

## Componentes Criados e Arquitetura

O Kind cria os nodes do Kubernetes como containers Docker isolados, simulando um ambiente de infraestrutura real na sua máquina local. Abaixo estão os principais componentes provisionados e suas respectivas funções:

1. **Control-Plane (`devops-control-plane`):**
   * **Função:** Atua como o cérebro do cluster. Executa o *API Server* (ponto de entrada para comandos `kubectl`), o *Controller Manager* (gerencia o estado dos objetos do Kubernetes), o *Scheduler* (agenda os pods nos nodes disponíveis) e o armazenamento de estado `etcd`.

2. **Workers (`devops-worker` e `devops-worker2`):**
   * **Função:** São os nós de trabalho onde as aplicações e cargas de trabalho (Pods) de fato rodam. Cada worker executa o *Kubelet* (agente que se comunica com o control-plane) e o *Kube-Proxy* (responsável pelo roteamento de rede).

3. **Rede Docker Bridge (`kind`):**
   * **Função:** Uma rede virtual interna criada pelo Docker que conecta os três containers (o controller e os dois workers), permitindo a comunicação interna do cluster Kubernetes.

## Instruções de Uso

1. Certifique-se de ter o **Docker**, o **Terraform** e o **kubectl** instalados.
2. Inicialize o provedor do Terraform:
   ```bash
   terraform init

#teste1
#testando2