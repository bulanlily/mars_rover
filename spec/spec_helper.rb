require "pry"
# require all .rb file in ../lib
Dir[File.expand_path('.') + '/controllers/*.rb'].each {|file| require file }
Dir[File.expand_path('.') + '/src/*.rb'].each {|file| require file }

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
