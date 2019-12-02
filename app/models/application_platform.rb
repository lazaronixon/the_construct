class ApplicationPlatform < PlatformAgent
  def mobile_app?
    match? /TheConstructMobile/
  end
end
