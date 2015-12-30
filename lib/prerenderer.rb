$LOAD_PATH << './lib/markmiddle/'
require 'code_block'
require 'definition_block'
require 'execution_block'
require 'table_block'
require 'regex'

def prerenderer(document)
  code_block(document)
  # 別の場所で記号を定義
  deflist_symbol = ':'
  definition_block(document, deflist_symbol)

  execution_block_symbol = ['{{{', '}}}']
  execution_block(document, execution_block_symbol)

  # table_block(document, '{{', '}}')
  table_csv(document, '{{', '}}')
  table_csv_import(document, '{{', '}}')
  # execution blockのように配列で渡すとなぜかsegmentation fault
  # table_block_symbol_open = '\{\{'
  # table_block_symbol_close = '\}\}'
  # table_block(document, table_block_symbol_open, table_block_symbol_close)
  document
end
