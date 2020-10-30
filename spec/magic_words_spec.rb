require 'tempfile'

RSpec.describe MagicWords do
  before do
    MagicWords::Dict.send(:remove_const, "TEST")
  rescue
    # do nothing
  end
  
  it "sets consts from a list" do
    MagicWords::Dict.from_list("test", ["one", "two", "three"])

    expect(MagicWords::Dict::TEST::ONE).to eq("one")
    expect(MagicWords::Dict::TEST::TWO).to eq("two")
    expect(MagicWords::Dict::TEST::THREE).to eq("three")
  end

  it "sets consts from a file" do
    file = Tempfile.new("words")
    file.write("one\ntwo\nthree\n")
    file.close

    MagicWords::Dict.from_file("test", file.path)

    expect(MagicWords::Dict::TEST::ONE).to eq("one")
    expect(MagicWords::Dict::TEST::TWO).to eq("two")
    expect(MagicWords::Dict::TEST::THREE).to eq("three")
  end
end
