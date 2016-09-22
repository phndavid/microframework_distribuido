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

bash "directory app" do
	user "root"
	code <<-EOH
	  cd /var/www/app/smartsports
	  node server.js
	EOH
end
