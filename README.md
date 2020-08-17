# dkube-cicd-project

Example project showing how to use DKube CICD in your project. To use CICD in your project repository, create .dkube-ci.yml.

# Build project docker image using conda environment file
```
conda_env:                        
  path: conda_env.yaml
  r_install_script: install_r_pkgs.sh
```
# Build other docker images
```
images:
  path: images
  images:
    - my-image1
    - my-image2:
      base_image: python:alpine
 ```
  
# Build kubeflow component and pipeline
```
components: # defaults to all components if list is empty
  path: components
  components:
    - name: my_add
    - name: my_divide
      base_image: python:alpine #Used when Dockerfile is missing
      
 pipelines:
  path: pipelines
  pipelines:
    - name: workflow1.py
      run: true # run the pipeline. settings.yaml should contain the param's values
 ```
