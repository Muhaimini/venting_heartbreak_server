class Api::V1::UserGuest < ApplicationRecord
  belongs_to :role, optional: true

  validates :device_id, presence: true, uniqueness: true

  def as_json(options = {})
    super(options.merge(
      include: {
        role: {
          only: [ :value ]
        }
      },
      except: [ :role_id ]
    ))
  end
end
