# jupyter-rust
a docker container for jupyter notebooks for rust

# Summary

Intended for exploratory/academic purposes only. Insecure and to be run locally only. PRs welcome!

# to run

```
docker build -t zie0/jupyter-rust
docker run -it -d --rm -p 8888:8888 -v /local/path/to/notebooks/:/root zie0/jupyter-rust
docker exec -d <CONTAINER ID> jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --no-browser
```

open browser -> localhost:8888
in juptyer UI, kernel > Change Kernel > Rust
enjoy tinkering!