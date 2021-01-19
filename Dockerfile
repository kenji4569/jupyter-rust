FROM rust

# System packages 
RUN apt-get update && apt-get install -y curl cmake

# Install miniconda to /miniconda
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh

# configure & update conda
ENV PATH=/miniconda/bin:${PATH} \
    SHELL=/bin/bash
RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc
RUN conda update -y conda
RUN conda init bash

#RUN mkdir -m777 /opt/rust /opt/cargo
#ENV RUSTUP_HOME=/opt/rust CARGO_HOME=/opt/cargo PATH=/opt/cargo/bin:$PATH
RUN cargo install evcxr_jupyter && \
    evcxr_jupyter --install
SHELL ["/bin/bash", "--login", "-c"] 

RUN conda install -y -c conda-forge nb_conda_kernels notebook
RUN cp -r ./root/.local/share/jupyter/kernels/rust/ ./miniconda/share/jupyter/kernels

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--notebook-dir=/opt/notebooks", "--allow-root", "--no-browser"]