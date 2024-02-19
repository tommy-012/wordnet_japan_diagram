# frozen_string_literal: true

require_relative 'graph_viz'

module WordnetJapanDiagram
  class DiagramCreater
    def initialize(command_options)
      @options = command_options.diagram_creater_options
      @graph_viz = GraphViz.new(command_options)
    end

    def create
      word = WordnetJapan::Word.find_by(lemma: @options[:search_word], pos: 'n')

      word.synsets.each do |synset|
        draw(synset)
      end

      @graph_viz.output(
        file_type: File.extname(@options[:output_diagram_path]).delete('.').to_sym,
        file_path: @options[:output_diagram_path]
      )
    end

    private

    def draw(synset)
      draw_target(synset)

      draw_hype(synset, @options[:height_from_target])
      draw_hypo(synset, @options[:depth_from_target])
    end

    def draw_target(synset)
      @graph_viz.find_or_create_node(node_contents: node_contents(synset), target: :main)
    end

    def draw_hype(synset, height)
      dest_synsets = synset.synlinks.where(link: '上位語').map(&:dest_synset)

      return if (height.present? && height <= 0) || dest_synsets.blank?

      dest_synsets.each do |dest_synset|
        @graph_viz.link(source: node_contents(synset), destination: node_contents(dest_synset))

        height = height.present? ? height - 1 : nil
        draw_hype(dest_synset, height)
      end
    end

    def draw_hypo(synset, depth)
      dest_synsets = synset.synlinks.where(link: '下位語').map(&:dest_synset)

      return if (depth.present? && depth <= 0) || dest_synsets.blank?

      dest_synsets.each do |dest_synset|
        @graph_viz.link(source: node_contents(dest_synset), destination: node_contents(synset))

        depth = depth.present? ? depth - 1 : nil
        draw_hypo(dest_synset, depth)
      end
    end

    def node_contents(synset)
      synset_def = synset.synset_defs.where(lang: 'jpn').first&.def

      return synset_def if @options[:node_contents] == 'synset'

      words = synset.words.where(pos: "noun").map(&:lemma).join(',')

      "#{synset_def}\n(#{words})"
    end
  end
end
