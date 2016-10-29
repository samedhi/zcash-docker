# zcash-docker

A docker image created by following the insructions at [zcash user guide](https://github.com/zcash/zcash/wiki/1.0-User-Guide).

```
git clone git@github.com:samedhi/zcash-docker.git
cd zcash-docker
docker build -t samedhi/zcash:0.1 .
docker run -t -i samedhi/zcash:0.1 ./src/zcashd
```
