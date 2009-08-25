$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sets_uuid'
require 'spec'
require 'spec/autorun'
require 'logger'
require 'rubygems'
require 'activerecord'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table "things" do |t|
    t.string :a, :b, :c
  end
end

Spec::Runner.configure do |config|
end
