class Efemeride < ApplicationRecord
    mount_uploader :photo, ImageUploader
    scope :requests_today, -> { where created_at: Time.current.beginning_of_day..Time.current.end_of_day }
end
