#!/usr/bin/ruby

#
# Markmiddle -- More rich than Markdown
#
# Copylight (c) 2014 Lasta
# [marmiddle](https://github.com/lasta/markmiddle/)
#
# ruby 2.0.0p451 (2014-02-24 revision 45167) [universal.x86_64-darwin13]
# 

$VERSION = '0.0.1'

def ListElement(content)
    return '<li>' + content + '</li>'
end

def TitleElement(firstLine)
    if firstLine =~ /^#\ */
        content = firstLine.split(/^#\ */).last
        return '<title>' + content + '</title>'
    else 
        raise SyntaxError.new('Write title (`# title`) in the first line')
    end 
end

def AnchorElement(anchor)
    anchor.chomp!
    # TODO: contentに"("")"、urlに"[""]"が含まれる場合
    if anchor =~ /\[\s+\]\(\s+\)/ then
        content = $1
        url = $2
        return '<a href="' + url + '"> ' content + ' </a>'
    else
        raise SyntaxError.new('Link syntax error. Usage: `[content](url)`')
    end
end

# ./markmiddle file.mm
sourceFile = File.open(ARGV[1], "r")
# output : file.html
outputFile = File.open(ARGV[1].split(/\.\s+$/).first + '.html', "w")
