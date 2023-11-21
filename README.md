# Back-end do MedCheck
<img alt="Static Badge" src="https://img.shields.io/badge/Ruby-red">


## Sobre o projeto
Este é um projeto de avaliação para a matéria MATA76-Linguagens para aplicação comercial do curso Sistemas de Informação (UFBA), para o desenvolvimento da aplicação MedCheck foi escolhida a linguagem Ruby com o framework Ruby On Rails para o back-end e para o front-end foi escolhida a biblioteca ReactJs, além disso foi utilizada a biblioteca Axios para fazer a conexão entre o back-end e o front-end. Esse projeto consiste em uma plataforma para a marcação de consultas médicas por parte dos pacientes e de gerenciamento dos atendimentos por parte dos médicos. O sistema foi pensado de uma forma que os usuários poderiam ter o acesso às consultas marcadas e aos prontuários, enquanto que para os médicos teria a possibilidade dele visualizar todas as consultas que foram agendadas com ele, além disso ele poderá preencher os prontuários diretamente pela plataforma.


## Diagrama UML
![Diagrama](https://github.com/the-bugs/medcheck-backend-rails/blob/main/doc/diagrama/diagrama.png)

## Como executar o projeto

### Primeiramente deverá ser feita a instalação do Ruby e do Ruby On Rails
<br />

**1º Passo:** O usuário deverá instalar a imagem do Ubuntu através da Microsoft Store, recomenda-se que seja escolhida a versão mais atual ou com suporte LTS;
<br />


**2º Passo:** O rvm tem de ser instalado para que em seguida seja instalado o Ruby. Para executar esse procedimento o usuários terá que executar os comandos na seguinte ordem através da imagem do Ubuntu:


  * > $ gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3    7D2BAF1CF37B13E2069D6956105BD0E739499BDB

  * > $ \curl -sSL https://get.rvm.io | bash
<br />

**3º Passo:** Agora de fato será instalado o Ruby, o rvm tem uma característica de permitir instalar qualquer versão preterida pelo usuário, porém será feita a instalação da versão mais atual através do comando:


* > $ rvm ruby install 3.0.2
<br />

**4º Passo:** Para instalar o framework Ruby on Rails basta rodar o comando:


* > $ gem install rails


### Executando o projeto

Para executar o projeto será necessário primeiramente clonar o repositório e em seguida executar dentro da pasta da aplicação o comando: $ bin/rails server. 


## Informações das versões:

* Ruby version: 3.0.2

* Ruby On Rails version: 7.0.8


