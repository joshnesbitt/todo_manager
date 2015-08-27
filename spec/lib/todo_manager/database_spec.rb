describe TodoManager::Database do

  let(:path) { Tempfile.new('database').path }
  let(:database) { described_class.new(path) }

  context '#load' do

    context "when doesn't exist" do

      it "should create a new database" do
        expect(database.load).to eq([])
      end

    end

    context "when empty" do

      let(:path) { File.expand_path("#{__dir__}/../../fixtures/database-empty") }

      it "should initialize an empty database" do
        expect(database.load).to eq([])
      end

    end

    context "when populated" do

      let(:path) { File.expand_path("#{__dir__}/../../fixtures/database-populated") }
      let(:todo) { subject.first }

      subject(:collection) { database.load }

      it "should load models" do
        expect(collection.size).to eq(1)
        expect(todo.completed?).to be(true)
        expect(todo.content).to eq('Get milk')
      end

    end

  end

  context '#dump' do

    let(:todo) { TodoManager::Model.new('Test') }

    it "should dump models correctly" do
      expect(database.load.size).to eq(0)
      database.dump([ todo ])
      expect(database.load.size).to eq(1)
    end

  end

  context '#clear' do

    let(:todo) { TodoManager::Model.new('Test') }

    it "should reset the database" do
      database.dump([ todo ])
      expect(database.load.size).to eq(1)
      database.clear
      expect(database.load.size).to eq(0)
    end

  end

end
