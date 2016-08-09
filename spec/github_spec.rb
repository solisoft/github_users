require "github"

RSpec.describe Github, "#languages" do
  it "contain many languages" do
    github = Github.new "solisoft"
    expect(github.favourites_languages).not_to be_empty
  end
  
  it "contain no languages" do
    github = Github.new "solisoft_demo_fail"
    expect(github.favourites_languages).to be_empty
  end
end