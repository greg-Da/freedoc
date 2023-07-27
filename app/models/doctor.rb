class Doctor < ApplicationRecord

    has_many :appointements
    has_many :patients, through: :appointements
    belongs_to :city
    has_many :speciality_doctors
    has_many :specialities, through: :speciality_doctors


end
