# docker-revive-adserver
## 如何使用
```
// 生成docker镜像
docker build -t revive-adserver:5.0.0 .

// 创建docker容器
docker run -p 80:80 -e REVIVE_DB_HOST=172.17.0.3 -e REVIVE_DB_USER=root -e REVIVE_DB_PASSWORD=123456 -e REVIVE_DB_NAME=revive -e REVIVE_WEB_DOMAIN=121.41.4.137 --name revive -d revive-adserver:5.0.0
```
