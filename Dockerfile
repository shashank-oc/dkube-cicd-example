FROM ocdr/d3cicd_base:0.1.0

ADD conda_env.yaml .
RUN conda env create -f conda_env.yaml && \
    conda clean -afy && conda init bash && \
    echo "source activate dkube-env" > ~/.bashrc

RUN touch /built_using_dockerfile
ENV PATH=/opt/conda/envs/dkube-env/bin:$PATH