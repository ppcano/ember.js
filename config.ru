if false
  require 'bundler/setup'
  require 'ember-dev'

  # This is not ideal
  map "/lib" do
    run Rack::Directory.new('lib')
  end

  run EmberDev::Server.new
else 
  require 'rake-pipeline'
  require 'rake-pipeline/middleware'

  use Rake::Pipeline::Middleware, Rake::Pipeline::Project.new("Assetfile")
  run Rack::Directory.new('.')
end
