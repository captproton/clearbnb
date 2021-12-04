# == Schema Information
#
# Table name: reservations
#
#  id                       :bigint           not null, primary key
#  listing_id               :bigint           not null
#  guest_id                 :bigint           not null
#  session_id               :string
#  status                   :integer          default("pending")
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  stripe_payment_intent_id :string
#
class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: 'User'
  enum status: {pending: 0, booked: 1, canceling: 3, cancelled: 2}
end
