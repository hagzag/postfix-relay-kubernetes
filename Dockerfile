FROM alpine:3.12.1

LABEL maintainer Haggai Philip Zagury <hagzag@tikalk.dev>

# Install postfix and supervisor
RUN apk add --no-cache \
    postfix \
    rsyslog \
	libsasl \
	cyrus-sasl-plain \
	cyrus-sasl-login \
    supervisor && \
    /usr/bin/newaliases

# Copy files into container
COPY . /

# SMTP port
EXPOSE 25

ENTRYPOINT [ "/entrypoint.sh" ]
