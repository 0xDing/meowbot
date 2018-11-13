Rails.application.routes.draw do
  telegram_webhook TelegramWebhooksController, :default
  root 'page#index'
  post '/diaglogflow_webhooks' => 'diaglogflow_webhooks#index'
end
