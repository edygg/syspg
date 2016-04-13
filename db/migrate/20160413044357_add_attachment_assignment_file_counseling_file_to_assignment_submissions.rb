class AddAttachmentAssignmentFileCounselingFileToAssignmentSubmissions < ActiveRecord::Migration
  def self.up
    change_table :assignment_submissions do |t|
      t.attachment :assignment_file
      t.attachment :counseling_file
    end
  end

  def self.down
    remove_attachment :assignment_submissions, :assignment_file
    remove_attachment :assignment_submissions, :counseling_file
  end
end
