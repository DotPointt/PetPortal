class UserDecorator < Draper::Decorator
  delegate_all

  def name_or_email
    if first_name.present?
      first_name
    else
      email
    end
  end

end
