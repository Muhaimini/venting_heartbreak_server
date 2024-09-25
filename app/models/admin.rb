class Admin < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :password, length: { minimum: 5 }

  # Override as_json to exclude password_digest
  def as_json(options = {})
    super(options.merge(except: [ :password_digest ]))
  end
end
