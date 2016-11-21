# pgpool-docker

PGPool2 的 docker image

由於 hba 全開，故此 image 只能用在測試環境

##使用方法:

先開一個 pg

```
docker run -d --name postgres postgres
```

再開 pgpool ，注意 BACKEND_HOSTNAME

```
docker run -d --name pgpool --link postgres -p 5433:5433 -e "BACKEND_HOSTNAME=postgres" rueian/pgpool-docker
```
