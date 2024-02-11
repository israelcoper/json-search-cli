RSpec.describe Json::Search::Cli do
  it "has a version number" do
    expect(Json::Search::Cli::VERSION).not_to be nil
  end

  context "Instance methods" do
    subject { described_class.new }

    describe "#search" do
      it "returns empty array" do
        expect(subject.search('madagascar')).to eq []
      end

      it "returns partially match keyword" do
        expect(subject.search('jane')).to eq [
          {"id"=>2, "full_name"=>"Jane Smith", "email"=>"jane.smith@yahoo.com"},
          {"id"=>15, "full_name"=>"Another Jane Smith", "email"=>"jane.smith@yahoo.com"}
        ]
      end
    end

    describe "#duplicate_email" do
      it "returns any records with the same email" do
        expect(subject.duplicate_email).to eq [
          {"id"=>2, "full_name"=>"Jane Smith", "email"=>"jane.smith@yahoo.com"},
          {"id"=>15, "full_name"=>"Another Jane Smith", "email"=>"jane.smith@yahoo.com"}
        ]
      end
    end
  end
end
