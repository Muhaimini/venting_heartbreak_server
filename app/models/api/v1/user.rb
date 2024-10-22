class Api::V1::User < ApplicationRecord
  has_one :subscription, dependent: :destroy
  belongs_to :role, optional: true

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }

  # Override as_json
  def as_json(options = {})
    super(options.merge(
      include: {
        role: {
          only: [ :value ] # :id, :value
        }
        # subscription: {
        #   only: [ :id, :expired_at ]
        # }
      },
      except: [ :password_digest, :role_id, :subscription_id ]
    ))
  end
end
