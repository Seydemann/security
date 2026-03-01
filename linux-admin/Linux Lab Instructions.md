# **Linux Lab Instructions**

## **Lesson 2 Lab: Installing Red Hat Enterprise Linux**

Install a RHEL Server that meets the following requirements:

* Make sure a graphical user interface is installed  
* Configure a 10GiB Root partition  
* Use a 1GiB Swap partition  
* Make sure that at least 4GiB of disk space remains as unused  
* Set the root password to "password"  
* Create a user "student" with the password "password"  
* Configure the network interface to contact a DHCP Server

## **Lesson 3 Lab: Using the Command Line**

* Log in to the graphical system using your default user account.  
* Open a terminal window and type the **who** command to find out which users are active.  
* Use the command **who \--help** to get a short usage overview for this command.

## **Lesson 4 Lab: Using Essential Tools**

* Locate the **man** page that shows how to set a password.  
* Use the **man** page for **useradd** and create a user with the name anna  
* Set the password for user anna to password.  
* Use **vim** to create a file with the name users, and make sure that it contains the names alex, alexander, linda, and belinda on separate lines.

## **Lesson 5 Lab: Using the Bash Shell**

* Set a variable **color** to the value **red** and ensure that this setting is available every time your current user account logs in.  
* Also create an alias that runs the command **ls \-ltr** while executing the **dir** command.  
* Ensure that the Bash History file can grow to a maximum size of 2500 entries.

## **Lesson 6 Lab: Using Essential File Management Tools**

* Use **tar** to create a compressed archive of all files in the /etc and /opt directories. Write this archive to your home directory.  
* Create a symbolic link to the archive you've just created in the /tmp directory.  
* Remove the archive from your home directory. What happens to the symbolic link?

## **Lesson 7 Lab: Working with Text Files**

* Use **head** and **tail** to display the fifth line of the file /etc/passwd.  
* Use **sed** to display the fifth line of the file /etc/passwd.  
* Use **awk** in a pipe to filter the last column out of the results of the command **ps aux**.  
* Use **grep** to show the names of all files in /etc that have lines that contain the text 'root' as a word.  
* Use **grep** to show all lines from all files in /etc that contain exactly 3 characters.  
* Use **grep** to find all files that contain the string "alex", but make sure that "alexander" is not included in the result.

## **Lesson 8 Lab: Configuring sudo**

* Use **useradd linda** to create a user linda.  
* Create a sudo configuration that allows linda to perform common user management tasks.  
  * Allow using **useradd**, **usermod** and **userdel**  
  * Allow changing passwords, but not the password for user root.  
* Ensure that the user only needs to enter a password for **sudo** operations every 60 minutes.

## **Lesson 9 Lab: Managing Users and Groups**

* Make sure that new users require a password with a maximal validity of 90 days.  
* Ensure that while creating users, an empty file with the name newfile is created to their home directory.  
* Create users anna, anouk, linda, and lisa.  
* Set the passwords for anna and anouk to password, disable the passwords for linda and lisa.  
* Create the groups profs and students, and make users anna and anouk members of profs, and linda and lisa members of students.

## **Lesson 10 Lab: Managing Permissions**

Task 1: Shared Group Directory Structure

Create a shared group directory structure /data/profs and /data/students that meets the following conditions:

Members of the groups have full read and write access to their directories.

Others have no permissions at all.

Task 2: Identify SUID Files

Use the appropriate command to print a list of files that have the SUID (Set User ID) permission set.
