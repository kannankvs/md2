# HOWTO Commit a code in github. 

## Steps to commit a code in github.

1. **Fork the repository** 
  Go to the master repository and click on "fork" to for the repository.

  

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

    

 11. **Raising the pull request.** 
     Now goto your forked page in your repository list. A new button will be enables to create pull request. Click the button to create the pull request. Add the required commits in the description. This will help the reviewer to understand more about the change made. 