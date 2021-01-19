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

# To Run

```
git clone https://github.com/Zie0/jupyter-rust.git
docker build -t zie0/jupyter-rust .
```

Then change to the local directory you would like to store your notebooks.
NOTE: the `JUPYTER_TOKEN` below is an example, it's recommended that it is changed.
```
export JUPYTER_TOKEN='super-secret-example-password'
docker run -it -d --rm -p 8888:8888 -v ${PWD}:/opt/notebooks -e JUPYTER_TOKEN zie0/jupyter-rust
```

open browser -> localhost:8888?token=super-secret-example-password

in juptyer UI, kernel > Change Kernel > Rust

![](jupyter-rust_helloWorld.gif)

enjoy tinkering!
