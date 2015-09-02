describe TodoManager::Client do

  LIST_INCOMPLETE_LINE = "%{index})  [ ] \e[0;31;49m%{content}\e[0m\n"
  LIST_COMPLETE_LINE   = "%{index})  [-] \e[0;32;49m%{content}\e[0m\n"

  let(:database_path) { Tempfile.new('database').path }
  let(:client) { described_class.new(database_path) }
  let(:model) { TodoManager::Model.new('Get milk') }
  let(:args) { [] }

  subject { client.run!(args) }

  context 'list' do

    let(:args) { %w( list ) }

    it "should return nothing when the collection is empty" do
      expect { subject }.to output('').to_stdout
    end

    it "should list incomplete todo items when the collection is populated with incomplete models" do
      client.todos << model
      expect { subject }.to output(LIST_INCOMPLETE_LINE % { index: 1, content: model.content }).to_stdout
    end

    it "should list complete todo items when the collection is populated with complete models" do
      client.todos << model.tap { |m| m.complete! }
      expect { subject }.to output(LIST_COMPLETE_LINE % { index: 1, content: model.content }).to_stdout
    end

    it "should increment the todo item index correctly" do
      expected = 3.times.map do |index|
        client.todos << (m = model.dup)
        LIST_INCOMPLETE_LINE % { index: index + 1, content: m.content }
      end

      expect { subject }.to output(expected.join).to_stdout
    end

  end

  context 'add' do

    let(:args) { %W( add #{model.content} ) }

    it "should add a todo" do
      expect(client.todos).to be_empty
      subject
      expect(client.todos.size).to be(1)
      expect(client.todos.first.content).to eq(model.content)
    end

  end

  context 'remove' do

    let(:args) { %w( remove 1 ) }

    it "should remove a todo" do
      client.todos << model
      expect(client.todos.size).to be(1)
      subject
      expect(client.todos).to be_empty
    end

  end

  context 'complete' do

    let(:args) { %w( complete 1 ) }

    it "should complete a todo" do
      client.todos << model
      expect(client.todos.first.completed?).to be(false)
      subject
      expect(client.todos.first.completed?).to be(true)
    end

  end

  context 'uncomplete' do

    let(:args) { %w( uncomplete 1 ) }

    it "should uncomplete a todo" do
      client.todos << model.tap { |m| m.complete! }
      expect(client.todos.first.completed?).to be(true)
      subject
      expect(client.todos.first.completed?).to be(false)
    end

  end

  context 'reset' do

    let(:args) { %w( reset ) }

    it "should reset the database" do
      client.todos << model
      expect(client.todos.size).to be(1)
      subject
      expect(client.todos.size).to be(0)
    end

  end

  context 'help' do

    let(:args) { %w( help ) }
    let(:help_text) { File.read("#{__dir__}/../../../help.txt") }

    it "should show the help documentation" do
      expect { subject }.to output(help_text).to_stdout
    end

  end

  context 'unsupported command' do

    let(:args) { %w( missing ) }
    let(:help_text) do
      text = "Unsupported command: missing\n"
      text << "\n"
      text << File.read("#{__dir__}/../../../help.txt")
      text
    end

    it "should report an error and show the help documentation" do
      expect { subject }.to output(help_text).to_stdout
    end

  end

end
