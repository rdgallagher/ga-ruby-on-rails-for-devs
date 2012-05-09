namespace :db do
  desc "Display database configuration."
  task :config => [ :environment ] do
    # display the database configuration for current Rails environment
    config = YAML.load(File.read(File.expand_path('../../../config/database.yml',  __FILE__)))
    puts config[Rails.env].inspect
  end
end

