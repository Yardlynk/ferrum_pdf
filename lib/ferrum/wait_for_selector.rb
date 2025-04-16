module Ferrum::Frame::DOM
  def wait_for_selector(selector, init: nil, wait: 1, step: 0.1)
    sleep(init) if init

    until node = at_css(selector) rescue nil
      (wait -= step) > 0 ? sleep(step) : break
    end

    node
  end
end

class Ferrum::Page
  delegate %i[wait_for_selector] => :main_frame
end
