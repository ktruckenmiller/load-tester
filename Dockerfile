FROM blazemeter/taurus
COPY entrypoint.sh entrypoint.sh
RUN apt install awscli -y
ENTRYPOINT ["sh", "-c", "./entrypoint.sh \"$@\"", "ignored"]
