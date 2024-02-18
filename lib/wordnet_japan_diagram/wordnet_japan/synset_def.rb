# frozen_string_literal: true

module WordnetJapanDiagram
  module WordnetJapan
    class SynsetDef < Database
      self.table_name = 'synset_def'

      belongs_to :synset, foreign_key: :synset, primary_key: :synset
    end
  end
end
