FROM rust:1.49

# System packages 
RUN apt-get update && apt-get install -y curl cmake

# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b && \
    rm Miniconda3-latest-Linux-x86_64.sh

# configure & update conda
ENV PATH=/miniconda/bin:${PATH} \
    SHELL=/bin/bash
RUN /bin/bash -c "source ~/.bashrc" && \
    conda init bash && \
    conda update -y conda && \
    conda install -y -c conda-forge nb_conda_kernels notebook

# install evcxr_jupyter
RUN cargo install evcxr_jupyter && \    
    evcxr_jupyter --install

# hack
RUN cp -r ./root/.local/share/jupyter/kernels/rust/ ./miniconda/share/jupyter/kernels

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--notebook-dir=/opt/notebooks", "--allow-root", "--no-browser"]