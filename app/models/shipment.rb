class Shipment < ApplicationRecord
  has_many :documents
  after_save :create_checklist
  after_save :create_uploads_directory

  def create_checklist
    self.documents.create(checklist_id: 1, title: "Witness Page")
    self.documents.create(checklist_id: 2, title: "PPPRA Import Permit Approval")
    self.documents.create(checklist_id: 3, title: "Notification of Nomination of Vessel")
  end

  def create_uploads_directory
    FileUtils.mkdir_p(Rails.root.join('public', upload_dir()))
  end

  def collate
    file_list   = self.documents.order(:checklist_id).map(&:fs_path).reject(&:blank?).join(" \\\n")
    output_file = Tempfile.new
    command = "pdftk " + file_list + " cat output " + output_file.path
    puts command
    command_status = system(command)

    if command_status
      return output_file
    else
      raise "Could not execute the following command: `" + command + "'"
    end
  end

  def upload_dir
    Pathname.new('uploads').join(id.to_s)
  end
end
