class Model < ActiveRecord::Base
  belongs_to :make

  validates :name, uniqueness: { scope: :make_id }

  def webmotors_make_id=(value)
    self.make = Make.find_by(webmotors_id: value)
  end
end
