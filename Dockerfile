FROM python:3-alpine
ENV USER=app
ENV GRP=appgroup
ENV USERID=1001
ENV GID=1001
RUN addgroup -g $USERID $GRP && \
    adduser --shell /sbin/nologin --disabled-password \
    --no-create-home --uid $USERID --ingroup $GRP $USER \
	&& mkdir -p /app 
COPY --chown=$USER:$USER ./app/index.html /app
USER $USER
WORKDIR /app
CMD python -m http.server 8000
EXPOSE 8000