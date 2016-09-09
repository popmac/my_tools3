module DeviseHelper

  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="container" id="notice">
      <div class="alert alert-dismissable alert-danger fade in">
        <button class="close" data-dismiss="alert">
          <span>&times;</span>
        </button>
        #{sentence}
        #{messages}
        もう一度確認してから入力してください。
      </div>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
