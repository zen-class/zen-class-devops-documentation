# AWS Identity and Access Management

Amazon Web Services (AWS) Identity and Access Management (IAM) is a service that assists us to control access securely to AWS resources.
We can use IAM to decide who is to be authenticated and authorized to use the resources.


## It allows you to manage access to:
• Computing
• Storage
• Database
• Application Services in the AWS cloud

## Features

+ You can grant other people permission to administer and use resources in your AWS account without having to share your password or access key.

+ You can grant different permissions to different people for different resources.

+ You can use IAM features to securely provide credentials for applications that run on EC2 instances which provide permissions for your applications to access other AWS resources.

+ You can add two-factor authentication to your account and to individual users for extra security.

+ You can allow users to use identity federation to get temporary access to your AWS account.

+ You receive AWS CloudTrail log records that include information about IAM identities who made requests for resources in your account.

+ You use an access key (an access key ID and secret access key) to make programmatic requests to AWS. An Access Key ID and Secret Access Key can only be uniquely generated once and must be regenerated if lost.

+ IAM has been validated as being compliant with Payment Card Industry (PCI) Data Security Standard (DSS).
+ 
+ IAM is eventually consistent. IAM achieves high availability by replicating data across multiple servers within Amazon’s data centers around the world.

+ IAM and AWS Security Token Service (STS) are offered at no additional charge.

+ You can generate and download a credential report that lists all users on your AWS account. The report also shows the status of passwords, access keys, and MFA devices.

## Infrastructure Elements

## Principal

- An entity that can make a request for an action or operation on an AWS resource. Users, roles, federated users, and applications are all AWS principals.

- Your AWS account root user is your first principal.

## Request

- When a principal tries to use the AWS Management Console, the AWS API, or the AWS CLI, that principal sends a request to AWS.

## Authentication

- To authenticate from the console as a user, you must sign in with your user name and password.

- To authenticate from the API or AWS CLI, you must provide your access key and secret key.

## Authorization

- AWS uses values from the request context to check for policies that apply to the request. It then uses the policies to determine whether to allow or deny the request.

## Users

- Instead of sharing your root user credentials with others, you can create individual IAM users within your account that correspond to users in your organization. IAM users are not separate accounts; they are users within your account.

- Each user can have its own password for access to the AWS Management Console. You can also create an individual access key for each user so that the user can make programmatic requests to work with resources in your account.

- By default, a brand new IAM user has NO permissions to do anything.

- Users are global entities.

## Federated Users

If the users in your organization already have a way to be authenticated, you can federate those user identities into AWS.

<img src="https://github.com/Gitscooby/Images/blob/main/IAM%20image%201.png">


## IAM Groups

- An IAM group is a collection of IAM users.

- You can organize IAM users into IAM groups and attach access control policies to a group.

- A user can belong to multiple groups.

- Groups cannot belong to other groups.

- Groups do not have security credentials, and cannot access web services directly.

## IAM Role
- A role does not have any credentials associated with it.

- An IAM user can assume a role to temporarily take on different permissions for a specific task. A role can be assigned to a federated user who signs in by using an external identity provider instead of IAM.

- **AWS service role** is a role that a service assumes to perform actions in your account on your behalf. This service role must include all the permissions required for the service to access the AWS resources that it needs.

+ **AWS service role for an EC2 instance** is a special type of service role that a service assumes to launch an EC2 instance that runs your application. This role is assigned to the EC2 instance when it is launched.

+ **AWS service-linked role** is a unique type of service role that is linked directly to an AWS service. Service-linked roles are predefined by the service and include all the permissions that the service requires to call other AWS services on your behalf.

- An instance profile is a container for an IAM role that you can use to pass role information to an EC2 instance when the instance starts.

+ Users or groups can have multiple policies attached to them that grant different permission

<img src="https://github.com/Gitscooby/Images/blob/main/IAM%20image%202.png">


## Policies
+ Most permission policies are JSON policy documents.

+ The IAM console includes policy summary tables that describe the access level, resources, and conditions that are allowed or denied for each service in a policy.

+ The policy summary table includes a list of services. Choose a service there to see the service summary.

+ This summary table includes a list of the actions and associated permissions for the chosen service. You can choose an action from that table to view the action summary.

+ To assign permissions to federated users, you can create an entity referred to as a role and define permissions for the role.

## Identity-Based Policies

- Permissions policies that you attach to a principal or identity.

- Managed policies are standalone policies that you can attach to multiple users, groups, and roles in your AWS account.

- Inline policies are policies that you create and manage and that are embedded directly into a single user, group, or role.

## Resource-based Policies

- Permissions policies that you attach to a resource such as an Amazon S3 bucket.

- Resource-based policies are only inline policies.

- Trust policies – resource-based policies that are attached to a role and define which principals can assume the role.

# AWS Security Token Service (STS)

+ Create and provide trusted users with temporary security credentials that can control access to your AWS resources.

+ Temporary security credentials are short-term and are not stored with the user but are generated dynamically and provided to the user when requested.

+ By default, AWS STS is a global service with a single endpoint at https://sts.amazonaws.com.

+ AssumeRoleWithWebIdentity – Returns a set of temporary security credentials for users who have been authenticated in a mobile or web application with a web identity provider. Example providers include Amazon Cognito, Login with Amazon, Facebook, Google, or any OpenID Connect-compatible identity provider.

+ security credentials of an IAM user. Typically, you use GetSessionToken if you want to use MFA to protect programmatic calls to specific AWS API operations.

## IAM Access Analyzer

+ Provides policy checks that help you proactively validate policies when creating them. These checks analyze your policy and report errors, warnings, and suggestions with actionable recommendations that help you set secure and functional permissions.

+ IAM Access Analyzer continuously monitors for new or updated resource policies and permissions granted for S3 buckets, KMS keys, SQS queues, IAM roles, Lambda functions, and Secrets Manager secrets.

## IAM Identity Center

- Manage your workforce’s sign-in security by creating or connecting your users and groups to AWS in one place.

- Workforce identities

+ The members of your organization are also known as workforce users.

+ You can only have 1 identity source per AWS organization:

+ IAM Identity Center identity store
+ Active Directory
+ External identity provider
            
- Multi-account permissions

+ Enables you to assign workforce identities access to AWS accounts.

+ By enabling delegated administration, you can get the following benefits:

+ Reduces the number of people who need access to the management account, which helps to alleviate security concerns.
            
+ Allows select administrators to assign users and groups to applications as well as member accounts in your organization.
            
+ You can manage access to AWS resources across multiple AWS accounts using attribute-based access control (ABAC).

+ Requires fewer permission sets.
+ Permissions for new resources are automatically granted.
+ You can use employee attributes from the corporate directory.
+ Keep track of who is accessing your resources.
         
## Application assignments

+ Assign users access to SaaS applications.

+ Supports the following types of applications:

+ Identity Center enabled applications
+ Cloud applications
+ Custom SAML 2.0 application

**Multi-Factor Authentication (MFA):** IAM supports the use of MFA devices to provide an additional layer of security. MFA requires users to provide an additional authentication factor, such as a physical token or a virtual device, along with their regular IAM credentials.

**Identity Federation:** IAM supports identity federation, allowing you to grant temporary access to AWS resources to users who belong to external identity providers (such as Active Directory or Facebook). This enables you to use existing identities and authentication mechanisms without the need to create IAM users for each individual.

**Identity Providers:** IAM supports integration with external identity providers using industry standards such as Security Assertion Markup Language (SAML) 2.0 and OpenID Connect (OIDC). This allows you to use your existing user directories and credentials to grant access to AWS resources.

**Security and Permissions:** IAM provides granular control over permissions through the use of policies. Policies define what actions are allowed or denied, and they can be tailored to specific resources, actions, or conditions. IAM also supports resource-level permissions, which enable fine-grained access control on individual resources.

**Audit and Compliance:** IAM provides extensive logging and monitoring capabilities, allowing you to track and review actions performed by users and roles within your AWS account. These logs can be integrated with AWS CloudTrail, enabling you to maintain an audit trail and meet compliance requirements.

**Integration with other AWS Services:** IAM integrates with various AWS services, allowing you to control access to resources across your entire AWS infrastructure. For example, you can use IAM roles to grant permissions to EC2 instances, or IAM policies to control access to S3 buckets.

**IAM Best Practices:** AWS provides a set of best practices for IAM, including recommendations for securing your AWS account, managing credentials, implementing least privilege access, and regularly reviewing and rotating access keys."
