1. Install [vagrant](https://www.vagrantup.com/), install [ansible](http://docs.ansible.com/intro_installation.html)
2. download glassfish-4.1.zip & move it to roles/glassfish4/files

  - wget http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip 
  - mv glassfish-4.1.zip roles/glassfish4/files

3. vagrant up
4. if you can see [this demo site](http://localhost:8080/hello), it probably worked.

5. vagrant ssh

