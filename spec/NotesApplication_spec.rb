require_relative '../NotesApplication.rb'
require 'yaml'

require 'spec_helper'
 
describe NotesApplication do
  before :each do
    @notes_application = NotesApplication.new "Author_name"
    @notes_application.create("Whatever you are saying")
    @notes_application.create("That is non of my business")
  end

  describe "#new" do
    it "takes one parameter and returns a NotesApplication object" do
      @notes_application.should be_an_instance_of NotesApplication
    end
  end

  describe "@author" do
    it "returns the correct author" do
        @notes_application.author.should eql "Author_name"
    end
  end

  describe "#create" do
    it "takes one parameter, create a note and return status" do
      @notes_application.create("Whatever").should include ("successfully")
    end
  end

  describe "#get" do
    it "takes one parameter, and return its content" do
      @notes_application.get(0).should include ("Note ID: 0")
    end
  end

  describe "#search" do
    it "takes one parameter, and output notes containing it" do
      @notes_application.search("you").should include ("successful")
    end
  end

end