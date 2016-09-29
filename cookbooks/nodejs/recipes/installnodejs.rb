# Install NodeJS
bash "install nodejs" do
	user "root"
	code <<-EOH
	  cd /usr/src
	  wget http://nodejs.org/dist/v0.10.4/node-v0.10.4.tar.gz
	  tar zxf node-v0.10.4.tar.gz
      cd node-v0.10.4
      ./configure
      make
      make install
	EOH
end

bash "open port" do
	user "root"
	code <<-EOH
	iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 3000 -j ACCEPT
	service iptables save
	EOH
end

bash "directory app" do
	user "root"
	code <<-EOH
	  cd /var
	  mkdir -p www/app
	EOH
end

remote_directory '/var/www/app' do
  source 'smartsports'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
bash "update app" do
	user "root"
	code <<-EOH
	  npm cache clean -f
	  npm install -g n
	  n stable
	  ln -sf /usr/local/n/versions/node/6.6.0/bin/node /usr/bin/node 
	EOH
end
#http://stackoverflow.com/questions/4797050/how-to-run-process-as-background-and-never-die
bash "start app" do
	user "root"
	code <<-EOH
	  cd /var/www/app
	  nohup node server.js > /dev/null 2>&1 &
	EOH
end
