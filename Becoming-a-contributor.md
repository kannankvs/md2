This document provides general information about the ways of contribution to the SONiC Community.
## Joining the SONiC Community
 A member can contribute the community by signing in Github and can access the SONiC contribution. A member can join the various SONiC groups
 and can start attending actively over the weekly discussion on the ongoing activities. You can find SONiC mailing list [here](https://azure.github.io/SONiC/contact.html).

1)Please get familiar with our [governance document](https://github.com/Azure/SONiC/blob/master/governance.md);

2)Please get familiar with [code of conduct](https://github.com/Azure/SONiC/blob/master/CODE_OF_CONDUCT.md);

# Legal
We welcome everyone to contribute to SONiC project. A [Contribution License Agreement](https://www.1eswiki.com/wiki/Automating_Contribution_License_Agreements) is required before you making a contribution to the open source project. 

Please follow the process and sign the CLA [here](https://cla.microsoft.com). Thanks for your support.


# How to Contribute
Following are the way of contributions and its process for the community.
## Technical Contribution
 Community members or the SONiC partners are welcome to contribute in all of the following development process. The ways in which the members can contribute are explained in detail in the following sub sections.
 1. Development
 2. Reviews
 3. Testing 
 4. Bug Fixing 
 5. Presentation and demos
 6. Documentation
  
### Development                    
Members can contribute by owning and develop a feature for SONiC or enhance an existing feature/sub-features. Members have to inform the community about ownership of feature development/enhancement and ensure that the feature is added to the roadmap. Members should also provide a rough plan about the design document availability date and code availability date in advance and also identify reviewer(s). Members shall do the design, coding & testing by following the process explained in this document and ensure that the feature is merged before the release. 
              
### Reviews
Members can contribute by owning up the reviews for the design documents, code, test cases/scripts and any documents that are prepared for SONiC. Members can join the design review meetings and provide review comments during the discussion and/or provide the review comments on the pull request raised by the authors. Members are requested to complete the review cycle on time so that the features planned in the roadmap are completed before the release.

### Testing
Members are requested to test SONiC in their own platforms and raise issues in the appropriate SONiC repositories. Members can also contribute by reviewing the existing test cases and adding new test cases to the sonic-mgmt repository.                                    

### Bug Fixing
Members are requested to fix the bugs present in SONiC. They are requested to join the issue triage sub group and contribute for root cause analysis as well as in review. 

### Presentation and demos
Regular workshops and OCP meetings are happening for SONiC. Members are requested to participate and contribute for technical presentation and demos that can be used during the workshop. 
Partners are welcome to set up booths at the OCP summits with their platforms running SONiC. 

### Documentation
Members are requested to review the existing documents in SONiC and also help in enhancing the existing technical documents like Config guide, CLI  guide, Wiki pages, etc., 
Members are requested to capture the SONiC deployment scenarios as well as the use cases in a document and add it to the SONiC Wiki library.

## Development Process

### Design
1. Create the file as MD (markdown) format;
2. Send as a pull request to https://github.com/Azure/SONiC/pulls;
3. Go through community design review;
4. Once approved, the doc will be merged to https://github.com/Azure/SONiC repo;
5. The doc will be published on SONiC WiKi;

###  Code
1. Code the feature and raise a pull request
2. Pull request for the code should be raised from appropriate repository.
3. Available repository for code are sonic-buildimage, sonic-utilities, sonic-swss, sonic-build-system, etc.,
4. Members should inform the community if a new repository is created the feature.
5. Code has to be in file format such as python, C/C++, ruby, etc.,
6. Go through community for code review.
7. Once approved, the code will be merged to https://github.com/Azure/SONiC repo.

Repositories  
Members should pull a separate private branch from the master branch in an appropriate repository. There are various code repository available such as sonic-buildimage, sonic-utilities, sonic-swss, sonic-build-system etc. Members should ensure that the owned feature is updated in  the right repository to add the development code and its corresponding HLD document.

## Release Process 
1. The community will follow the roadmap for release and would be updated periodically. 
2. The release tracking will be followed for all the ongoing feature on the release and its corresponding HLD discussion will be happening every week. 
3. A member should ensure the active involvement in the discussion. 
4. The release tracking sheet should be updated periodically to ensure the status of the ongoing release. 
5. Release notes will be issued upon successful release for the completed features.
6. Any feature that is not completed before the branching will be considered for next release.
7. For further details about the SONiC release train click [here](https://github.com/Azure/SONiC/blob/master/doc/release_train.md)

## Pull Request Process
Find below the steps to raise a Pull Request for the HLD document as well as for the development Code.
1. Fork the corresponding repository for the owned feature
2. Clone your repository 
3. Create a private branch for updating the HLD and code development.
4. Do necessary changes upon review comments if any
5. Push the HLD document code development 
6. Raise a new pull request.
```
Find the below example on raising a pull request

git clone https://github.com/kannankvs/sonic-buildimage.git	 	 
git clone https://github.com/kannankvs/sonic-utilities.git	 	 
git clone https://github.com/vharish02/sonic-utilities.git	 	 
git checkout -b mvrf_ip_rule_priority_change_to_32765	
git checkout mvrf_ip_rule_priority_change_to_32765	 
git push origin mvrf_ip_rule_priority_change_to_32765	 	 

```

## How to file an Issue ?
1. Issues should be filed under https://github.com/Azure/sonic-buildimage/issues;
2. Please fill the template as 
- Description
- Steps to reproduce the issue:
- Describe the results you received:
- Describe the results you expected:
- Attach debug file
3. Submit

## Design Spec
1. Create the file as MD (markdown) format;
2. Send as a pull request to https://github.com/Azure/SONiC/pulls;
3. Go through community design review;
4. Once approved, the doc will be merged to https://github.com/Azure/SONiC repo;
5. The doc will be published on SONiC WiKi;

