# frozen_string_literal: true

# d
module UsersHelper
  def format_date_time(datetime)
    datetime.strftime("%d %B %Y, %H:%M:%S")
  end
end
