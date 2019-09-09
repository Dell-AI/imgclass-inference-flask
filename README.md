# imgclass-inference-flask
Image Classification inference Flask App on Apache Spark and Analytics Zoo using Domino Data Platform

The purpose of this use case is to demonstrate distributed training of a neural network on a CPU cluster. The goal is to build a model to predict diseases in given chest xray. This is an example for one of the complex image classification problem. In this Demo, we run chestxray inference on few images from x-ray dataset which has 112,120 images with multi class and multi label diseases. This dataset have 50% of "No Findings" images. This Demo helps us to run a quick inference on chestxray images in the form a simple python web application and display the predictions for all 14 classes.

Here is some description to understand about how the files has been organized according to domino flask webApp [**documentation**](https://support.dominodatalab.com/hc/en-us/articles/115002598586-Publishing-a-Flask-web-app-in-Domino),

- **chestxray_webapp.py/logic.py** file has inference code developed with python flask framework and its libraries. It has the paths for labeldata, model, model weights and images.
- **Model** folder has the re-trained model weight files of chestxray which will be used to load and run during the inference.
- **sample_images** is a folder which has the selected set of images from x-ray dataset that we use for our inference test.
- **Templates** folder has html files which has the code for UI design and functionalities for respective functions used in the python file.
- **console.sh/app.sh** file has the command to run the inference code and directs you to the valid web URL.

### Steps to Create Flask Project on Domino

1. Login with your user credentials into [**domino.vcse.lab**](https://domino.vcse.lab/login) environment.
2. On the top navigation bar, click on projects and click on new project on the top right. Name your project and click create project.
3. Click on files tab on the left side pane add your required files/code but follow the same file structure as shown below because domino requires the same file structure format to publish the flask webApp.
```
/mnt
|-- ...
|-- app.sh
|-- chestxray_webapp.py/logic.py
|-- /static
|-- /sample_images
|-- /model files
|-- /templates
```
4. Under settings on left side pane click on hardware tier drop down to select default(CPU) as your preferred infrastruture.
5. Click on compute environment drop down to select the stable virtual environment which is CDH5_V3.
6. Under Access and Sharing choose the visibility of your project to public.
7. Under Integration tab, select Apache Spark to YARN and add the below details into those tabs and click save.
   - **Kerberos:** No Kerberos Authenctication
   - **Hadoop user name:** hdfs/root
   - **Custom /etc/host entries:** add IP's and hostnames of all the workers in platinum cluster
   - **spark Configuration Option:**
```
spark.yarn.appMasterEnv.DL_ENGINE_TYPE              mklblas
spark.yarn.appMasterEnv.MKL_DISABLE_FAST_MM         1
spark.yarn.appMasterEnv.KMP_BLOCKTIME               0
spark.yarn.appMasterEnv.OMP_WAIT_POLICY             passive
spark.yarn.appMasterEnv.OMP_NUM_THREADS             1
spark.shuffle.reduceLocality.enabled                false
spark.shuffle.blockTransferService                  nio
spark.scheduler.minRegisteredResourcesRatio         1.0
spark.rpc.message.maxSize                           64
spark.jars                                          /opt/Intel/lib/analytics-zoo-bigdl_0.7.2-spark_2.2.0-0.4.0-jar-with-dependencies.jar
spark.executor.memory                               300g
spark.executor.cores                                32
spark.driver.memory                                 300g
spark.executor.instances                            4
spark.submit.pyFiles                                /opt/Intel/lib/analytics-zoo-bigdl_0.7.2-spark_2.2.0-0.4.0-python-api.zip
spark.dynamicAllocation.enabled                     false
spark.speculation                                   false
spark.serializer                                    org.apache.spark.serializer.JavaSerializer
```
8. Once adding all these settings, run the code using shell script or related file by using run/launch notebook button on top right corner you can see when you select the file to run experiment.
9. Once you start running the app.sh file for the first time it asks you to hit on `publish` as this helps the domino to make your public with a shared URL like `https://domino.vcse.lab/`. Domino server will be listening on default `port 8888` and `host 0.0.0.0`.
10. Click on publish on the left side pane for using the app location URL to access your flask webApp everytime.
