# Basic CI/CD

>Development of a simple **CI/CD** for the *SimpleBashUtils* project. Building, testing, deployment.

## Table of Contents

- [Basic CI/CD](#basic-cicd)
  - [Table of Contents](#table-of-contents)
  - [Part 1. Setting up the **gitlab-runner**](#part-1-setting-up-the-gitlab-runner)
  - [Part 2. Building](#part-2-building)
  - [Part 3. Codestyle test](#part-3-codestyle-test)
  - [Part 4. Integration tests](#part-4-integration-tests)
  - [Part 5. Deployment stage](#part-5-deployment-stage)
  - [Part 6. Bonus. Notifications](#part-6-bonus-notifications)

As a result of the work you must save two dumps of the virtual machine images described below. \

## Part 1. Setting up the **gitlab-runner**

`-` Since you have decided to do CI/CD, you must really, really like testing. I love it too. So let's get started.
If you need any information, I recommend looking for answers in the official documentation.

- Start *Ubuntu Server 20.04 LTS* virtual machine

- Download and install **gitlab-runner** on the virtual machine

- Run **gitlab-runner** and register it for use in the current project (*DO6_CICD*)

- You will need a URL and a token for runner registration, that can be obtained from the task page on the platform.

## Part 2. Building

`-` The previous test was designed to boost people's self-confidence.
Now I have readjusted the tests, making them more difficult and less flattering.

- Write a stage for **CI** to build applications from the *C2_SimpleBashUtils* project

- In the *gitlab-ci.yml* file, add a stage to start the building via makefile from the *C2* project

- Save post-build files (artifacts) to a random directory with a 30-day retention period

## Part 3. Codestyle test

`-` Congratulations, you've accomplished a completely pointless task. Just kidding. It was necessary for moving on to all the following ones.

- Write a stage for **CI** that runs a codestyle script (*clang-format*)

- If the codefile didn't pass, " fail" the pipeline

- In the pipeline, display the output of the *clang-format* utility

## Part 4. Integration tests

`-` Great, the codestyle test is written. [WHISPERING] I'm talking to you in private. Don't tell anything to your colleagues.
Between you and me, you're doing very well. [LOUDLY] Let's move on to writing integration tests.

- Write a stage for **CI** that runs your integration tests from the same project

- Run this stage automatically only if the build and codestyle test passes successfully

- If tests didn't pass, fail the pipeline

- In the pipeline, display the output of the succeeded / failed integration tests

## Part 5. Deployment stage

`-` To complete this task, you must move the executable files to another virtual machine, which will play the role of a production. Good luck.

- Start the second virtual machine *Ubuntu Server 20.04 LTS*

- Write a stage for **CD** that "deploys" the project on another virtual machine

- Run this stage manually, if all the previous stages have passed successfully

- Write a bash script which copies the files received after the building (artifacts) into the */usr/local/bin* directory of the second virtual machine using **ssh** and **scp**

- Be prepared to explain from the script how the relocation occurs.

- In the *gitlab-ci.yml* file, add a stage to run the script you have written

- In case of an error, fail the pipeline

As a result, you should have applications from the *C2_SimpleBashUtils* (s21_cat and s21_grep) project ready to run on the second virtual machine.

- Save dumps of virtual machine images

- Don't forget to run the pipeline with the last commit in the repository.

## Part 6. Bonus. Notifications

`-` It says that your next task is for Nobel laureates specially.
It does not say what they won the prize for, but certainly not for their ability to work with **gitlab-runner**.

- Set up notifications of successful/unsuccessful pipeline execution via bot named "[your nickname] DO6 CI/CD" in *Telegram*

- The text of the notification must contain information on the successful passing of both **CI** and **CD** stages.
- The rest of the notification text may be arbitrary.
