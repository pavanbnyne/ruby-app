# ruby-app
Contains the recipe to install required packages to deploy and run the application. Also contains Vagrantfile to spin up instances.

default.rb - Recipe for building ruby, installing and configuring puma-rake application server, installs bundler on the Ubuntu 14.04 instance

Vagrantfile - Spins up Ubuntu 14.04 VM Box instance with the default.rb recipe

.travis.yml - for continuous build integration with travis-ci
