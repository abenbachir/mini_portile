require "spec_helper"
require "mini_portile"

describe MiniPortile do
  let(:logger) { Support::BlackHole.new }

  describe "#download" do
    let(:recipe) { MiniPortile.new("amhello", "1.0") }
    let(:url) { fixture_file("amhello-1.0.tar.gz") }
    in_temporary_directory

    before :each do
      recipe.logger = logger
      recipe.files << url
    end

    it "downloads the indicated files" do
      recipe.download
      FakeWeb.should have_requested(:get, url)
    end
  end
end