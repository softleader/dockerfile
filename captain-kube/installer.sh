 #!/bin/bash

GOOS=""
GOARCH=""
OUTPUT=ck

for arg in "$@"
do
    if [[ $arg == GOOS* ]]; then
        GOOS=$arg
    fi
    if [[ $arg == GOARCH* ]]; then
        GOARCH=$arg
    fi
done

if [[ -z $GOOS ]]; then
    GOOS="GOOS=linux"
fi

if [[ -z $GOARCH ]]; then
    GOARCH="GOARCH=amd64"
fi

if [[ $GOOS == "GOOS=macos" ]]; then
    GOOS="GOOS=darwin"
fi

go get github.com/softleader/captain-kube && \
make -C $GOPATH/src/github.com/softleader/captain-kube $GOOS $GOARCH BINARY=$(pwd) OUTPUT=$OUTPUT

exit 0