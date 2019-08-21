require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require 'sass/plugin/rack'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)

  Sass::Plugin.options[:style] = :compressed
  use Sass::Plugin::Rack
end

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

get '/' do
  erb :index # Do not remove this line
end
