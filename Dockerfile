FROM python:3.10-alpine
RUN apk --no-cache add exiftool \
    && pip install --no-cache-dir -r /opt/phockup/requirements.txt \
    && apk add bash \
    && apk add flock

VOLUME /mnt/input
VOLUME /mnt/output

ENV CRON ""
ENV OPTIONS ""

RUN ln -s /opt/phockup/phockup.py /usr/local/bin/phockup \
COPY . /opt/phockup
RUN chmod +x /opt/phockup/entrypoint.sh

ENTRYPOINT ["/opt/phockup/entrypoint.sh"]
