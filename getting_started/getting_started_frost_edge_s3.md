# Frost Edge S3 Bucket
## Creating an S3 Bucket and the CLI
1. Create an [Amazon Web Services](console.aws.amazon.com) Account and Log In  
    - Frost Autogen and Frost Edge only use features on the [AWS Free Tier](https://aws.amazon.com/free/), which is available for one year.  
    - A credit card is required to verify identity. AudioLogic is not liable for any charges or other account issues.  
2. In the top right corner of the main AWS Console Page, set the [AWS Region](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html) to US-West-2 Oregon. **This must be changed before using the Frost Cloudformation Template in Step 3.**
3. Create a Frost S3 Bucket using the [Frost CloudFormation Template](https://github.com/fpga-open-speech-tools/utils/tree/dev/s3).

### Optional - Creating an IAM User to upload programming file via the AWS CLI   
The IAM User is a convenient way to automate the uploading of artifacts to S3 using the [AWS Command Line Interface](https://aws.amazon.com/cli/). It is not required to use the S3 Bucket with Frost Edge. The following steps provide a simple starting point. This is not a complete guide on configuring an IAM user or security.  
  
4. [Create an IAM User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)  
    - Go to `IAM` by searching the AWS Services  
    - Under IAM Resources, click on `Users`  
    - Click `Add User`  
    - Enter a user name  
    - Under AWS Access Type, select `Programmatic Access`  
    - Configure user permissions  
5. Install the [AWS CLI V2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html) for Windows   
6. In Powershell, run `aws configure`  
    - AWS Access Key ID: created in step 2  
    - AWS Secret Access Key: created in step 2  
    - Default Region: us-west-2  
    - Default Output Format: JSON  

## Uploading a Project to S3
### MATLAB CLI Upload
1. If you setup an IAM User with the CLI Interface, run `s3upload(mp,"[bucket name]","audiomini/[project_name]",true)` in the MATLAB Command Window.  
### Manual Upload for the Simple Vector Gain
1. Log into the [AWS Console](console.aws.amazon.com)
2. In the AWS Console search bar, enter `S3` and select `S3` under services
3. Enter the S3 bucket created during *AWS S3 Bucket and the CLI* by click on its name.
4. Create a project directory folder in the S3 Bucket from Step 3. `frost-projects` uses the hardware target as the project directory folder, but this naming convention is not required.
5. Enter the folder created in Step 4 and create a folder named `simple_vector_gain`
6. Enter the `simple_vector_gain` folder and upload the following files by clicking the `Upload` Button or by using the `Drag and Drop` functionality
    - `[Frost Repos]\simulink_models\models\simple_gain_vector\model.json`  
    - `[Frost Repos]\simulink_models\models\simple_gain_vector\hdlsrc\vector_gain\vector_gain_audio_mini.dtbo`  
    - `[Frost Repos]\simulink_models\models\simple_gain_vector\hdlsrc\vector_gain\vector_gain.ko`  
    - `[Frost Repos]\simulink_models\models\simple_gain_vector\hdlsrc\vector_gain\quartus\output_files\vector_gain_audio_mini.rbf`  