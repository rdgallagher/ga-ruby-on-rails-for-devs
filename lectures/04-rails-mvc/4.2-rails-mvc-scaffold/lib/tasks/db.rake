namespace :db do
  desc "Display database configuration."
  task :config => [ :environment ] do  # environment is a rake task
    # display the database configuration for current Rails environment
    config = YAML.load_file(File.expand_path('../../../config/database.yml',  __FILE__))
    puts config[Rails.env].inspect
  end
end

