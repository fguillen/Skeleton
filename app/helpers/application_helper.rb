module ApplicationHelper
  def twitterized_type(type)
    case type
      when :alert
        "alert alert-error"
      when :notice
        "alert alert-success"
      else
        type.to_s
    end
  end

  def admin_menu_class(actual_menu_name)
    menus = {
      :admin_users => ["/admin/admin_users.*"],
      :items => ["/admin/items.*", "/admin"]
    }

    menus.each do |menu_name, menu_paths|
      return "active" if actual_menu_name == menu_name && menu_paths.any? { |e| request.fullpath.gsub(/\?.*/, "") =~ /^#{e}$/ }
    end

    return "no-active"
  end
end
