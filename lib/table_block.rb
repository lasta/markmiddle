require 'redcarpet'
require 'csv'
# table block

def table_line_oriented(document, tag_open, tag_close)
  # TableLineOriented
  # ^\{\{\n(\|\ ((?!.*\|).+$))+?
  # document.gsub! /^#{tag_open}\n((\|\ (?!.*\|).*?$)+?)
  # 1行に2回以上 | が出てもsyntax errorにならないので正しくない
  # ただし、|が2回以上出るシンタックスを用意していないので、
  # 良いのかもしれない…?
  # Table Line Oriented
  document.gsub! /^#{tag_open}\n([\s\S]+?)#{tag_close}/ do
    # $1.gsub! /^\|(.*?\n)/
  end
end


def table_csv(document, tag_open, tag_close)
  document.gsub! /^#{tag_open}csv\n([\s\S]+?)#{tag_close}/ do
    csv_data = CSV.parse($1)
    # メタデータがあるので、shiftしてから渡す
    csv2html(csv_data)
  end
end

def table_csv_import(document, tag_open, tag_close)
  #unless document.match /^```.*\n^#{tag_open}csv:(.+?)#{tag_close}$\n```/
    document.gsub! /^#{tag_open}csv:(.+?)#{tag_close}$/ do
      # TODO : file open 失敗時の処理
      csv_data = CSV.open($1.strip, "r")
      csv2html(csv_data)
    end
  #end
end

# CSVファイルを力技でHTML Tableにする
def csv2html(csv)
  html = ''
  html += "<table>\n"
  # table header
  html += "<thead>\n"
  html += "<tr>\n"
  csv.shift.each {|elem|
    html += "<th>"
    html += elem.to_s
    html += "</th>\n"
  }
  html += "</tr>\n"
  html += "</thead>\n"
  # table body
  html += "<tbody>\n"
  csv.each {|row|
    html += "<tr>\n"
    row.each {|elem|
      html += "<td>"
      html += elem.to_s
      html += "</td>\n"
    }
    html += "</tr>\n"
  }
  html += "</tbody>\n"
  html += '</table>'

  return html
end
