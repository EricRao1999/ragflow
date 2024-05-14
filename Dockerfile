FROM swr.cn-north-4.myhuaweicloud.com/infiniflow/ragflow
USER  root

WORKDIR /ragflow

ADD ./web ./web
# RUN cd ./web && npm i --force && npm run build

ADD ./api ./api
ADD ./conf ./conf
ADD ./deepdoc ./deepdoc
ADD ./rag ./rag

ENV PYTHONPATH=/ragflow/
ENV HF_ENDPOINT=https://hf-mirror.com

ADD docker/entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]