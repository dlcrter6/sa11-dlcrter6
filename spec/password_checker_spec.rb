require_relative '../lib/password_checker'

RSpec.describe "strong_password?" do
  context "valid passwords" do
    # Basic valid password
    it "accepts a password with all requirements" do
      expect(strong_password?("Passw0rd!")).to be true
    end

    # Length boundaries
    it "accepts passwords exactly 8 characters long" do
      expect(strong_password?("Passw0r!")).to be true
    end

    it "accepts passwords exactly 20 characters long" do
      expect(strong_password?("Passw0rd!12345678901")).to be true
    end

    # Position independence
    it "accepts passwords with digit at the beginning" do
      expect(strong_password?("1Abcdefg!")).to be true
    end

    it "accepts passwords with special char at the beginning" do
      expect(strong_password?("!Password1")).to be true
    end

    it "accepts passwords with special char at the end" do
      expect(strong_password?("Password1!")).to be true
    end

    # Multiple occurrences
    it "accepts passwords with multiple of each requirement" do
      expect(strong_password?("AABBcc12!!")).to be true
    end

    # All special characters
    it "accepts passwords with all allowed special characters" do
      expect(strong_password?("Pass!w0rd")).to be true
      expect(strong_password?("Pass@w0rd")).to be true
      expect(strong_password?("Pass#w0rd")).to be true
      expect(strong_password?("Pass$w0rd")).to be true
      expect(strong_password?("Pass%w0rd")).to be true
      expect(strong_password?("Pass^w0rd")).to be true
      expect(strong_password?("Pass&w0rd")).to be true
      expect(strong_password?("Pass*w0rd")).to be true
    end
  end

  context "invalid passwords" do
    # Missing single requirement
    it "rejects passwords missing uppercase letter" do
      expect(strong_password?("passw0rd!")).to be false
    end

    it "rejects passwords missing lowercase letter" do
      expect(strong_password?("PASSW0RD!")).to be false
    end

    it "rejects passwords missing digit" do
      expect(strong_password?("Password!")).to be false
    end

    it "rejects passwords missing special character" do
      expect(strong_password?("Passw0rd")).to be false
    end

    # Length boundaries
    it "rejects passwords exactly 7 characters (too short)" do
      expect(strong_password?("Passw0!")).to be false
    end

    it "rejects passwords exactly 21 characters (too long)" do
      expect(strong_password?("Passw0rd!123456789012")).to be false
    end

    it "rejects empty strings" do
      expect(strong_password?("")).to be false
    end

    # Invalid characters
    it "rejects passwords with invalid special characters" do
      expect(strong_password?("Passw0rd-")).to be false
      expect(strong_password?("Passw0rd_")).to be false
      expect(strong_password?("Passw0rd.")).to be false
    end

    it "rejects passwords with spaces" do
      expect(strong_password?("Pass w0rd!")).to be false
    end

    # Only one character type
    it "rejects passwords with only special characters" do
      expect(strong_password?("!!!!!!!!")).to be false
    end

    it "rejects passwords with only digits" do
      expect(strong_password?("12345678")).to be false
    end

    it "rejects passwords with only letters" do
      expect(strong_password?("Abcdefgh")).to be false
    end

    # Edge cases
    it "rejects nil input gracefully" do
      expect(strong_password?(nil)).to be false
    end

    # Missing multiple requirements
    it "rejects passwords missing multiple requirements" do
      expect(strong_password?("password1")).to be false  # missing uppercase + special
      expect(strong_password?("Password")).to be false   # missing digit + special
    end
  end
end
