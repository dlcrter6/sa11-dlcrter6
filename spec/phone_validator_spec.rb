require 'rspec'
require_relative '../lib/phone_validator'

RSpec.describe '#valid_phone_number?' do
  context 'valid formats' do
    it 'accepts (123) 456-7890 format' do
      expect(valid_phone_number?('(123) 456-7890')).to be true
      expect(valid_phone_number?('(987) 654-3210')).to be true
    end

    it 'accepts 123-456-7890 format' do
      expect(valid_phone_number?('123-456-7890')).to be true
      expect(valid_phone_number?('555-867-5309')).to be true
    end

    it 'accepts 1234567890 format' do
      expect(valid_phone_number?('1234567890')).to be true
      expect(valid_phone_number?('9998887777')).to be true
    end
  end

  context 'invalid formats' do
    it 'rejects numbers with country code' do
      expect(valid_phone_number?('+1-123-456-7890')).to be false
    end

    it 'rejects numbers with extensions' do
      expect(valid_phone_number?('123-456-7890 ext. 123')).to be false
    end

    it 'rejects numbers with dot separators' do
      expect(valid_phone_number?('123.456.7890')).to be false
    end

    it 'rejects numbers with spaces instead of dashes' do
      expect(valid_phone_number?('123 456 7890')).to be false
    end

    it 'rejects too few or too many digits' do
      expect(valid_phone_number?('123-45-7890')).to be false
      expect(valid_phone_number?('12345678901')).to be false
    end

    it 'rejects malformed parentheses' do
      expect(valid_phone_number?('(123-456-7890')).to be false
      expect(valid_phone_number?('123) 456-7890')).to be false
    end

    it 'rejects invalid characters' do
      expect(valid_phone_number?('123-ABC-7890')).to be false
      expect(valid_phone_number?('123-456-78@0')).to be false
    end

    it 'rejects leading or trailing whitespace' do
      expect(valid_phone_number?(' 123-456-7890')).to be false
      expect(valid_phone_number?('123-456-7890 ')).to be false
    end

    it 'rejects empty string or nil' do
      expect(valid_phone_number?('')).to be false
      expect(valid_phone_number?(nil)).to be false
    end

    it 'rejects phone numbers embedded in text' do
      expect(valid_phone_number?('Call me at 123-456-7890 please')).to be false
    end

    it 'rejects wrong digit groupings' do
      expect(valid_phone_number?('12-3456-7890')).to be false
    end
  end
end