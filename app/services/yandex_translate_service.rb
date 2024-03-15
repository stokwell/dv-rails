class YandexTranslateService 
  def translate(input)
    response = call_yandex_api(input)
    
    UserTranslation.create() 

  end

  def call_yandex_api(input)

  end
end

