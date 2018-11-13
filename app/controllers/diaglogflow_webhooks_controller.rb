class DiaglogflowWebhooksController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: ENV['GCP_PROJECT_ID'], password: ENV['GCP_DF_TOKEN']

  def index
    query = DialogflowWebhookParserService.new(raw: params)
    @text = intent_router(query.intent_name, query)
    #telegram_send query, @text
    render 'diaglogflow_webhooks/index'
  end

  protected

  def intent_router(intent_name, query)
    # Only a single context is currently supported.
    service = "#{intent_name}_service".classify
    service.constantize.new(request: query).result
  rescue NameError => e
    "夭寿啦~ 铲屎的把 <code>#{service}</code> 弄丢啦：）（#{e}）"
  rescue => e
    "夭寿啦~ 铲屎的把 <code>#{service}</code> 搞瓦特啦：）（#{e}"
  end

  protected

  def telegram_send(query, text)
    chat_id = query.session_id.split('_')[-1]
    Telegram.bot.send_message(chat_id: chat_id, text: text, parse_mode: 'html')
  end

end
