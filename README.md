# jupyter-rust
a prototype docker container for jupyter notebooks for rust. Inspired by: https://www.reddit.com/r/rust/comments/ktor8j/beautiful_chord_diagrams_with_rust/

# Summary

A docker image of the jupyter notebooks for rust! The implementation is a bit of a hack to adapt existing install processes to this format. It is portable enough and gets the job done.

# To Run
1. clone the repo

from within the local repo workspace
2. `docker-compose up`

3. open link > new > Rust

to change kernel
kernel > Change Kernel > (Rust|python3)

![](jupyter-rust_helloWorld.gif)

enjoy tinkering!

# Image Details

It's working with the latest rust container running 
* base docker image -> rust:1.49
* conda version -> 4.9.2 
* jupyter version -> 4.7.0
* evcxr_jupyter = "0.8.0"

## Jupyter Version Details
```
# jupyter --version
jupyter core     : 4.7.0
jupyter-notebook : 6.2.0
qtconsole        : not installed
ipython          : 7.12.0
ipykernel        : 5.4.2
jupyter client   : 6.1.11
jupyter lab      : not installed
nbconvert        : 6.0.7
ipywidgets       : not installed
nbformat         : 5.1.2
traitlets        : 5.0.5
```