# frozen_string_literal: true

require 'ruby-graphviz'

module WordnetJapanDiagram
  class GraphViz
    GRAPHVIZ_SETTING = {
      use:         :dot,
      type:        :digraph,
      rankdir:     :BT,
      ranksep:     0.75, # NOTE default: 0.5
      # nodesep:     0.5, # NOTE default: 0.25
      pad:         '0,0',
      margin:      '0,0',
      concentrate: true,
      labelloc:    :t,
      fontsize:    30, # NOTE default: 14.0
      splines:     'spline', # NOTE https://graphviz.org/docs/attrs/splines/
    }

    EDGE_SETTING = {
      color: '#444444'
    }

    NODE_SETTING = {
      style:    'filled',
      fontname: 'Helvetica Neue'
    }

    MAIN_NODE_COLOR = '#ecd3c4'
    OTHER_NODE_COLOR = '#c4ddec'

    def initialize(command_options)
      # NOTE https://graphviz.org/
      @graph_viz = ::GraphViz.new(:G, GRAPHVIZ_SETTING.merge(command_options.graph_viz_options))
    end

    def link(source:, destination:)
      src_node = find_or_create_node(node_contents: source)
      dst_node = find_or_create_node(node_contents: destination)

      return if src_node.neighbors.present? && src_node.neighbors.map(&:id).include?(dst_node.id)

      @graph_viz.add_edges(src_node, dst_node, EDGE_SETTING)
    end

    def find_or_create_node(node_contents:, target: :other)
      if (existing_node = @graph_viz.find_node(node_contents)).present?
        existing_node
      else
        @graph_viz.add_nodes(node_contents, label: node_contents, fillcolor: node_color(target), **NODE_SETTING)
      end
    end

    def output(file_type:, file_path:)
      @graph_viz.output(file_type => file_path)
    end

    private

    def node_color(target)
      case target
      when :main
        MAIN_NODE_COLOR
      when :other
        OTHER_NODE_COLOR
      end
    end
  end
end
