# Parent record model. All ActiveRecord models should inherit from it.
#
# It is abstract, so it cannot be instantiated.
class ApplicationRecord < ActiveRecord::Base
  # Cannot be instanciated
  self.abstract_class = true
end
