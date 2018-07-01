class Tree
    attr_accessor :children, :node_name

    def initialize(tree,name='')
        k, v = tree.first
        @node_name = k
        if name != ''
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
        'dad' => {'child 1' => {}, 'child 2' => {}},
        'uncle' => {'child 3' => {}, 'child 4' => {}}
    }
}
hash_tree = Tree.new(hash)

puts "Visiting a node"
hash_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
hash_tree.visit_all {|node| puts node.node_name}
