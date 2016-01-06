## definition list
```markmiddle
definition list title
: definition list description
```

definition list title
: definition list description

## execution block
```markmiddle
{{{ruby
def fib n
  return n if n < 2
  fib(n-2) + fib(n-1)
end

puts 'fibonacci(10) = ' + fib(10).to_s

# hoge
}}}
```

{{{ruby
def fib n
  return n if n < 2
  fib(n-2) + fib(n-1)
end

puts 'fibonacci(10) = ' + fib(10).to_s

# hoge
}}}

## code block
<pre><code>
```ruby
def hello
  puts 'hello'
end
```
</code></pre>

```ruby
def hello
  puts 'hello'
end
```

## table

### table what-you-see writing
```markdown
| table_wys | column 1 | column 2 |
|-----------|----------|----------|
| row 1     | elem 1-1 | elem 1-2 |
| row 2     | elem 2-1 | elem 2-2 |
```

| table_wys | column 1 | column 2 |
|-----------|----------|----------|
| row 1     | elem 1-1 | elem 1-2 |
| row 2     | elem 2-1 | elem 2-2 |

### table csv importing
```markmiddle
{{csv: ./table_csv_import.csv }}
```

{{csv: ./table_csv_import.csv }}

### table csv
```markmiddle
{{csv
table_csv,column 1,column 2
row 1,elem 1-1,elem 1-2
row 2,elem 2-1,elem 2-2
}}
```

{{csv
table_csv,column 1,column 2
row 1,elem 1-1,elem 1-2
row 2,elem 2-1,elem 2-2
}}

## Math
$$ \sum $$

(((math
  \sum\^n\_{k=1} a\_{1} r\^{k-1} = a\_1 \bullet \frac{1-r\^n}{1-r}
)))

$$ \sum\^{n}\_{i = 1} n = \frac{1}{2} n (n -1) $$

## inline elements in html block

```html
<sup>**2**</sup>
```

<sup>**2**</sup>

{{{ruby
puts "1"
puts "2"
}}}`

{{{ df }}}`
