class Property < ApplicationRecord
  has_many :stations, dependent: :delete_all
  validates :property, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :building_age, presence: true
  validates :rent, numericality:true

  accepts_nested_attributes_for :stations, reject_if: :all_blank, :allow_destroy => true

  def check
    if minutes_walk.present? && minutes_walk1.present?
      if minutes_walk <= minutes_walk1
        errors.add(:minutes_walk, 'Station 1 is further than Station 2')
      end
    end
  end
end
