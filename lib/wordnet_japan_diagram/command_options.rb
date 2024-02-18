# frozen_string_literal: true

module WordnetJapanDiagram
  class CommandOptions
    def initialize(options:)
      @options = options
    end

    def wordnet_japan_db_options
      {
        database: @options[:wordnet_japan_db_file_path]
      }
    end

    def diagram_creater_options
      {
        search_word: @options[:search_word],
        output_file_path: @options[:output_file_path],
        node_contents: @options[:node_contents],
        height_from_target: @options[:height_from_target].nil? ? nil : @options[:height_from_target].to_i,
        depth_from_target: @options[:depth_from_target].nil? ? nil : @options[:depth_from_target].to_i,
      }
    end

    def graph_viz_options
      {
        rankdir: @options[:graph_rankdir].to_sym
      }
    end
  end
end
