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

def listElement(element)
    return '<li>' + element + '</li>'
end

def titleElement(title)
    if title !=~ /^#\ */
        raise SyntaxError.new('Please write title (`# title`) in the first line')
    else 
        element = title.split(/^#\ */).last
        return '<title>' + element + '</title>'
    end 
end

# ./markmiddle file.mm
sourceFile = File.open(ARGV[1], "r")
# output : file.html
outputFile = File.open(ARGV[1].split(/\.\s+$/).first + '.html', "w")
