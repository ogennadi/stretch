class Shipment < ApplicationRecord
  has_many :documents
  after_save :create_checklist
  after_save :create_uploads_directory

  def create_uploads_directory
    FileUtils.mkdir_p(Rails.root.join('public', upload_dir()))
  end

  def collate
    file_list   = self.documents.order(:checklist_id).map(&:fs_path).reject(&:blank?).join(" \\\n")
    output_file = Tempfile.new
    command = "pdftk " + file_list + " cat output " + output_file.path
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

  def create_checklist
    documents.create(checklist_id: 1, title: "Witness Page")
    documents.create(checklist_id: 2, title: "PPPRA Import Permit Approval")
    documents.create(checklist_id: 3, title: "Notification of Nomination of Vessel")
    documents.create(checklist_id: 4, title: "DPR Import Permit")
    documents.create(checklist_id: 5, title: "Performance Guarantee Page (Quarterly)")

    documents.create(checklist_id: 6, title: "Evidence from the Bank showing the amount paid on the Transaction and Quantity Verifiable with Central Bank of Nigeria (CBN)")
    documents.create(checklist_id: 7, title: "Letter of Credit for the Transaction")
    documents.create(checklist_id: 8, title: "A Final Invoice Relating to the Transaction")
    documents.create(checklist_id: 9, title: "Form M")
    documents.create(checklist_id: 10, title: "Proforma Invoice")
    documents.create(checklist_id: 11, title: "Letter from Trader/Supplier")
    documents.create(checklist_id: 12, title: "Marine Insurance")

    documents.create(checklist_id: 13, title: "Bill of Lading - (Mother Vessel)")
    documents.create(checklist_id: 14, title: "Certificate of Origin - (Mother Vessel)")
    documents.create(checklist_id: 15, title: "Cargo Manifest - (Mother Vessel)")
    documents.create(checklist_id: 16, title: "Certificate of Quantity (Load Port) - (Mother Vessel)")
    documents.create(checklist_id: 17, title: "Certificate of Quality (Load Port) - (Mother Vessel)")
    documents.create(checklist_id: 18, title: "Notice of Readiness (Load Port) - (Mother Vessel)")
    documents.create(checklist_id: 19, title: "Vessels Survey Report After Loading (Mother Vessel)")
    documents.create(checklist_id: 20, title: "Time Log @ Load Port (Mother Vessel)")
    documents.create(checklist_id: 21, title: "Bunker Survey Report")
    documents.create(checklist_id: 22, title: "Cargo Pumping Log")

    documents.create(checklist_id: 23, title: "Bill of Lading (Daughter Vessel")
    documents.create(checklist_id: 24, title: "Certificate of Origin (Daughter Vessel)")
    documents.create(checklist_id: 25, title: "Cargo Manifest (Daughter Vessel)")
    documents.create(checklist_id: 26, title: "Certificate of Quantity (Daughter Vessel)")
    documents.create(checklist_id: 27, title: "Certificate of Quality (Daughter/Mother Vessel")
    documents.create(checklist_id: 28, title: "Notice of Readiness (Mother/Daughter Vessel")
    documents.create(checklist_id: 29, title: "Vessel Ullage Report on Arrival Before Discharge to Daughter Vessel - (Mother Vessel)")
    documents.create(checklist_id: 30, title: "Vessel Ullage Report after Discharge (Rob) of Mother Veseel Vessel")
    documents.create(checklist_id: 31, title: "Vessel Survey Report After Loading (Daughter Vessel")
    documents.create(checklist_id: 32, title: "Certificate of Transfer")
    documents.create(checklist_id: 33, title: "Bunker Survery Report")
    documents.create(checklist_id: 34, title: "Cargo Pumping Log (Mother Vessel)")
    documents.create(checklist_id: 35, title: "Time Log @ Offshore")

    documents.create(checklist_id: 36, title: "Vessels Survey Report Before Discharge - (PPRA)")
    documents.create(checklist_id: 37, title: "Time Log @ Discharge Port")
    documents.create(checklist_id: 38, title: "Vessel Experience Factor")
    documents.create(checklist_id: 39, title: "Bunker Survey Report")
    documents.create(checklist_id: 40, title: "Cargo Pumping Log")
    documents.create(checklist_id: 41, title: "Letter of Protest (if any)")
    documents.create(checklist_id: 42, title: "Notice of Readiness @ Discharge Port")
    documents.create(checklist_id: 43, title: "Certificate of Quality/Certificate of Quantity @ Discharge Port - (PPPRA Inspectors)")
    documents.create(checklist_id: 44, title: "Shore Tank Report - (PPPRA Inspectors)")
    documents.create(checklist_id: 45, title: "PPPRA Arrival Ullage/Shore Tank Report/Empty & Dry Tank")
    documents.create(checklist_id: 46, title: "Tank Inspection/Rob Report - (PPPRA Inspectors)")
    documents.create(checklist_id: 47, title: "DPR Vessel Report")
    documents.create(checklist_id: 48, title: "Nigeria Customs Service Clearance")
    documents.create(checklist_id: 49, title: "Nigeria Navy Clearance")
    documents.create(checklist_id: 50, title: "NPA Clearance")
    documents.create(checklist_id: 51, title: "Letter of Affirmation of Discharge from Depot of Discharge")
    documents.create(checklist_id: 52, title: "Covering Page on Company's Letter Head Showing Detail of Transaction")
  end
end
