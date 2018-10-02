FROM perl:5-slim
LABEL maintainer="Mostafa Hussein <mostafa.hussein91@gmail.com>"
COPY . /home/joomscan
WORKDIR /home/joomscan
RUN adduser joomscan --disabled-password --disabled-login --gecos "" --no-create-home --home /home/joomscan && chown joomscan:joomscan /home/joomscan -R
RUN apt-get update && apt-get install -y --no-install-recommends gcc=4:6.3.0-4 && rm /var/lib/apt/lists/* -R
USER joomscan
ENTRYPOINT ["perl", "joomscan.pl"]
CMD ["-h"]
