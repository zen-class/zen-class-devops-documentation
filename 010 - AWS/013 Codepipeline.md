# AWS Codepipeline


![CP1](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/8f7a6e11-9723-45e6-8880-6bbe695227bb)



AWS CodePipeline is a continuous delivery service you can use to model, visualize, and automate the steps required to release your software. You can quickly model and configure the different stages of a software release process. CodePipeline automates the steps required to release your software changes continuously. 


## Benefits

1. Pipeline as Code

2. Managed by AWS

3. Workflow modeling

4. AWS service integration


## Features


**1. Continuous Delivery**

+ a software development methodology where the release process is automated. Every software change is automatically built, tested, and deployed to production.

+ Before the final push to production, a person, an automated test, or a business rule decides when the final push should occur.

+ Although every successful software change can be immediately released to production with continuous delivery, not all changes need to be released right away.


![cp3](https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/43daf14a-eb38-4af3-b864-0cc76e2d7e1d)



**2. Continuous Integration**

+ a software development practice where members of a team use a version control system and frequently integrate their work to the same location, such as a main branch. 

+ Each change is built and verified to detect integration errors as quickly as possible.
  
+ Continuous integration is focused on automatically building and testing code, as compared to continuous delivery, which automates the entire software release process up to production.



<img width="400" alt="cp2" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/96975b3a-8bb3-44ff-99c7-78b7b000f04b">



## Workflow of Codepipeline

+ when developers commit changes to a source repository, CodePipeline automatically detects the changes. Those changes are built, and if any tests are configured, those tests are run.

+ After the tests are complete, the built code is deployed to staging servers for testing. From the staging server, CodePipeline runs more tests, such as integration or load tests.

+ Upon the successful completion of those tests, and after a manual approval action that was added to the pipeline is approved, CodePipeline deploys the tested and approved code to production instance





<img width="469" alt="PipelineFlow" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/09f1ac72-9cc6-41b2-8b1c-b531e880583b">




## Codepipeline Concepts

Modeling and configuring your automated release process is easier if you understand the concepts and terms used in AWS CodePipeline.



### Pipeline Terms

Pipelines

  * Stages

  * Actions

Pipeline executions

   * Stopped executions

   * Failed executions

   * Superseded executions

   * Stage executions

   * Action executions

Transitions

Artifacts

Source revisions


## Pipelines

A pipeline is a workflow construct that describes how software changes go through a release process. Each pipeline is made up of a series of stages.


## Stages

+ A stage is a logical unit you can use to isolate an environment and to limit the number of concurrent changes in that environment.

+ Each stage contains actions that are performed on the application artifacts.

+ Your source code is an example of an artifact.

+ A stage might be a build stage, where the source code is built and tests are run. It can also be a deployment stage, where code is deployed to runtime environments.

+ Each stage is made up of a series of serial or parallel actions.


## Actions

+ An action is a set of operations performed on application code and configured so that the actions run in the pipeline at a specified point.

+ This can include things like a source action from a code change, an action for deploying the application to instances, and so on.

+ Valid CodePipeline action types are

1. source

2. build

3. test

4. deploy

5. approval

6. invoke


## Pipeline executions

+ An execution is a set of changes released by a pipeline. Each pipeline execution is unique and has its own ID.

+ An execution corresponds to a set of changes, such as a merged commit or a manual release of the latest commit.

+ Two executions can release the same set of changes at different times.

+ While a pipeline can process multiple executions at the same time, a pipeline stage processes only one execution at a time. To do this, a stage is locked while it processes an execution.

+ Two pipeline executions can't occupy the same stage at the same time. The execution waiting to enter the occupied stage is referred to an inbound execution.

+ An inbound execution can still fail, be superseded, or be manually stopped. Pipeline executions traverse pipeline stages in order.

+ Valid statuses for pipelines are 

1. InProgress

2. Stopping

3. Stopped

4. Succeeded

5. Superseded

6. Failed


### Stopped executions

+ The pipeline execution can be stopped manually so that the in-progress pipeline execution does not continue through the pipeline.

+ If stopped manually, a pipeline execution shows a Stopping status until it is completely stopped. 

There are two ways to stop a pipeline execution:

1. Stop and wait

2. Stop and abandon


### Failed executions

+ If an execution fails, it stops and does not completely traverse the pipeline. Its status is **FAILED** status and the stage is unlocked.

+ A more recent execution can catch up and enter the unlocked stage and lock it.

+ You can retry a failed execution unless the failed execution has been superseded or is not retryable.



### Superseded executions

+ An execution can be superseded by a more recent execution at a certain point, which is the point between stages.

+ If an execution is waiting to enter a locked stage, a more recent execution might catch up and supersede it.

+ The newer execution now waits for the stage to unlock, and the superseded execution stops with a **SUPERSEDED** status.

+ When a pipeline execution is superseded, the execution is stopped and does not completely traverse the pipeline.



## Stage executions

+ A stage execution is the process of completing all of the actions within a stage. 

  Valid statuses for stages are

1. InProgress

2. Stopping

3. Stopped

4. Succeeded

5. Failed 


## Action executions

+ An action execution is the process of completing a configured action that operates on designated artifacts. These can be input artifacts, output artifacts, or both.

Valid statuses for actions are 

1. InProgress
    
2. Abandoned
    
3. Succeeded
    
4. Failed


### Action types

+ Action types are preconfigured actions that are available for selection in CodePipeline.

+ The action type is defined by its owner, provider, version, and category.

+ The action type provides customized parameters that are used to complete the action tasks in a pipeline.


## Transitions

+ A transition is the point where a pipeline execution moves to the next stage in the pipeline.

+ You can disable a stage's inbound transition to prevent executions from entering that stage, and then you can enable the transition to allow executions to continue.

+ When more than one execution arrives at a disabled transition, only the latest execution continues to the next stage when the transition is enabled.

+ This means that newer executions continue to supersede waiting executions while the transition is disabled, and then after the transition is enabled, the execution that continues is the superseding execution.


## Artifacts

+ Artifacts refers to the collection of data, such as application source code, built applications, dependencies, definitions files, templates, and so on, that is worked on by pipeline actions.

+ Artifacts are produced by some actions and consumed by others.

+ In a pipeline, artifacts can be the set of files worked on by an action (input artifacts) or the updated output of a completed action (output artifacts).

+ Actions pass output to another action for further processing using the pipeline artifact bucket

## Source revisions

+ When you make a source code change, a new version is created.

+ A source revision is the version of a source change that triggers a pipeline execution.

+ An execution processes that source revision only.

+ For GitHub and CodeCommit repositories, this is the commit. For S3 buckets or actions, this is the object version.


## Product and Service Integrations

 AWS CodePipeline is integrated with a number of AWS services and partner products and services.

+ Source action integrations
      
+ Build action integrations
      
+ Test action integrations
      
+ Deploy action integrations
      
+ Approval action integration with Amazon Simple Notification Service
      
+ Invoke action integrations


## Source action integrations

+ Amazon ECR source actions
      
+ Amazon S3 source actions
      
+ Connections to Bitbucket Cloud, GitHub (version 2), GitHub Enterprise Server, and GitLab
      
+ CodeCommit source actions
      
+ GitHub (version 1) source actions


## Build action integrations

+ CodeBuild build actions
      
+ CloudBees build actions
      
+ Jenkins build actions
      
+ TeamCity build actions


## Test action integrations

+ CodeBuild test actions
    
+ AWS Device Farm test actions
      
+ Ghost Inspector test actions
      
+ Micro Focus StormRunner Load test actions


## Deploy action integrations

+ Amazon S3 deploy actions
    
+ AWS AppConfig deploy actions
    
+ AWS CloudFormation deploy actions
      
+ AWS CloudFormation StackSets deploy actions
      
+ Amazon ECS deploy actions
      
+ Elastic Beanstalk deploy actions
      
+ AWS OpsWorks deploy actions
      
+ Service Catalog deploy actions
      
+ Amazon Alexa deploy actions
      
+ CodeDeploy deploy actions
      
+ XebiaLabs deploy actions


## Approval action integration with Amazon Simple Notification Service

+ Amazon SNS is a fast, flexible, fully managed push notification service that lets you send individual messages or to fan out messages to large numbers of recipients.

+ Amazon SNS makes it simple and cost effective to send push notifications to mobile device users, email recipients or even send messages to other distributed services.

+ When you create a manual approval request in CodePipeline, you can optionally publish to a topic in Amazon SNS so that all IAM users subscribed to it are notified that the approval action is ready to be reviewed.


## Invoke action integrations

+ Lambda invoke actions
    
+ Snyk invoke actions
    
+ Step Functions invoke actions


## How to create codepipeline




+ ### **Sign into AWS Management console and search codepipeline service**






<img width="758" alt="cp4" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/2c84f1c9-cda6-4424-be1b-f874b4cf8b55">





+ ### **Click create pipeline**





<img width="718" alt="cp5" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/e1a0e252-0581-47c6-b363-22f51b76ec7d">




### **Step 1: Choose pipeline settings give name and service role for accessing resources**





<img width="666" alt="cp6" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/63809681-2286-4abe-9b79-a2ca5ca5e3ba">





### **Step 2: Add source stage**





+ ### **In this stage we can give our source details(codecommit, S3, Github, etc...)**





+ ### **Give details of repository, branch name and artifact format**







<img width="665" alt="cp7" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/e69cb8e7-8f97-4fe5-80d0-8a20f4cbbd93">







+ ### **The image shows Codecommit source stage**






<img width="560" alt="cp8" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/e293ecd4-2df8-4295-a2e7-d5d328d8a57c">





+ ### **The image shows S3 as a source stage**








<img width="550" alt="cp9" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/e1e3e406-cbfd-4e4c-8b89-cb72cb5df85a">






+ ### **The image shows Github as a source stage**






<img width="409" alt="cp10" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/f0cbd2d8-3908-4177-9bde-4862f55af6f9">





### **Step 3:Add build stage this is optional but we use for build our code using codebuild or jenkins**







<img width="442" alt="cp11" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/d6453980-6daa-44b1-8a44-8ddc42faaf23">





### **Step 4: Add our Deploy stage for our deployment method**






<img width="568" alt="cp12" src="https://github.com/zen-class/zen-class-devops-documentation/assets/77039703/1a578075-4a1e-43db-97e1-b2396874a634">






### **Step 5: Review and create your pipeline**






## Pricing

+ With AWS CodePipeline, there are no upfront fees or commitments.

+ You pay only for what you use. AWS CodePipeline costs $1.00 per active pipeline* per month. To encourage experimentation, pipelines are free for the first 30 days after creation.

+ An active pipeline is a pipeline that has existed for more than 30 days and has at least one code change that runs through it during the month.

+ There is no charge for pipelines that have no new code changes running through them during the month. An active pipeline is not prorated for partial months.


### AWS Free Tier

+ As part of the AWS Free Tier, AWS CodePipeline offers new and existing customers one free active pipeline each month.

+ Your free usage is calculated each month across all regions and automatically applied to your bill - free usage does not accumulate.


### Additional charges

You may incur additional charges for storing and accessing your pipeline artifacts in Amazon S3 and for triggering actions from other AWS and third-party services that you connect to your pipeline.


## Reference

+ Use this link to learn more about AWS Codepipeline

        https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html

