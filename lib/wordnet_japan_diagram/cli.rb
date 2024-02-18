# frozen_string_literal: true

require 'choice'

require_relative 'command_options'
require_relative 'diagram_creater'

require_relative 'wordnet_japan/database'
require_relative 'wordnet_japan/sense'
require_relative 'wordnet_japan/synlink'
require_relative 'wordnet_japan/synset'
require_relative 'wordnet_japan/synset_def'
require_relative 'wordnet_japan/word'

Choice.options do
  header ''
  header 'Specific options:'

  option :wordnet_japan_db_file_path do
    long '--wordnet_japan_db_file_path=PATH'
    desc 'Sets wordnet japan db file path'
    default 'wnjpn.db'
  end

  option :search_word, required: true do
    long '--search_word=WORD'
    desc '[Required] Sets japanese word to search'
    validate /\p{Hiragana}+|\p{Katakana}+|\p{Han}+/
  end

  option :graph_rankdir do
    long '--graph_rankdir=DIR'
    desc "Sets direction of graph layout\n"\
         "                                     TB: Top to bottom\n" \
         "                                     BT: Bottom to top\n" \
         "                                     LR: Left to right\n" \
         '                                     RL: Right to left'
    default 'BT'
    valid %w(TB BT LR RL)
  end

  option :node_contents do
    long '--node_contents=[synset|synset_and_words]'
    desc "Sets node contents\n"
    default 'synset_and_words'
    valid %w(synset synset_and_words)
  end

  option :height_from_target do
    long '--height_from_target=number'
    desc 'Sets height from target node'
    validate /\d+/
  end

  option :depth_from_target do
    long '--depth_from_target=number'
    desc 'Sets depth from target node'
    validate /\d+/
  end

  option :output_file_path do
    long '--output_file_path=PATH'
    desc 'Sets output file path'
    default "wordnet_japan_diagram_#{Time.current.strftime('%Y%m%d%H%M%S')}.png"
    validate /[pdf|png|jpg|svg]$/
  end

  option :help do
    long '--help'
    desc 'Show this options information'
  end
end

module WordnetJapanDiagram
  class CLI
    class << self
      def execute
        connect_database
        create_diagram
      end

      private

      def connect_database
        WordnetJapan::Database.connect(command_options)
      end

      def create_diagram
        DiagramCreater.new(command_options).create
      end

      def command_options
        @command_options ||= CommandOptions.new(options: Choice.choices)
      end
    end
  end
end
