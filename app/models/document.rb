class Document < ApplicationRecord
  belongs_to :shipment, dependent: :destroy

  def status
    if path.nil?
      "Missing"
    else
      "Uploaded"
    end
  end

  def fs_path
    if path.nil?
      ""
    else
      '"' + Rails.root.join('public', path).to_s + '"'
    end
  end

  def web_path
    "/" + path
  end

  def sanitized_title
    title.strip.tap do |name|
      name.gsub! /[^\w\.\-]/, '_'
    end
  end
end
