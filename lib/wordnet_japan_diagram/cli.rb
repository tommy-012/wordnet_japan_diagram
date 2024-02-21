# frozen_string_literal: true

require_relative 'command_options'
require_relative 'diagram_creater'

require_relative 'wordnet_japan/database'
require_relative 'wordnet_japan/sense'
require_relative 'wordnet_japan/synlink'
require_relative 'wordnet_japan/synset'
require_relative 'wordnet_japan/synset_def'
require_relative 'wordnet_japan/word'

module WordnetJapanDiagram
  class CLI
    class << self
      def execute(options:)
        new(options).execute
      end
    end

    def initialize(options)
      @command_options = CommandOptions.new(options: options)
    end

    def execute
      connect_database
      create_diagram
    end

    private

    def connect_database
      WordnetJapan::Database.connect(@command_options)
    end

    def create_diagram
      DiagramCreater.new(@command_options).create
    end
  end
end
