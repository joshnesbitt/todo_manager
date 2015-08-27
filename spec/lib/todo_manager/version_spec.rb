describe TodoManager::VERSION do

  let(:version) { TodoManager::VERSION }

  it "should have a version" do
    expect(version).to match(/\d\.\d\.\d/)
  end

end
