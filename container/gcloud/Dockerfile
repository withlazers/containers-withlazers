FROM alpine:3.21
ARG VERSION=514.0.0

RUN apk add --no-cache python3 bash && \
	adduser -D -s /bin/bash -G wheel gcloud && \
	mkdir -p /opt/gcloud && \
	chown -R gcloud /opt/gcloud && \
	printf ". /opt/gcloud/google-cloud-sdk/%s.bash.inc\n" completion path >> /etc/bash/bashrc

USER gcloud

RUN wget -O - https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${VERSION}-linux-x86_64.tar.gz | tar -C /opt/gcloud -xz && \
	/opt/gcloud/google-cloud-sdk/install.sh --quiet --usage-reporting false --path-update false --bash-completion false

CMD ["/bin/bash"]
