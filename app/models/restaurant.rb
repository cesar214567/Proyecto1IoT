class Restaurant < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :dishes,dependent: :destroy

  validates :name, :description, :longitude, :latitude, presence: true
  reverse_geocoded_by :latitude, :longitude, address: :loc
  after_validation :reverse_geocode


  include PgSearch::Model
  pg_search_scope :general_search,
                  against: [ :name, :loc ],
                  associated_against: {
                    dishes: [:name]
                  }, using: {
                    tsearch: { prefix: true }
                  }
end
