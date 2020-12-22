class Task < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :content, length: { maximum: 255 }
  validate  :date_not_before_today

  def date_not_before_today
    errors.add(:finish_date, "は今日以降のものを選択してください") if finish_date.nil? || finish_date < Date.today
  end
end
