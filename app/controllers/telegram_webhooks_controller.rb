class TelegramWebhooksController < Telegram::Bot::UpdatesController
  around_action :auth_user!
  Telegram::Bot::Client.typed_response!
  include Telegram::Bot::UpdatesController::MessageContext
  self.session_store = :file_store,"#{Rails.root}/tmp/cache/"

  # Every update can have one of: message, inline_query, chosen_inline_result,
  # callback_query, etc.
  # Define method with same name to respond to this updates.
  def message(message)
  respond_with :message, text: '哼！ 铲屎哒~ 我只接受 `/cat 命令` 形式的撩哦 o(^・x・^)o'
  end

  # command: `/start`
  def start!(data = nil, *)
    respond_with :message, text: "#{from['first_name']}~ #{from['first_name']}~ 我是可爱滴狗子啊~ 快用 `/cat 命令` 的形式撸我吧 喵鸣~ (ฅ\'ω\'ฅ)"
  end

  def cat!(data = nil, *)
    # remove substring `/cat `
    message = payload['text'][5..-1]
    return false if message.blank?
    text = diaglogflow_text_input(message)
    if text.present?
      respond_with :message, text: text ,parse_mode: 'html'
    end
  end

  protected

  # Only allow authenticated user
  def auth_user!
    if ENV['TG_HOST_IDS']&.split(',')&.include?(from['id'].to_s)
      yield
    else
      respond_with :message, text: '喵鸣~ 我只接受铲屎哒的命令 (●･̆⍛･̆●) '
    end
  end

  def diaglogflow_text_input(message)
    session = DialogflowInputService.new(session_id: "tguser-#{from['id']}_#{chat['id']}")
    resp = session.text(message)

    resp.fulfillment_text
  end

end
