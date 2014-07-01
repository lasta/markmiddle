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


def TitleElement(firstLine)
    if firstLine =~ /^#\ */
        content = firstLine.split(/^#\ */).last
        return '<title>' + content + '</title>'
    else 
        raise SyntaxError.new('Write title (`# title`) in the first line')
    end 
end

def AnchorElement(anchor)
    # TODO: content$B$K(B"("")"$B!"(Burl$B$K(B"[""]"$B$,4^$^$l$k>l9g(B
    # TODO: "anchor.chomp!" $B$NI,MW@-(B
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
        return '<img alt="' + caption + '" src="' + url + '" />'
    end
end

def HorizonLineElement(line)
    # TODO hr$BH=Dj$N(Bif$BJ8$O$3$3$G$O$J$$$O$:$@(B
    return '<hr />' if line =~ /\*{3,}|-{3,}|={3,}/
end

def Header(firstLine)
    # TODO: DTD
    # <!DOCTYPE
    outputFile += `<html>\n`
    outputFile += `<head>\n`
    outputFile += TitleElement(firstLine)
    outputFile += `<\head>\n`
end

# ./markmiddle file.mm
sourceFile = File.open(ARGV[1], "r")
# output : file.html
outputFile = File.open(ARGV[1].split(/\.\s+$/).first + '.html', "w")

sourceFile.foreach() do |line|


end
