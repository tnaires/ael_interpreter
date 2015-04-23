require 'lexer'

RSpec.describe Lexer do
  subject(:lexer) { Lexer.new }

  describe 'lex' do
    it 'ignores white spaces' do
      tokens = lexer.lex('    ')
      expect(tokens).to be_empty
    end

    it 'returns a list of tokens according to its type' do
      tokens = lexer.lex(' a 1 + ')

      expect(tokens.size).to be(3)
      expect(tokens[0]).to be_identifier
      expect(tokens[1]).to be_digit
      expect(tokens[2]).to be_operator
    end
  end
end
