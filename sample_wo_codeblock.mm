## definition list
definition *list* title
: definition list description

## execution block
{{{ruby
puts '**hello**'
# hoge
}}}

## code block
```ruby
def hello
  puts 'hello'
end
```

## table
### table what-you-see writing
| table_wys | column 1 | column 2 |
|-----------|----------|----------|
| row 1     | elem 1-1 | elem 1-2 |
| row 2     | elem 2-1 | elem 2-2 |

### table csv importing
{{csv: ./table_csv_import.csv }}

### table csv
{{csv
table_csv,column 1,column 2
row 1,elem 1-1,elem 1-2
row 2,elem 2-1,elem 2-2
}}
