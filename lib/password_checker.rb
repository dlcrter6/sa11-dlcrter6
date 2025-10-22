# Validates whether a password meets strength requirements.
#
# A strong password must satisfy all of the following criteria:
# - Contains at least one uppercase letter (A-Z)
# - Contains at least one lowercase letter (a-z)
# - Contains at least one digit (0-9)
# - Contains at least one special character from the set: !@#$%^&*
# - Has a length between 8 and 20 characters (inclusive)
# - Contains only the allowed characters (letters, digits, and the special chars listed above)
# - Does not contain spaces or any other characters
#
# Returns true if the password meets all requirements, false otherwise.
# Returns false for nil input.
#
# Examples:
#   strong_password?("Passw0rd!")      #=> true
#   strong_password?("MyP@ssw0rd")     #=> true
#   strong_password?("password")       #=> false (no uppercase, no digit, no special char)
#   strong_password?("PASSWORD123!")   #=> false (no lowercase)
#   strong_password?("Short1!")        #=> false (only 7 characters)
#   strong_password?(nil)              #=> false
#
# Hints:
# - Use positive lookaheads to check for each character type requirement
# - Use anchors to match the entire string
def strong_password?(password)
  # TODO: Implement password validation using regex
end
