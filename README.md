# jupyter-rust
a prototype docker container for jupyter notebooks for rust. Instpired by: https://www.reddit.com/r/rust/comments/ktor8j/beautiful_chord_diagrams_with_rust/

# Summary

A docker image of the jupyter notebooks for rust! I'm new to rust and newer to docker, and I thought it may help to have the jupyter-rust dev env in a docker container. The docker image only has jupyter notebooks for now

There's plenty that can be simplified/cleaned up in the dockerfile. The regular process for getting rust and jupyter playing nice didn't work the same way but I managed to work around it. 

Right now it's working with the latest rust container running 
* RUST_VERSION=1.49.0 with 
* conda 4.9.2 and 
* evcxr_jupyter = "0.8.0".

PRs welcome!

# to run

```
docker build -t zie0/jupyter-rust .
docker run -d --rm -p 8888:8888 -v /local/path/to/notebooks/:/root zie0/jupyter-rust
```

It's recommended you run `docker exec` here without the `-d` so that you can see the access token in the terminal
```
docker exec <CONTAINER ID> jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --no-browser
```

open browser -> localhost:8888
in juptyer UI, kernel > Change Kernel > Rust

![](jupyter-rust_helloWorld.gif)

enjoy tinkering!
