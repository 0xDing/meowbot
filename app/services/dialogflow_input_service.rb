class DialogflowInputService < ActiveType::Object
  attribute :project_id, :string,default: proc { ENV['GCP_PROJECT_ID'] }
  attribute :session_id, :string
  attribute :lang, :string, default: proc { 'zh-CN' }
  validates :project_id, presence: true
  validates :session_id, presence: true
  validates :lang, presence: true

  attr_accessor :session_client, :session
  after_initialize :dialogflow_initialize

  def text(message)
    query_input = { text: { text: message, language_code: lang } }
    @session_client.detect_intent(@session, query_input).query_result
  end

  protected

  def dialogflow_initialize
    @session_client = Google::Cloud::Dialogflow::Sessions.new
    @session = session_client.class.session_path project_id, session_id
  end
end