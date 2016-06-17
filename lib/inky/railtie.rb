module Inky
  class Railtie < Rails::Railtie
    config.inky = Inky
    config.app_generators.mailer template_engine: :inky

    initializer 'inky-rails.register_template_handler' do
      ActionView::Template.register_template_handler :inky, Inky::Handler.new
      Mime::Type.register 'text/html', :inky
    end
  end
end
