# frozen_string_literal: true

RSpec.describe Loaders::Text do
  describe "#load" do
    it "loads text" do
      file_path = Langchain.root.join("../spec/fixtures/loaders/example.txt")

      subject = described_class.new(file_path)

      expect(subject).to be_loadable
      expect(subject.load).to include("Lorem Ipsum")
    end
  end

  describe "#loadable?" do
    it "returns false" do
      file_path = Langchain.root.join("../spec/fixtures/loaders/cairo-unicode.pdf")

      subject = described_class.new(file_path)

      expect(subject).not_to be_loadable
    end
  end
end
