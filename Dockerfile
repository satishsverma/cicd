FROM alpine:3.4

RUN touch /satish.txt

CMD ["tail", "-f", "/satish.txt"]
