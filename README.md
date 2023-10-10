Due to a request from Matt, I created a folder called auv_ws within the docker container. If you create and save any files in there, they will persist. There is a minor thing that you have to do, however. Once you get inside of the container, you have to run catkin_make inside of ~/auv_ws. Then, you have to do source ~/auv_ws/devel/setup.bash. <br>

TODO: Create a bash file that runs as an entrypoint that does all of the setup. Very easy to implement, just takes a few minutes. <br>

NOTE: When pushing to git, you can either create a new branch or utilize a .gitignore file for auv_ws. DON'T JUST PUSH! <br>

Maintainer: William Y. @William Yamada on Slack. Message me if you run into any bugs!
