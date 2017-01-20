require 'pry'
require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def [](index)
    temp = @head
    index.times do
      if temp.next_node.nil?
        return temp = nil
      else
        temp = temp.next_node
      end
    end
    temp
  end

  def info
    @head
  end

  def prepend(value)
    node = Node.new(value, @head)
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def to_s
    node = self.info
    if node.nil?
      return "LinkedList()"
    end
    output = "LinkedList(#{node.data}"
    while node
      node = node.next_node
      if node.nil?
        break
      end
      output += ", #{node.data}"
    end
    output += ')'
  end

  def each
    node = @head
    while !node.nil?
      yield node
      node = node.next_node
    end
  end

  def insert(num, value)
    if num == 0
      self.prepend(value)
    else
      prev_node = self[num-1]
      next_node = self[num]
      prev_node.next_node = Node.new(value, next_node)
    end
  end

  def remove(num)
    if num == 0
      @head = self[num].next_node
    else
      prev_node = self[num-1]
      this_node = self[num]
      next_node = self[num+1]
      prev_node.next_node = next_node
      this_node.next_node = nil
    end
  end

end
