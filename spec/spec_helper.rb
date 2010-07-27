require 'rubygems'
require 'activerecord'
require 'spec/autorun'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sets_uuid'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

# require 'logger'
# ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table "things" do |t|
    t.string :compact, :default, :some_field
  end
end

Spec::Runner.configure do |config|
end
