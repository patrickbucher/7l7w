# Find

- Find out how to access files with and without code blocks. What is the
  benefit of the code block?

```ruby
# with code block
File.open('foo', 'w') {|f| f.write('bar')}

# without code block
f = File.open('foo', 'w')
f..write('bar')
```

The code block make the code shorter and doesn't pollute the namespace.

- How would you translate a hash to an array? Can you translate arrays to
  hashes?

```ruby
# hash to array
h = {:a => 'foo', :b => 'bar', :c => 'qux'}
a = []
h.each {|k,v| a.push(v)}

# array to hash
a = ['foo', 'bar', 'qux']
h = {}
a.each_index {|i| h[i] = a[i]}
```

- Can you iterate through a hash?

```ruby
i = 0
while i < h.keys.length
    puts h[h.keys[i]]
    i += 1
end
```

- You can use Ruby arrays as stacks. What other common data strucutres do
  arrays support?

```ruby
# Queue
a = [10, 20, 30]
a.shift # 10
a.push # 40
# a = [20, 30, 40]

# Ring Buffer
a = [1, 2, 3]
a.rotate # 2, 3, 1
a.rotate.rotate # 3, 1, 2
```

# Do

Print the contents of an array of sixteen numbers, four numbers at a time, using just `each`. Now, do the same with `each_slice` in `Enumerable`.

```ruby
# with each
i = 0
output = ''
(1..16).to_a.each do |x|
    i += 1
    output += " #{x}"
    if i % 4 == 0
        puts output
        output = ''
    end
end

# with each_slice
(1..16).to_a.each_slice(4) {|s| puts s.join(' ')}
```
