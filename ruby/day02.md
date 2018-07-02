## Day 2

### Find

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

### Do

- Print the contents of an array of sixteen numbers, four numbers at a time, using just `each`. Now, do the same with `each_slice` in `Enumerable`.

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

- The `Tree` class was interesting, but it did not allow you to specify a new
  tree with a clean user interface. Let the initializer accept a nested
  structure of hashes. You should be able to specify a tree like this:
  `{'grandpa' => {'dad' => {'child 1' => {}, 'child 2 => {}}}, {'uncle' =>
  {'child 3' => {}, 'child 4' => {}}}}`

```ruby
class Tree
    attr_accessor :children, :node_name

    def initialize(tree,name='')
        if name == ''
            # root element: extract name from tree
            k, v = tree.first
            @node_name = k
            tree = tree[k]
        else
            # all other elements: invoked with name
            @node_name = name
        end

        @children = []
        tree.each do |k,v|
            @children.push(Tree.new(v,k))
        end
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

hash = {'grandpa' => {
        'dad' => {'child 1' => {'grandchild 1.1' => {}, 'grandchild 1.2' => {}},
                  'child 2' => {'grandchild 2.1' => {}, 'grandchild 2.2' => {}}},
        'uncle' => {'child 3' => {'grandchild 3.1' => {}, 'grandchild 3.2' => {}},
                    'child 4' => {'grandchild 4.1' => {}, 'grandchild 4.2' => {}}}
    }
}
hash_tree = Tree.new(hash)

puts "Visiting a node"
hash_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
hash_tree.visit_all {|node| puts node.node_name}
```
