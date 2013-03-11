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
      :items => ["/admin/items.*", "/admin"],
      :log_book_events => ["/admin/log_book_events"]
    }

    path = request.fullpath.gsub(/\?.*/, "")

    return "active" if menus[actual_menu_name].any? { |e| path =~ /^#{e}$/ }
    return "no-active"
  end
end
