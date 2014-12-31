class Project < ActiveRecord::Base
    
    STATUS_PREPARE    = 0
	STATUS_ONLINE     = 1
	STATUS_OFFLINE    = 2
	STATUS_FINISH     = 3
	STATUS_BLOCK      = 4

	belongs_to :user
	has_one :project_detail
end
