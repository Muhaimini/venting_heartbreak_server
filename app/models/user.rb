class User < ApplicationRecord
  has_one :subscription, dependent: :destroy
  belongs_to :role

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }

  # Override as_json to exclude password_digest
  def as_json(options = {})
    super(options.merge(
      include: {
        role: {
          only: [ :id, :value ]
        },
        subscription: {
          only: [ :id, :expired_at ]
        }
      },
      except: [ :password_digest, :role_id ]
    ))
  end
end
