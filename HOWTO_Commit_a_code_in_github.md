# HOWTO make changes in SONiC and commit

This document explains the basic points to ponder while making changes in SONiC and explains the steps to make changes.

## Points to Ponder

### Knowing your repositories 

SONiC shall be enhanced continuosly to add new features, to enhance existing features and to fix the bugs in the existing code. To make the changes in SONiC, developers need to understand the different repositories present in SONiC. Some of the repositories are given below. For more detailed information about repositories [click here](https://github.com/Azure/SONiC/blob/master/sourcecode.md).

1. [sonic-buildimage](https://github.com/Azure/sonic-buildimage)
2. [sonic-swss](https://github.com/Azure/sonic-swss) - Switch State Service
3. swss-common - Switch State Service common library -  [sonic-swss-common](https://github.com/Azure/sonic-swss-common) Common library for Switch State Service
4. SAI sub-repo from OCP github that includes the required SAI header files. https://github.com/opencomputeproject/SAI (Switch Abstraction Interface standard headers)
5. SAI objects in Redis [sonic-sairedis](https://github.com/Azure/sonic-sairedis)


## Types of code changes 

Code changes can happen different reason most common is enhancement of the feature of bugfix on the existing feature. 

## Procedure to make changes in SONiC & commit a code.

if the feature or bugfix spans across multiple repositories and if the changes are related, do either one of the following 

1. Raise a Pull Request (PR1)on the repository ( repo1) that does not have dependency  on other repository (repo2) and wait for the PR to be merged. Then raise the  Pull Request (PR2) on the other repository (repo2). 

   (OR)

2.  Rise both the pull request; explicitly explain the dependency in the PR and explain the order in which the PRs has to be merged. 

1. **Fork the repository** 
    Go to the master repository and click on "fork" to for the repository. If the repository has been already forked, then either rebase or delete old fork and do a new fork for every change.  

  1. ​	delete folk command find - add fork command find. 

  

2. **Clone the forked repository**

   1. Go to your list of repositories and look for the forked repository. 

   2. Click on the green button "clone or download". A new inline tab will be open, from that tab copy the git clone link. 

   3. Use the command "`git clone <clone link>`" on your Linux server to clone the repository. 
       Example : *git clone https://github.com/kannankvs/sonic-buildimage.git*

     

3. **Create a new branch.**   
   "git-checkout" - Switch branches or restore working tree files. Specifying -b causes a new branch to be created 
   `git checkout -b <branch_name>`
   Example : *git checkout -b rstp_build_image*

   

4. **Git push origin** 
    In case of git push origin, it explicitly specifies to be pushed into a repository called origin. Git push origin is usually used only where there are multiple remote repository and you want to specify which remote repository should be used for the push.
     `git push origin <branch_name>`
    Example : *git push origin rstp_build_image*	

    

5. **Making changes**	
   In this step make the changes to the original file. Add or remove files. 

   

6. **Verify the changes made.** 
   `git status`  - With is command ensure that you have modified only the required files with the specific change. 

   

7. **Add the changes.**
   To add the files or update the modified files use "`git add <file name>`" individually. 
   To update all the changes along with the deleted files use " `git add .`"

   

8. **Verify the update made.** 
   git status  - You should not see any changes since all files would have been updated. 

   

9. **Commit the changes**.   
   `git commit -m "<branch_name for reference>: <give your commnets here>"` 
   Example :  *git commit -m " rstp_build_image: addressed the comments in PR234"*

   

 10. **Push your changes to the main repository.**

    `git push --set-upstream origin <branch_name>`
    
     Example : *git push --set-upstream origin rstp_build_image*


​    

 11. **Raising the pull request.** 
     Now goto your forked page in your repository list. A new button will be enables to create pull request. Click the button to create the pull request. Add the required commits in the description. This will help the reviewer to understand more about the change made.  (make this more descriptive)

     
     
