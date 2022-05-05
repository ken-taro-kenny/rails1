class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :detail, length: { maximum: 30 }
  
  validate :start_end_check

  def start_end_check
    unless start_date == nil || end_date == nil
      errors.add(:end_date, "は開始日より前の日付は登録できません。") unless
      start_date <= end_date
    end
  end
end
