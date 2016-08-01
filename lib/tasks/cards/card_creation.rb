if Rails.env.development?
  require 'rqrcode'

  include RQRCode

  WIDTH = 850 / 2
  HEIGHT = 540 / 2
  QR_SIZE = HEIGHT / 4
  LOGO_SIZE = QR_SIZE / 4
  NAME = proc { |card| "#{card.uid}.png" }
  PATH = Rails.root.join('lib', 'tasks', 'cards')

  def get_custom_qr_code
    qr = QRCode.new(card.uid)
    qr_image = ChunkyPNG::Image.new(QR_SIZE, QR_SIZE, ChunkyPNG::Color::WHITE)
    module_size = (QR_SIZE.to_f / qr.module_count.to_f).floor.to_i
    custom_module = ChunkyPNG::Image.from_file(PATH.join('imgs/module.png'))
    custom_module = custom_module.resize(module_size, module_size)
    qr.modules.each_index do |row|
      qr.modules.each_index do |col|
        qr_image.compose!(custom_module, row * module_size, col * module_size) if qr.dark?(row, col)
      end
    end
  end

  def get_qr_code(card, logo = nil)
    qr = QRCode.new(card.uid)
    img = qr.as_png(border_modules: 0, size: QR_SIZE)
    img.compose!(logo, QR_SIZE / 2 - logo.width / 2, QR_SIZE / 2 - logo.height / 2) if logo
    img
  end

  def get_card_image(card)
    image = ChunkyPNG::Image.from_file(PATH.join("imgs/template#{WIDTH}x#{HEIGHT}.png"))
    logo = ChunkyPNG::Image.from_file(PATH.join("imgs/logo#{LOGO_SIZE}.png"))
    qr = get_qr_code(card, logo.resize(LOGO_SIZE, LOGO_SIZE))
    image.compose!(qr, WIDTH - QR_SIZE - 10, HEIGHT - QR_SIZE - 10)
    image.save(PATH.join('out', NAME.call(card)), :fast_rgba)
  end
end
