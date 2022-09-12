FROM docker:dind

RUN apk add --update --no-cache bash zip sshpass
COPY sftp-image.sh /sftp-image.sh
RUN chmod +x /sftp-image.sh
ENTRYPOINT [ "/bin/bash", "/sftp-image.sh" ]
