# Validates whether a string is a valid US phone number in one of three accepted formats.
#
# Accepts exactly three formats:
# 1. (123) 456-7890 - Parentheses around 3-digit area code, space, then 3 digits, dash, 4 digits
# 2. 123-456-7890   - Three groups separated by dashes: 3 digits, dash, 3 digits, dash, 4 digits
# 3. 1234567890     - Ten digits with no separators
#
# All formats must contain exactly 10 digits representing:
# - 3-digit area code
# - 3-digit exchange code
# - 4-digit line number
#
# Rejects any other format including but not limited to:
# - Country codes (e.g., +1, 1-)
# - Extensions (e.g., ext. 123, x123)
# - Dot separators (e.g., 123.456.7890)
# - Space-only separators (e.g., 123 456 7890)
# - Incorrect digit groupings (e.g., (1234) 56-7890)
# - Leading or trailing whitespace
# - Non-digit characters (except valid separators in formats 1 and 2)
#
# Returns true if the phone number matches one of the three valid formats, false otherwise.
# Returns false for nil input.
#
# Examples:
#   valid_phone_number?("(123) 456-7890")  #=> true
#   valid_phone_number?("123-456-7890")    #=> true
#   valid_phone_number?("1234567890")      #=> true
#   valid_phone_number?("123.456.7890")    #=> false (dots not allowed)
#   valid_phone_number?("123 456 7890")    #=> false (space-only separators)
#   valid_phone_number?("+1-123-456-7890") #=> false (country code)
#   valid_phone_number?("123-456-789")     #=> false (only 9 digits)
#   valid_phone_number?(nil)               #=> false
#
# Hints:
# - Use alternation (|) to match the three different formats
# - Use grouping (...) to group the alternatives
def valid_phone_number?(phone)
  # TODO: Implement phone number validation using regex
end
