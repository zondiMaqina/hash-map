require_relative './linked_list.rb'

class HashMap < LinkedList
  attr_accessor :buckets, :capacity, :collisions
  def initialize(capacity = 15)
    @capacity = capacity
    @buckets = Array.new(@capacity)
    @load_factor = 0.75
    @entries = 0
    @collisions = 0 # keeps track of collisions
  end

  def hash(key)
    @entries += 1
    code = 0
    prime = 31
    key.each_char { |char| code = prime * code + char.ord}
    code % @capacity # returns code for inserted key
  end

  def set(key, value)
    # add error if key is out of bucket order
    hashed_key = hash(key)
    new_node = Node.new(hashed_key, value)
    if @buckets[hashed_key] == nil
      @buckets[hashed_key] = new_node # adds new node to empty index
    elsif @buckets[hashed_key].code == hashed_key
      @buckets[hashed_key].value = value # repleces existing node's value (collision incident)
      @collisions += 1
    elsif @buckets[hashed_key].code != hashed_key
      @buckets[hashed_key].append(hashed_key, value) # appends node to existing node as tail
    end
    resize if product < @entries # doubles size of array if entries are more than load factor
  end

  def resize
    double_size = Array.new(@capacity)
    @capacity = @capacity * 2
    @buckets = @buckets + double_size # doubles size of array
  end

  def product
    @load_factor * @capacity
  end
end
