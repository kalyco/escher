require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EscherSite
  class Application < Rails::Application

  	config.assets.enabled = true
	config.assets.initialize_on_precompile = false
  	config.assets.precompile += ['rails_admin/rails_admin.css', 'rails_admin/rails_admin.js']
	config.autoload_paths += %W(#{config.root}/lib) 

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
