require 'pathname'
require 'sqlite3'
require 'active_record'
require 'logger'

# p __FILE__
# p File.dirname(__FILE__)
# p File.join(File.dirname(__FILE__), "..")
# p File.expand_path(File.join(File.dirname(__FILE__), ".."))

app_root = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

# p app_root

app_name = app_root.basename.to_s

# p app_name

# p app_root.join('db', app_name + ".db").to_s

db_path  = app_root.join('db', app_name + ".db").to_s

if ENV['DEBUG']
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# Automatically load every file in app_root/app/models/*.rb, e.g.,
#   autoload "Person", 'app/models/person.rb'
#
# See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html

Dir[app_root.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

Dir[app_root.join('app', 'views', '*.rb')].each do |view_file|
  filename = File.basename(view_file).gsub('.rb', '')
  require view_file
end

ActiveRecord::Base.establish_connection :adapter  => 'sqlite3',
                                        :database => db_path
