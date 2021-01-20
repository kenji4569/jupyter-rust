# jupyter-rust Summary
A prototype docker container for jupyter notebooks for rust. Inspired by: [evcxr_jupyter](https://github.com/google/evcxr/blob/master/evcxr_jupyter/README.md)

# Usage

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

in jupyter notebook UI, kernel > Change Kernel > Rust

![](jupyter-rust_helloWorld.gif)

# Image Details

Image components' versions:
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
