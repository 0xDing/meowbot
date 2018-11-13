class DialogflowWebhookParserService < ActiveType::Object
  attribute :query_text
  attribute :parameters
  attribute :intent
  attribute :raw
  attribute :session_id
  validates :raw, presence: true

  after_initialize :parser

  def intent_name
    intent['displayName']
  end

  protected

  def parser
    self.query_text = raw['queryResult']['queryText']
    self.parameters = raw['queryResult']['parameters']
    self.intent = raw['queryResult']['intent']
    self.session_id = raw['session'].split('/')[-1]
  end

end