module DeviseHelper

  def devise_error_messages!
    return "" unless devise_error_messages?

    html = <<-HTML
    <div class="container" id="notice">
      <div class="alert alert-dismissable alert-danger fade in">
        <button class="close" data-dismiss="alert">
          <span>&times;</span>
        </button>
        入力情報に不備があります。もう一度確認してから入力してください。
      </div>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
