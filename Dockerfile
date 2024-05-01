FROM python:3.10-alpine
RUN apk --no-cache add exiftool bash flock \
&& pip install --no-cache-dir tqdm==4.66.1

VOLUME /mnt/input
VOLUME /mnt/output

ENV CRON ""
ENV OPTIONS ""


COPY . /opt/phockup
RUN ln -s /opt/phockup/phockup.py /usr/local/bin/phockup
RUN chmod +x /opt/phockup/entrypoint.sh

ENTRYPOINT ["/opt/phockup/entrypoint.sh"]
