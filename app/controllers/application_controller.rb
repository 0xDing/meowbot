class ApplicationController < ActionController::API
  def detect_client_ip
    client_ip = request.remote_ip

    # reset if possible
    header_keys = %w(HTTP_X_FORWARDED_FOR) # REMOTE_ADDR HTTP_X_REAL_IP
    header_keys.each do |k|
      val = request.env[k]
      # rubocop:disable Sequoia/SimpleModifierConditional
      next if val.blank? || val.include?('192.168')
      return val
    end
    client_ip
  end

  def api_error(error, msg = nil)
    msg ||= error.to_s.humanize
    res = {
        error: {title: error, detail: msg, timestamp: Time.now.to_i}
    }
    render(json: res, status: error) && true
  end

  def render_form_error(object)
    if object.blank?
      api_error :not_found
    elsif object.is_a?(String)
      api_error :bad_request, object
    elsif object.errors.any?
      api_error :bad_request, show_error(object)
    else
      api_error :internal_server_error
    end
  end

  private

  def show_error(ar_object)
    ar_object.errors.full_messages.join(' · ')
  end

end
