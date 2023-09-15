# Etapa de Compilação
FROM golang:latest AS build

WORKDIR /usr/src/go

COPY hello.go .

RUN go build -o hello hello.go


#Etapa final
FROM scratch

COPY --from=build /usr/src/go/hello /usr/src/go/hello

CMD ["/usr/src/go/hello"]
