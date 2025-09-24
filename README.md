# Guia de Padrões Git e Comandos Essenciais

Este documento serve como um guia rápido para a utilização da metodologia GitFlow e como uma referência para os comandos básicos do Git. O objetivo é padronizar o fluxo de trabalho e facilitar a colaboração no projeto.

## Metodologia GitFlow Simplificada

O GitFlow é um modelo de ramificação que visa organizar o desenvolvimento e o lançamento de novas funcionalidades. Utilizamos uma abordagem simplificada, focada nas branches `main`, `develop` e `feature`.

### Branches Principais

* **`main`**: Esta branch armazena o código de produção. Nenhum desenvolvimento é feito diretamente aqui. Apenas branches de `release` ou `hotfix` são mescladas na `main`.
* **`develop`**: Esta é a branch principal de desenvolvimento. Ela contém o código mais recente com as novas funcionalidades que foram concluídas. Todo o desenvolvimento começa a partir daqui.

### Fluxo de Desenvolvimento de Novas Funcionalidades (`feature`)

Toda nova funcionalidade ou tarefa deve ser desenvolvida em sua própria branch, que é criada a partir da `develop`.

#### Passo a Passo:

1.  **Sincronize sua branch `develop` local com o repositório remoto:**

    ```bash
    git checkout develop
    git pull origin develop
    ```

2.  **Crie uma nova branch para a sua funcionalidade:**

    O nome da branch deve ser descritivo e, preferencialmente, seguir um padrão, como `feature/nome-da-funcionalidade`.

    ```bash
    git checkout -b feature/exemplo-nova-funcionalidade
    ```

3.  **Desenvolva e faça commits:**

    Trabalhe na sua funcionalidade e faça commits pequenos e descritivos.

    ```bash
    # Adiciona todos os arquivos modificados
    git add .

    # Cria um commit com uma mensagem clara
    git commit -m "Um commit entendível pelos membros do grupo :) "
    ```

4.  **Envie sua branch para o repositório remoto:**

    Isso permite que outros colaboradores vejam seu trabalho e também serve como um backup.

    ```bash
    git push origin feature/exemplo-nova-funcionalidade
    ```

5.  **Ao concluir, mescle sua `feature` na `develop`:**

    Primeiro, volte para a branch `develop` e garanta que ela esteja atualizada.

    ```bash
    git checkout develop
    git pull origin develop
    ```

    Depois, faça o merge da sua branch de funcionalidade.

    ```bash
    git merge feature/exemplo-nova-funcionalidade
    ```

6.  **Envie as alterações para a `develop` remota:**

    ```bash
    git push origin develop
    ```

7.  **Exclua a branch da funcionalidade (opcional, mas recomendado):**

    Após o merge, a branch da feature não é mais necessária.

    ```bash
    # Excluir localmente
    git branch -d feature/exemplo-nova-funcionalidade

    # Excluir remotamente
    git push origin --delete feature/exemplo-nova-funcionalidade
    ```

---

## Guia de Comandos Básicos do Git

Abaixo está uma lista de comandos essenciais do Git para o dia a dia.

### Configuração Inicial
* **`git config --global user.name "Seu Nome"`**
    * Configura o nome que será associado aos seus commits caso não tenha feito essa configuração ainda.

* **`git config --global user.email "seu-email@exemplo.com"`**
    * Configura o e-mail que será associado aos seus commits.

### Iniciando e Clonando
* **`git init`**
    * Inicia um novo repositório Git em um diretório local.

* **`git clone [URL]`**
    * Cria uma cópia local de um repositório remoto.

### Verificando o Estado
* **`git status`**
    * Mostra o estado dos arquivos no diretório de trabalho e na área de preparação (staging area).

* **`git log`**
    * Exibe o histórico de commits.

### Trabalhando com Alterações
* **`git add [arquivo]`**
    * Adiciona um arquivo à área de preparação. Use `git add .` para adicionar todos os arquivos modificados.

* **`git commit -m "Mensagem do commit"`**
    * Salva as alterações da área de preparação no repositório local.

* **`git diff`**
    * Mostra as alterações feitas nos arquivos que ainda não foram para a área de preparação.

### Ramificações (Branches)
* **`git branch`**
    * Lista todas as branches locais.

* **`git checkout [nome-da-branch]`**
    * Muda para a branch especificada.

* **`git checkout -b [nome-da-nova-branch]`**
    * Cria uma nova branch e já muda para ela.

* **`git merge [nome-da-branch]`**
    * Mescla o histórico da branch especificada na branch atual.

### Sincronização com o Repositório Remoto
* **`git pull [remoto] [branch]`**
    * Busca (`fetch`) e mescla (`merge`) as alterações do repositório remoto na sua branch local. Ex: `git pull origin develop`.

* **`git push [remoto] [branch]`**
    * Envia os commits da sua branch local para o repositório remoto. Ex: `git push origin main`.

* **`git fetch`**
    * Busca as informações mais recentes do repositório remoto sem fazer o merge.
