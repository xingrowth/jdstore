module FlashesHelper
  FLASH_CLASSES = { alert: "danger", notice: "success", waring: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sym, key
  end
end
