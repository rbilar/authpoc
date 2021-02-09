# Solução

Esta POC tem a finalidade de testar a usabilidade do Cancancan dentro das 'minhas' necessidades.

## Linguagem e Tecnologias Utilizadas

O projeto está implementado utilizando a linguagem Ruby, na versão 2.7.2 (https://www.ruby-lang.org/pt/downloads/).

São utilizados também os frameworks e biliotecas abaixo:
- Ruby on Rails: (http://rubyonrails.org/): Framework principal usado para ORM, business, e views.
- Rake: (https://ruby.github.io/rake/): usado para ações de build do projeto.
- Bundler: (http://bundler.io/): usado para gerenciamento de dependencias do projeto.
- Puma: (https://github.com/puma/puma): usado para execução do web server.

Demais bibliotecas podem ser consultadas no arquivo Gemfile.

## Serviços e ferramentas utilizadas

Para execução do sistema, há alguns serviços e ferramentas os quais o projeto é dependente, são eles:
- Postgres (https://www.postgresql.org/): banco de dados usado pelo sistema, com modelo de dados sendo controlado/versionado através de migrations do Rails.

# Para desenvolvedores

## Rodando localmente

Setup de ambiente

- `rails bin/setup && rails db:reset`

Subir o projeto

- `rails s`

## Rodando no Docker

Setup de ambiente

- `docker-compose build`
- `docker-compose run web rails bin/setup && rails db:reset`

Subir o projeto

- `docker-compose up`

## Acessos

| User            | Email               | Password |
| ----------------|:-------------------:|---------:|
| Admin           | admin@bilar.com     | teste123 |
| Manager         | manager@bilar.com   | teste123 |
| Seller          | seller@bilar.com    | teste123 |
| Google Client   | google@bilar.com    | teste123 |
| FaceBook Client | facebook@bilar.com  | teste123 |
| Musk Client     | musk@bilar.com      | teste123 |
