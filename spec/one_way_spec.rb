RSpec.describe '.one_way?' do
  {
    ['pale', 'ple'] => true, # one addition away
    ['pales', 'pale'] => true, # one deletion away
    ['pale', 'bale'] => true, # one replacement away
    ['pale', 'bake'] => false, # two replacements away
    ['pale', 'pale'] => false, # no addition, no deletion, no replacement
    # ---- the other way around
    ['ple',  'pale'] => true, # one addition away
    ['pale', 'pales'] => true, # one deletion away
    ['bale', 'pale'] => true, # one replacement away
    # ---- some other false cases
    ['ple', 'pales'] => false, # two additions away
    ['ple', 'p'] => false, # two deletions away
  }.each do |input, expected_output|
    context "when #{input}" do
      it "returns #{expected_output}" do
        expect(one_way?(input[0], input[1])).to eq(expected_output)
      end
    end
  end
end
