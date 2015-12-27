$LOAD_PATH << './lib/'
require 'code_block'
require 'execution_block.rb'
require 'definition_block.rb'
require 'table_block'

# class MarkmiddleRenderer < Redcarpet::Render::HTML
#   # TODO
#   # preprocessでmarkmiddleのrenderをしない
#   def preprocess(document)
#     # 先にコードブロックだけレンダリングする
#     # 必ずpreprocessの最初に実行
#     # pre_code_block(document)
# 
#     # 別の場所で記号を定義
#     deflist_symbol = ':'
#     definition_block(document, deflist_symbol)
# 
#     execution_block_symbol = ['{{{', '}}}']
#     execution_block(document, execution_block_symbol)
# 
#     # table_block(document, '{{', '}}')
#     table_csv(document, '{{', '}}')
#     table_csv_import(document, '{{', '}}')
#     # execution blockのように配列で渡すとなぜかsegmentation fault
#     # table_block_symbol_open = '\{\{'
#     # table_block_symbol_close = '\}\}'
#     # table_block(document, table_block_symbol_open, table_block_symbol_close)
#   end
# end
