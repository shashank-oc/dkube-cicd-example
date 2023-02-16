# Regression demo complete pipeline run instructions.
1. Download the pipeline tar file from the URL below, 
2. For Dkube 2.1.6 or later use
	https://github.com/oneconvergence/dkubeio-examples/blob/master/tf/clinical_reg/pipeline/dkube_regression_pl_full.tar.gz(https://github.com/oneconvergence/dkubeio-examples/blob/master/tf/clinical_reg/pipeline/dkube_regression_pl_full.tar.gz)*
3. Upload the tar file into DKube from the pipeline page. 
4. Open the pipeline and click create a run.
5. Fill the details
    a. Run name
    b. Access_url: URL of DKube set-up home page
        i. Eg: https://1.2.3.4:32222
       ii. Note there should not be any other character after the port no 32222.
    c. User: user name
        i. Login user, Eg: ocdkube 
       ii. Git user Eg: ocdkube (github ID) in case of gitauth
    d. Auth token: Copy the auth token from developer settings and fill into the auth-token field
6. Click on Create Run
7. A test inference will be created by the pl, 
8. Model Publish,
   a. Click publish model
   b. Serving image: default
   c. Transformer Image: default
   d. Transformer code: reg_demo/transformer.py
   e. Choose CPU and submit
   f. Published Model will be available in Model Catalog.
9. Deploy Model
   a. Go to Model Catalog and Click on the Published model.
   b. Click on the Deploy Model button.
   c. Give name.
   d. Serving image: default
   e. Deploy using: CPU  and Submit.
   f. Deployed Model will be available in Model Serving.

## Test Inference
1. Download the data files cli_inp.csv and any sample image from images folder from https://github.com/oneconvergence/dkubeio-examples/tree/master/tf/clinical_reg/inference/data
2. In DKube UI, once the pipeline run has completed, navigate to ‘Test Inferences’ on the left pane
3. Copy the ‘Endpoint’ URL in the row using the clipboard icon
4. Duplicate DKube UI on a new tab and change the URL using the domain name and replacing the remaining path with inference after the domain name.
   a. For e.g, https://dkube.sb.us.phcaa.science.reg.com/inference OR
   b. https://1.2.3.4:32222/#/dsinference
5. Enter the following URL into the Model Serving URL box
   https://dkube-proxy.dkube
6. Copy the token from ‘Developer Settings’ and paste into ‘Authorization Token’ box
7. Select Model Type as ‘Regression’ on the next dropdown selection
8. Click ‘Upload Image’ to load image from [A], ‘Upload File’ to load csv from [A]
9. Click ‘Predict’ to run Inference

## Regression Notebook Workflow
1. Go to IDE section
2. Create Notebook
   a. Give a name
   b. Project: regression
   c. Datasets: 
       i. clinical
           Mount point:   /opt/dkube/input/clinical
      ii. images
           Mount point:   /opt/dkube/input/images
     iii. rna
           Mount Point:    /opt/dkube/input/rna
3. Submit
4. Open workflow.ipynb from location workspace/regression/reg_demo/
   a. Run cells and wait for output (In case of running the notebook second time, restart the kernel)
5. Delete if workflow.py is already there and export the workflow notebook as executable. 
   a. Upload it into Juyterlab.
   b. Make changes in py file, comment/remove the following line numbers:
       i. 239-240
      ii. 268
     iii. 435-end
   c. save and commit the workflow.py
6. Create a model name workflow with source none.
7. Create training run using workflow.py
   a. Give a name
   b. Project: regression
   c. Startup command:
       i. python workflow.py
   d. Datasets: 
       i. clinical
           Mount point:   /opt/dkube/input/clinical
      ii. images
           Mount point:   /opt/dkube/input/images
     iii. rna
           Mount Point:    /opt/dkube/input/rna
    e. Output model:
        i. workflow
            Mount point : /opt/dkube/output

## Compile pipeline manually
```
    a. Start the default dkube notebook from the IDE tab.
    b. Once running, click the jupyterlab icon to launch jupyterlab
    c. Go to the pipeline/components folder
        i. Create a new folder name setup and go inside the folder
       ii. Create a file name component.yaml
      iii. Copy the content from this link https://raw.githubusercontent.com/oneconvergence/dkubeio-examples/master/tf/clinical_reg/pipeline/component.yaml to the component.yaml file.
    d. Go to the pipeline/ipynbs folder 
        i. Create a new text file
            1. Copy the content from the link https://raw.githubusercontent.com/oneconvergence/dkubeio-examples/master/tf/clinical_reg/pipeline/regression_setup.ipynb and paste into the text file,
            2. Save it, and rename the text file to regression.ipynb
    e. Run cells to generate the tar file. 
    f. Download the tar file by right-clicking on it.
    g. Upload the tar file into the DKube pipeline UI.
```

