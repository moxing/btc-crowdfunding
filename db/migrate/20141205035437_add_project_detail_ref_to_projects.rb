class AddProjectDetailRefToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :project_detail, index: true
  end
end
