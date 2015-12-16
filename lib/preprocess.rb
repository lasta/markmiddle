require './lib/execution_block.rb'
require './lib/definition_block.rb'

class MarkmiddleRenderer < Redcarpet::Render::HTML
  def preprocess(document)
    # 別の場所で記号を定義
    deflist_symbol = ':'
    definition_block(document, deflist_symbol)

    execution_block_symbol = ['\{\{\{', '\}\}\}']
    execution_block(document, execution_block_symbol)
  end
end

