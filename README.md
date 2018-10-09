# pgpool-docker

PGPool2 3.7.5 的 debian9 docker image

## 運行

```
docker run -it --rm rueian/pgpool:3.7.5-debian9
```

掛入 config 的方法請參考 docker-compose.yml 與下方說明

## docker-compose 測試方法:

docker-compose 僅供示範測試

```
docker-compose up -d
```

pgpool 需要三個設定檔分別是 pgpool.conf, pcp.conf, pool_hba.conf 可在執行時掛入 /etc/pgpool/ 底下，
會由 docker-entrypoint.sh 將三個檔案複製到 /etc/ 底下給 pgpool 執行檔載入