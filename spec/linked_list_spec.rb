require_relative "../lib/node"
require_relative "../lib/linked_list"

describe LinkedList do

  let(:linked_list) { LinkedList.new }
  let(:another_list) { LinkedList.new('Jeff', 'Jimmy', 'Joe')}
  before(:each) do
    linked_list.prepend("Adam")
    linked_list.prepend("Vikram")
    linked_list.prepend("Spencer")
  end

  describe 'initialize with multiple arguements' do
    it 'should return all the nodes in to_s' do
      expect(another_list.to_s).to eq("LinkedList(Jeff, Jimmy, Joe)")
      expect(another_list[0].info).to eq('Jeff')
      expect(another_list[1].info).to eq('Jimmy')
      expect(another_list[2].info).to eq('Joe')
    end
  end
  describe "#prepend" do
    it "adds a new item to an empty LinkedList" do
      empty_linked_list = LinkedList.new
      empty_linked_list.prepend("Adam")
      expect(empty_linked_list[0].info).to eq("Adam")
    end

    it "adds a new item to the beginning of a populated LinkedList" do
      linked_list.prepend("Christina")
      expect(linked_list[0].info).to eq("Christina")
      expect(linked_list[1].info).to eq("Spencer")
    end
  end

  describe "#[]" do
    it "returns node located at an index" do
      expect(linked_list[0].info).to eq("Spencer")
      expect(linked_list[2].info).to eq("Adam")
    end

    it "returns nil if index is out of range" do
      expect(linked_list[10]).to be_nil
    end
  end

  describe "#to_s" do
    it "returns a formatted string with the contents of the LinkedList" do
      expect(linked_list.to_s).to eq("LinkedList(Spencer, Vikram, Adam)")
    end

    it "returns a string with no contents listed inside LinkedList if empty" do
      empty_linked_list = LinkedList.new
      expect(empty_linked_list.to_s).to eq("LinkedList()")
    end
  end

  describe "#each" do
    it "accepts a block through yield" do
      expect { |b| linked_list.each(&b) }.to yield_successive_args(linked_list[0], linked_list[1], linked_list[2])
    end
  end

  describe "#insert" do
    it "inserts a node in the middle of list" do
      linked_list.insert(2, "Christina")
      expect(linked_list[2].info).to eq("Christina")
      expect(linked_list[3].info).to eq("Adam")
    end

    it "inserts a node at beginning of list" do
      linked_list.insert(0, "Christina")
      expect(linked_list[0].info).to eq("Christina")
      expect(linked_list[1].info).to eq("Spencer")
    end

    it "inserts a node at the end of a list" do
      linked_list.insert(3, "Christina")
      expect(linked_list[3].info).to eq("Christina")
    end
  end

  describe "#remove" do
    it "deletes a node from the middle of list" do
      linked_list.remove(1)
      expect(linked_list[1].info).to eq("Adam")
    end

    it "deletes a node from the beginning of the list" do
      linked_list.remove(0)
      expect(linked_list[0].info).to eq("Vikram")
    end
  end
end
