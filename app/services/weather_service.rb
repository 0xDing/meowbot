class WeatherService < ActiveType::Object
  attribute :request
  validates :request, presence: true

  def result
    msg = request.parameters['geo-city'].blank? ?
              request.query_text.sub('魔都','上海').sub('帝都','北京') : request.query_text
    # [0] == Returns the highest priority intention.
    RuyiInputService.new(user_id: request.session_id).text(msg)[0][:text]
  end


end