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
