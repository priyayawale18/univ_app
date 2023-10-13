class Course < ApplicationRecord
  validates :name, presence: true, length: { mininum: 5, maximum: 50}

end