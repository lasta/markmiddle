#!/usr/bin/ruby

#
# Markmiddle -- More rich than Markdown
#
# Copylight (c) 2015 Lasta
# [marmiddle](https://github.com/lasta/markmiddle/)
#
# ruby 2.0.0p451 (2014-02-24 revision 45167) [universal.x86_64-darwin13]
# 

$VERSION = '0.0.1'


def TitleElement(firstLine)
    if firstLine =~ /^#\ */
        content = firstLine.split(/^#\ */).last
        return '<title>' + content + '</title>'
    else 
        raise SyntaxError.new('Write title (`# title`) in the first line')
    end 
end

def AnchorElement(anchor)
    # TODO: contentに"("")"、urlに"[""]"が含まれる場合
    # TODO: "anchor.chomp!" の必要性
    if anchor =~ /\[\s+\]\(\s+\)/ then
        content = $1
        url = $2
        return '<a href="' + url + '"> ' content + ' </a>'
    else
        raise SyntaxError.new('Link syntax error. Usage: `[content](url)`')
    end
end

def ListElement(content)
    return '<li>' + content + '</li>'
end

def ImageElement(img) # img : `![caption](/path/to/pict)`
    # return '<img alt="' + caption + '" src="' + url + '" />' if img =~ /!\[\s+\]\(\s+\)/
    if img =~ /!\[\s+\]\(\s+\)/ then
        alt = $1
        src = $2
        return '<img alt="' + caption + '" src="' + src + '" />'
    end
end

def HorizonLineElement(line)
    # TODO hr判定のif文はここではないはずだ
    return '<hr />' if line =~ /\*{3,}|-{3,}|={3,}/
end

def Header(firstLine)
    outputFile = '<!DOCTYPE html>\n'
               + '<html>\n'
               + '<head>\n'
               + '<meta charset="UTF-8" />\n'
               + TitleElement(firstLine)
               + '<\head>\n'
end

def Body(sourceFile)

end

# ./markmiddle file.mm
sourceFile = File.open(ARGV[1], "r")
# output : file.html
outputFile = File.open(ARGV[1].split(/\.\s+$/).first + '.html', "w")

sourceFile.foreach() do |line|


end
