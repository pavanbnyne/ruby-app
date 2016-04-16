include_recipe 'apt'

#Building/Installing ruby using the 1.9.3 p551 source code
include_recipe 'ruby_build'
ruby_build_ruby '1.9.3-p551' do
		prefix_path '/usr/local/'
		action :install
end

#Installing bundler for managing and installing cookbooks
gem_package 'bundler' do
             version '1.2.3'
	     gem_binary '/usr/local/bin/gem'
	     options '--no-ri --no-rdoc'
end

#Installing puma
gem_package 'puma' do
    action :install
    version '2.9.1'
    gem_binary '/usr/local/bin/gem'
end

#Create user test for our application
user_account 'test' do
             create_group true
             ssh_keygen false
end

#Deploying the application to the path specified /home/test/ruby_app
application 'app' do
            owner 'test'
            group 'testgr'
            path '/home/test/app'
            repository 'git://github.com/bcustech/devops-test.git'

#run bundler
rails do
    bundler true
end

end

#Settin puma server configuration
activate_control_app
bind "~/tmp/puma.sock" 
pidfile "~/tmp/pids/puma.pid" 
rackup "~/gittest/devops-test/config.ru" 
state_path "~/tmp/pids/puma.state"
working_dir '/home/test/app'
environment 'development'
threads 8,32
workers 2
