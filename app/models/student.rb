class Student < ActiveRecord::Base
  validates_presence_of :name

  def self.unpicked
    Student.where("last_called IS NULL OR last_called < ?", 1.day.ago)
  end
end
