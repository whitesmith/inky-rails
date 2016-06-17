require 'inky/parser'

module Inky
  mattr_accessor :processing_options, :renderer
  @@processing_options = {}

  class InkyTemplate
    def self.to_html(compiled_source)

      Inky::Parser.new(compiled_source).render.html_safe
    end
  end
end
