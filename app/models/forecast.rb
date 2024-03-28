class Forecast < ApplicationRecord

  def not_updated_within_last_30_minutes
    self.updated_at <= 30.minutes.ago
  end

end
