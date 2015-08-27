describe TodoManager::Model do

  let(:content) { 'Get milk' }

  subject(:model) { described_class.new(content) }

  context 'content' do

    it "should have content" do
      expect(model.content).to eq(content)
    end

  end

  context 'completed status' do

    it "should be incomplete by default" do
      expect(model.completed?).to be(false)
    end

    it "should be completable" do
      model.complete!
      expect(model.completed?).to be(true)
    end

    it "should be uncompletable" do
      model.complete!
      expect(model.completed?).to be(true)
      model.uncomplete!
      expect(model.completed?).to be(false)
    end

  end

end
