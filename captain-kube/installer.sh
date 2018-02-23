 #!/bin/bash

GOOS="GOOS=linux"
GOARCH="GOARCH=amd64"
OUTPUT="ck"

for arg in "$@"
do
    if [[ $arg == GOOS* ]]; then
        GOOS=$arg
    fi
    if [[ $arg == GOARCH* ]]; then
        GOARCH=$arg
    fi
done

if [[ $GOOS == "GOOS=macos" ]]; then
    GOOS="GOOS=darwin"
fi

go get github.com/softleader/captain-kube && \
make -C $GOPATH/src/github.com/softleader/captain-kube $GOOS $GOARCH BINARY=$(pwd) OUTPUT=$OUTPUT

exit 0