class TaskPresenter < SimpleDelegator
  def initialize(task)
    __setobj__(task)
  end

  def eql?(target)
    target == self || product.eql?(target)
  end

  def description
    if __getobj__.description.present?
      helpers.content_tag(:span, __getobj__.description)
    else
      helpers.content_tag(:span, "#{__getobj__.class} don't have description")
    end
  end

  private
  def helpers
    ApplicationController.helpers
  end
end
