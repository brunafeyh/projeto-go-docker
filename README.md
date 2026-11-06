# Full Cycle Rocks!!

Aplicação mínima em Go, empacotada em uma imagem Docker multi-stage. O estágio
final usa `scratch`, que não inclui sistema operacional ou ferramentas extras,
mantendo a imagem pequena.

## Imagem no Docker Hub

Link direto: https://hub.docker.com/r/12345678989/fullcycle

## Baixar e executar

```sh
docker pull 12345678989/fullcycle
docker run --rm 12345678989/fullcycle
```

Saída esperada:

```text
Full Cycle Rocks!!
```

## Construir e publicar

```sh
docker build -t 12345678989/fullcycle .
docker login
docker push 12345678989/fullcycle
```

A aplicação é compilada estaticamente com CGO desabilitado. As opções
`-trimpath` e `-ldflags="-s -w -buildid="` removem caminhos locais, símbolos de
depuração e o identificador de build. O UPX compacta o executável, e somente
ele é copiado para a imagem final `scratch`.
