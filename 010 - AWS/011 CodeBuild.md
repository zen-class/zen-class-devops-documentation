# AWS CodeBuild


![cb1](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/11438365-b6b8-4592-bd39-b26796bc5320)



+ AWS CodeBuild is a fully managed build service in the cloud.

+ CodeBuild compiles your source code, runs unit tests, and produces artifacts that are ready to deploy.

+ CodeBuild eliminates the need to provision, manage, and scale your own build servers.

+ It provides prepackaged build environments for popular programming languages and build tools such as Apache Maven, Gradle, and more.

+ You can also customize build environments in CodeBuild to use your own build tools. CodeBuild scales automatically to meet peak build requests.

## Benefits

1. **Fully managed** – CodeBuild eliminates the need to set up, patch, update, and manage your own build servers.

2. **On demand** – CodeBuild scales on demand to meet your build needs. You pay only for the number of build minutes you consume.

3. **Out of the box** – CodeBuild provides preconfigured build environments for the most popular programming languages. All you need to do is point to your build script to start your first build.

## CodeBuild Workflow




![cb2](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/9f658a9b-b33b-468f-9210-1a2b7418f1d5)



+ You can use the AWS CodeBuild or AWS CodePipeline console to run CodeBuild.

+ You can also automate the running of CodeBuild by using the AWS Command Line Interface (AWS CLI) or the AWS SDKs.

+ you can add CodeBuild as a build or test action to the build or test stage of a pipeline in AWS CodePipeline.

+ AWS CodePipeline is a continuous delivery service that you can use to model, visualize, and automate the steps required to release your code.

+ This includes building your code. A pipeline is a workflow construct that describes how code changes go through a release process.


![cb3](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/bf915e74-bc4c-4b72-b255-e9bbb3bfd960)



## How CodeBuild works

+ As input, you must provide CodeBuild with a build project.


![cb4](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/05440b90-12da-4ad1-84d5-f76bc37c802a)



### Build Project

+ A build project includes information about how to run a build, including where to get the source code, which build environment to use, which build commands to run, and where to store the build output.


## Build Environment

+ A build environment represents a combination of operating system, programming language runtime, and tools that CodeBuild uses to run a build.

+ CodeBuild uses the build project to create the build environment.

+ CodeBuild downloads the source code into the build environment and then uses the build specification (buildspec), as defined in the build project or included directly in the source code.


###  Buildspec

+ A buildspec is a collection of build commands and related settings, in YAML format, that CodeBuild uses to run a build.

+ If there is any build output, the build environment uploads its output to an S3 bucket. The build environment can also perform tasks that you specify in the buildspec (for example, sending build notifications to an Amazon SNS topic).

+ While the build is running, the build environment sends information to CodeBuild and Amazon CloudWatch Logs.

+ While the build is running, you can use the AWS CodeBuild console, AWS CLI, or AWS SDKs to get summarized build information from CodeBuild and detailed build information from Amazon CloudWatch Logs.

+ If you use AWS CodePipeline to run builds, you can get limited build information from CodePipeline.


## Plan a build in Codebuild


**1. Where is the source code stored?** 


+ CodeBuild currently supports building from the following source code repository providers.

+ The source code must contain a build specification (buildspec) file. 

1. CodeCommit

2. Amazon S3

3. GitHub

4. Bitbucket


**2. Which build commands do you need to run and in what order?**


+ CodeBuild downloads the build input from the provider you specify and uploads the build output to the bucket you specify.

+ You use the buildspec to instruct how to turn the downloaded build input into the expected build output. 


**3. Which runtimes and tools do you need to run the build?**


+ you building for Java, Ruby, Python, or Node.js? Does the build need Maven or Ant or a compiler for Java, Ruby, or Python? Does the build need Git, the AWS CLI, or other tools?


**4. Do you need AWS resources that aren't provided automatically by CodeBuild? If so, which security policies do those resources need?**


+ you might need to modify the CodeBuild service role to allow CodeBuild to work with those resources.


**5. Do you want CodeBuild to work with your VPC?**


+ you need the VPC ID, the subnet IDs, and security group IDs for your VPC configuration.


## BuildSpec Syntax 


+ Buildspec files must be expressed in YAML format.

+ If a command contains a character, or a string of characters, that is not supported by YAML, you must enclose the command in quotation marks ("").

      version: 0.2

      run-as: Linux-user-name

      env:
        shell: shell-tag
        variables:
          key: "value"
        parameter-store:
          key: "value"
        exported-variables:
          - variable
        secrets-manager:
          key: secret-id:json-key:version-stage:version-id
        git-credential-helper: no | yes

      proxy:
        upload-artifacts: no | yes
        logs: no | yes

      batch:
        fast-fail: false | true
        # build-list:
        # build-matrix:
        # build-graph:
        
      phases:
        install:
          run-as: Linux-user-name
          on-failure: ABORT | CONTINUE
          runtime-versions:
            runtime: version
          commands:
            - command
          finally:
            - command
          # steps:
        pre_build:
          run-as: Linux-user-name
          on-failure: ABORT | CONTINUE
          commands:
            - command
          finally:
            - command
        # steps:
        build:
          run-as: Linux-user-name
          on-failure: ABORT | CONTINUE
          commands:
            - command
          finally:
            - command
        # steps:
        post_build:
          run-as: Linux-user-name
          on-failure: ABORT | CONTINUE
          commands:
            - command
          finally:
            - command
          # steps:
      reports:
        report-group-name-or-arn:
          files:
            - location
          base-directory: location
          discard-paths: no | yes
          file-format: report-format
      artifacts:
        files:
          - location
        name: artifact-name
        discard-paths: no | yes
        base-directory: location
        exclude-paths: excluded paths
        enable-symlinks: no | yes
        s3-prefix: prefix
        secondary-artifacts:
          artifactIdentifier:
            files:
              - location
            name: secondary-artifact-name
            discard-paths: no | yes
            base-directory: location
          artifactIdentifier:
            files:
              - location
            discard-paths: no | yes
            base-directory: location
      cache:
        paths:
          - path


### version      

 + Represents the buildspec version. We recommend that you use 0.2.


### run-as

+ Optional sequence. Available to Linux users only.

+ Specifies a Linux user that runs commands in this buildspec file.

+ run-as grants the specified user read and run permissions.

+ When you specify run-as at the top of the buildspec file, it applies globally to all commands.


### env

Optional sequence. Represents information for one or more custom environment variables.


+ env/shell

+ env/variables

+ env/parameter-store

+ env/secrets-manager

+ env/exported-variables

+ env/git-credential-helper


### proxy


Optional sequence. Used to represent settings if you run your build in an explicit proxy server.

+ proxy/upload-artifacts

+ proxy/logs
 

### phases


Required sequence. Represents the commands CodeBuild runs during each phase of the build. 

+ phases/*/run-as

+ phases/*/on-failure

+ phases/*/finally

+ phases/install

+ phases/pre_build

+ phases/build

+ phases/post_build


### reports


+ Optional sequence. Specifies the report group that the reports are sent to.

+ A project can have a maximum of five report groups.

+ Specify the ARN of an existing report group, or the name of a new report group.

+ If you specify a name, CodeBuild creates a report group using your project name and the name you specify in the format **<project-name>-<report-group-name>**.


### artifacts


+ Optional sequence. Represents information about where CodeBuild can find the build output and how CodeBuild prepares it for uploading to the S3 output bucket. 

+ artifacts/files

+ artifacts/name

+ artifacts/discard-paths

+ artifacts/base-directory

+ artifacts/exclude-paths

+ artifacts/enable-symlinks

+ artifacts/enable-symlinks

+ artifacts/s3-prefix

+ artifacts/secondary-artifacts


### cache

Optional sequence. Represents information about where CodeBuild can prepare the files for uploading cache to an S3 cache bucket. This sequence is not required if the cache type of the project is No Cache.

+ cache/paths


## VPC Support


+ AWS CodeBuild cannot access resources in a VPC.

+ To enable access, you must provide additional VPC-specific configuration information in your CodeBuild project configuration.

+ This includes the VPC ID, the VPC subnet IDs, and the VPC security group IDs.

+ VPC-enabled builds can then access resources inside your VPC.


## Test Reporting in CodeBuild


+ You can create reports in CodeBuild that contain details about tests that are run during builds.

+ You can create tests such as unit tests, configuration tests, and functional tests.

+ The following test report file formats are supported:

+ Cucumber JSON (.json)

+ JUnit XML (.xml)

+ NUnit XML (.xml)

+ NUnit3 XML (.xml)

+ TestNG XML (.xml)

+ Visual Studio TRX (.trx)

+ Create your test cases with any test framework that can create report files in one of these formats (for example, Surefire JUnit plugin, TestNG, or Cucumber).

+ A report expires 30 days after it was created. You cannot view an expired test report. 


## Logging and Monitoring in CodeBuild


+ Monitoring is an important part of maintaining the reliability, availability, and performance of AWS CodeBuild and your AWS solutions.

+ You should collect monitoring data from all of the parts of your AWS solution so that you can more easily debug a multi-point failure, if one occurs.

+ AWS provides the following tools for monitoring your CodeBuild resources and builds and for responding to potential incidents. 

+ CloudTrail

+ CloudWatch

+ AWS CodeBuild is integrated with AWS CloudTrail, a service that provides a record of actions taken by a user, role, or an AWS service in CodeBuild.

+ CloudTrail captures all API calls for CodeBuild as events, including calls from the CodeBuild console and from code calls to the CodeBuild APIs.


## How Create CodeBuild



### **Step 1: Login into AWS Management console and search codebuild service.**





<img width="728" alt="cb5" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/de9837bc-144b-49e6-b224-bd6be96f46c9">





### **Step 2: Click Create build project**





<img width="914" alt="cb6" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/b6e49249-3dbc-4142-aa16-2a2f709f371c">





### **Step 3: Give project name and description**





<img width="532" alt="cb7" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/4f73fb25-b84a-4b13-ba29-16f91afc0588">





+ ###  **Choose our Source (Codecommit, Github, etc..)**





<img width="515" alt="cb8" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/59c5066b-dbb3-4c0f-87d7-c52c3b3e996b">





+ ### **choose our Environment image and servicerole with codebuild full access permission**





<img width="509" alt="cb10" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/3e27e204-b563-4c31-88df-c8346dd1f2fc">





+ ### **Give buildspec file or build commands for project build**





<img width="510" alt="cb11" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/41f16393-5faf-499c-8196-4dc8517c9158">





+ ### **choose Artifact type and logging using cloudwatch and click create build project**






<img width="428" alt="cb12" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/5653f3c7-3f93-49c6-8f35-8b1b4f7f87b7">






### **Step 4: click Create Report group**





<img width="926" alt="cb13" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/26a474b9-3a2b-416f-a8f1-bc5efe98136f">





+ ### **Give details of report group name, type and export option and click create report group**






<img width="935" alt="cb14" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/c41fed69-f5b4-44ef-b7a2-03cd2da4e266">





## Pricing

+ AWS CodeBuild uses simple pay-as-you-go pricing.
  
+ There are no upfront costs or minimum fees.

+ You pay only for the resources you use.

+ You are charged for compute resources based on the duration it takes for your build to execute. The per-minute rate depends on the selected compute type.


### Build duration

Build Duration is calculated in minutes, from the time you submit your build until your build is terminated, rounded up to the nearest minute.



### Free Tier

+ The AWS CodeBuild free tier includes 100 total build minutes per month with the general1.small or arm1.small instance types. The CodeBuild free tier does not expire automatically at the end of your 12-month AWS Free Tier term.

+ It is available to new and existing AWS customers.


### Additional charges

+ You may incur additional charges if your builds transfer data or use other AWS services.

+ For example, you may incur charges from Amazon CloudWatch Logs for build log streams, Amazon S3 for build artifact storage, and AWS Key Management Service for encryption.

+ You may also incur additional charges if you use AWS CodeBuild with AWS CodePipeline.


# Reference

+ use this link to learn more about Codebuild

                    https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html

