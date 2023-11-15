class Product < ApplicationRecord
  validates :author, format: { with: /\A[a-zA-Z\s]+\z/,
  message: "only allows letters" }, allow_nil: true,presence: true   #, if: :title_NguyenDu 
  validates_with ProductValidator, fields: [:title,:author]
  validates :title, uniqueness: true, on: :create # chi duoc trung khi cap nhat 
  validates :date_end, comparison:{greater_than: :date_start}, allow_blank: true
  validate :end_date_must_be_greater_than_start_date
  belongs_to :user
  private

  def end_date_must_be_greater_than_start_date
    return if date_end.blank? || date_start.blank?

    unless date_end > date_start
      errors.add(:date_end, "must be greater than the start date")
    end
  end

end

class ProductValidator < ActiveModel::Validator
  def validate(record)
    if record.author == "Nguyen Du"
      record.errors.add :base, "Nguyen Du not a valid"
    end

    if options[:fields].any? { |field| record.send(field) == "Evil" }
      record.errors.add :base, "This Product is evil"
    end
  end
  # def title_nguyendu?
  #   title =="NguyenDu"
  # end
end
