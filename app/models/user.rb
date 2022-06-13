=begin

Fields
    -email:string
    -password_digest:string

Virtual attributes added by digest (secure way to store passwords)
    -password:string
    -password_confirmation:string

This works by saving the password inside the has_secure_password and password,
check that both match and then, it'll go into bcrypt to hash it  (secure it).

=end

class User < ApplicationRecord
    has_many :twitter_accounts

    has_secure_password

    # Makes sure that the email field is not empty and is valid:
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address"}
end
