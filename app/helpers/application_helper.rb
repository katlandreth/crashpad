module ApplicationHelper

  def flash_button(name)
    name = name.to_sym
    flash_type = {success: "✔", error: "⦻", alert: "⚠", notice: "i"}
    flash_type[name]
  end
end
