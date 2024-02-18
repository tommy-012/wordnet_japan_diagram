# frozen_string_literal: true

require 'active_record'

module WordnetJapanDiagram
  module WordnetJapan
    class Database < ActiveRecord::Base
      self.abstract_class = true

      def self.connect(command_options)
        establish_connection(
          adapter: 'sqlite3',
          **command_options.wordnet_japan_db_options
        )
      end
    end
  end
end
