#!/bin/bash
platform='unknown'
unamestr=$(uname)

# verificar o tipo de sistema operacional
platform='unknown'
unamestr=$(uname)

#[iniciamdo Configuração] Configurando figlet para mostrar texto
# como prompt

command -v figlet >/dev/null 2>&1 || { echo >&2 "Instalando figlet...";  }

if ! command -v figlet &> /dev/null
then
printf "\n\nPlataforma: $unamestr\n\n"

if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
   apt-get install figlet -y
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='darwin'
   brew install figlet
fi
printf "\n\ninstalado com sucesso.\n\n"
fi
#[Fim configuração]

if command -v figlet >/dev/null 2>&1
then
    figlet -w 500 unig4construction
fi

echo "Desejas construir a imagem (y/N)"
read cmd
if [[ $cmd == "y" || $cmd == 'Y' ]]; then
  docker-compose -f docker-compose.yml -f infrastructure/docker-compose.yml up --build
else
  docker-compose -f docker-compose.yml -f infrastructure/docker-compose.yml up
fi


