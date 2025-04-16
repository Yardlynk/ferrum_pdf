module FerrumPdf
  module Controller
    extend ActiveSupport::Concern

    def render_pdf(pdf_options: {}, authorize: nil, wait_for_idle_options: {}, wait_for_selector: nil, **rendering)
      content = render_to_string(**rendering.with_defaults(formats: [ :html ]))

      FerrumPdf.render_pdf(
        html: content,
        host: request.base_url + "/",
        protocol: request.protocol,
        pdf_options: pdf_options,
        authorize: authorize,
        wait_for_idle_options: wait_for_idle_options,
        wait_for_selector: wait_for_selector,
      )
    end

    def render_screenshot(screenshot_options: {}, authorize: nil, wait_for_idle_options: {}, wait_for_selector: nil, **rendering)
      content = render_to_string(**rendering.with_defaults(formats: [ :html ]))

      FerrumPdf.render_screenshot(
        html: content,
        host: request.base_url + "/",
        protocol: request.protocol,
        screenshot_options: screenshot_options,
        authorize: authorize,
        wait_for_idle_options: wait_for_idle_options,
        wait_for_selector: wait_for_selector,
      )
    end
  end
end
