class Alert < ActiveRecord::Base
  attr_accessible :priority, :product, :trigger
end
