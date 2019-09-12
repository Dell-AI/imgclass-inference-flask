# imgclass-inference-flask
Image Classification inference Flask App on Apache Spark and Analytics Zoo using Domino Data Platform

The purpose of this use case is to demonstrate distributed training of a neural network on a CPU cluster. The goal is to build a model to predict diseases in given chest xray. This is an example for one of the complex image classification problem. In this Demo, we run chestxray inference on few images from x-ray dataset which has 112,120 images with multi class and multi label diseases. This Demo helps us to run a quick inference on chestxray images in the form a simple python web application and display the predictions for all 14 classes.

Here is some description to understand about how the files has been organized according to domino flask webApp [**documentation**](https://support.dominodatalab.com/hc/en-us/articles/115002598586-Publishing-a-Flask-web-app-in-Domino),

- **chestxray_webapp.py/logic.py** file has inference code developed with python flask framework and its libraries. It has the paths for labeldata, model, model weights and images.
- **Model** folder has the re-trained model weight files of chestxray which will be used to load and run during the inference.
- **sample_images** is a folder which has the selected set of images from x-ray dataset that we use for our inference test.
- **Templates** folder has html files which has the code for UI design and functionalities for respective functions used in the python file.
- **console.sh/app.sh** file has the command to run the inference code and directs you to the valid web URL.

# Steps to Create Flask Project on Domino

## Create an environment to run 

Create a new environment to run this project. Use "Domino Analytics Distribution py3.6 R3.4 (Revision 4)" as the base environment. Copy content from the "Dockfile instructions" file to the Dockefile instruction section and build the environment.

## Publish and Run the App

1. Login with your user credentials into domino environment.
2. On the top navigation bar, click on projects and click on new project on the top right. Name your project and click create project.
3. Use Github integration or download the files in this repository and upload them to the project
4. Under settings on left side pane click on hardware tier drop down to select default(CPU) as your preferred infrastruture.
5. Select the enviroment you built in the previous for the environment of this project
6. Once you start running the app.sh file for the first time it asks you to hit on `publish` as this helps the domino to make your public with a shared URL like `https://domino.vcse.lab/`. Domino server will be listening on default `port 8888` and `host 0.0.0.0`.
7. Click on publish on the left side pane for using the app location URL to access your flask webApp everytime.


