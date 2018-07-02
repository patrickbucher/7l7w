# Ruby

## Day 1

### Find

- [The Ruby API](https://ruby-doc.org/core-2.5.1/)
- The free online version of [_Programming Ruby: The Pragmatic Programmer's
  Guide_](http://ruby-doc.com/docs/ProgrammingRuby/)
- A method that substitutes part of a string: `'foobar'.sub('oo', 'u')`
- Information about [Ruby's regular
  expressions](http://ruby-doc.org/core-2.5.1/doc/regexp_rdoc.html)
- Information about [Ruby's ranges](http://ruby-doc.org/core-2.5.1/Range.html)

### Do

- Print the string "Hello, world."

```ruby
puts 'Hello, world.'
```

- For the string "Hello, Ruby" find the index of the word "Ruby."

```ruby
'Hello, Ruby'.index('Ruby')
```

- Print your name ten times.

```ruby
x = 0
while x < 10
    puts 'Patrick'
    x += 1
end
```

- Print the string "This is sentence number 1," where the number 1 changes from
  1 to 10.

```ruby
x = 1
while x <= 10
    puts "This is sentence number #{x}"
    x += 1
end
```

- Run a Ruby program from a file.

```bash
$ echo "puts 'Hello, World!" > hello.rb
ruby hello.rb
```

- Bonus: Number guessing game

```ruby
#!/usr/bin/ruby

number = rand(10) + 1
puts 'Guess a number between 1 and 10'
guess = gets.strip.to_i
if guess == number
    puts 'correct'
elsif guess < number
    puts 'too low'
elsif guess > number
    puts 'too high'
end
```
