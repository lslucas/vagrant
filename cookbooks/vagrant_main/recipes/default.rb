include_recipe "apt"
include_recipe "basics"
include_recipe "ubuntu"
include_recipe "build-essential"
include_recipe "xml"
include_recipe "mysql"
include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe "apache2"
include_recipe "php"
include_recipe "php::module_mcrypt"
include_recipe "php::module_apc"
include_recipe "php::module_curl"
include_recipe "php::module_sqlite3"
include_recipe "php::module_mysql"
include_recipe "php::module_gd"
# include_recipe "php::module_ldap"
include_recipe "php::module_memcache"
include_recipe "php::module_xdebug"
# include_recipe "php::module_mssql"
# include_recipe "php::module_odbc"
# include_recipe "php::module_intl"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
# include_recipe "apache2::mod_proxy"
# include_recipe "apache2::mod_proxy_http"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_headers"
include_recipe "apache2::mod_mime"
include_recipe "apache2::mod_setenvif"
# include_recipe "apache2::mod_fcgid"
# include_recipe "apache2::mod_expires"
include_recipe "apache2::mod_env"
include_recipe "apache2::mod_dir"
include_recipe "apache2::mod_deflate"
# include_recipe "apache2::mod_autoindex"
include_recipe "apache2::mod_alias"
include_recipe "memcached"
 include_recipe "git"
# include_recipe "aws"
include_recipe "vim"
# include_recipe "ssh_keys"
include_recipe "bashrc"
# include_recipe "imagemagick"
# include_recipe "database"
# include_recipe "hosts"
include_recipe "htop"
# include_recipe "emacs"

# apply apaches php.ini template
template "/etc/php5/apache2/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

execute "php-pear: upgrade pear" do
  command "sudo pear upgrade pear"
end

execute "php-pear: auto discover for channels" do
  command "sudo pear config-set auto_discover 1"
end

channels = node[:php_pear][:channels]
channels.each do |channel|
  execute "php-pear: discover channel #{channel}" do
    ignore_failure true
    command "sudo pear channel-discover #{channel}"
    ignore_failure true
end
end

execute "php-pear: update channel" do
  command "sudo pear channel-update pear.php.net"
end

packages = node[:php_pear][:packages]
packages.each do |package|
  execute "php-pear: install #{package}" do
    command "sudo pear install -f preferred_state=stable #{package}"
    ignore_failure true
end
end


execute "php-pear: upgrade all packages" do
  command "sudo pear upgrade-all"
end

execute "install mongodb-10gen" do
  command "sudo apt-get install mongodb-10gen"
end

execute "mongodb new user" do
  command "mongo localhost/techtravel --quiet --eval 'db.addUser(\"techtravel\", \"mvdbt9\")'"
end

execute "install bson_ext" do
  command "gem install bson_ext"
end

execute "install sass" do
  command "gem install sass"
end

# gem_package "mongo"
# ruby_block "Configure mongodb" do
#   block do
#     require 'rubygems'
#     Gem.clear_paths
#     require 'mongo'
#     connection = Mongo::Connection.new("localhost")
#     connection.db("admin")
#     connection.authenticate('techtravel', 'mvdbt9')
#     connection.db("techtravel")
#     # connection.reload
#   end
# end


#install less parser
# nodejs_npm "less" do
#   action :install
# end

gem_package "mysql"
#Allow Db Acces from host system
ruby_block "Execute grants" do
  block do
    require 'rubygems'
    Gem.clear_paths
    require 'mysql'
    m = Mysql.new("localhost", "root", "")
    m.query("USE mysql")
    # m.query("UPDATE `user` SET Host = '%' WHERE Host = '127.0.0.1'")
    m.query("CREATE DATABASE IF NOT EXISTS techtravel CHARACTER SET utf8")
    m.reload
  end
end
