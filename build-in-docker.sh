# docker run -it --rm -v .:/go/src golang:1.24-alpine3.22 ash

cd /go/src

VERSION=$(cat .version)

export GOOS=linux
export GOARCH=arm64
DIR=$(mktemp -d)
mkdir "$DIR/age"
go build -o "$DIR/age" -ldflags "-X main.Version=$VERSION" -trimpath ./cmd/...
tar -czvf "age-$VERSION-$GOOS-$GOARCH.tar.gz" -C "$DIR" age


export GOOS=linux
export GOARCH=amd64
DIR=$(mktemp -d)
mkdir "$DIR/age"
go build -o "$DIR/age" -ldflags "-X main.Version=$VERSION" -trimpath ./cmd/...
tar -czvf "age-$VERSION-$GOOS-$GOARCH.tar.gz" -C "$DIR" age
