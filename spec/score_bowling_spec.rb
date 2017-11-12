require 'spec_helper'
 
describe ScoreBowling do
 describe "calculating score" do
    let(:score_bowling) { described_class.new }

    context "when throws are valid" do
      {
        "xxxxxxxxxxxx"          => "Congratulations!! Your score is 300",
        "00000000000000000000"  => "Sorry!! Your score is 0",
        "90909090909090909090"  => "Overall score is : 90",
        "5/5/5/5/5/5/5/5/5/5/5" => "Overall score is : 150",
        "14456/5/00017/6/002/6" => "Overall score is : 82",
        "9/356136815325807181"  => "Overall score is : 86",
        "903/613/815/0/807/80"  => "Overall score is : 121",
        "x3/61xxx2/907/xxx"     => "Overall score is : 193"
      }.each do |result_input_string, score|

        it "returns #{score} for #{result_input_string}" do
          expect(score_bowling.calculate(result_input_string)).to eq score
        end

      end
    end
  end
end