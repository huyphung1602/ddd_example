# typed: strict

class WidgetCode < T::Struct
  extend T::Sig

  prop :code, String

  sig { returns(String) }
  def value
    if code.size != 5
      raise StandardError.new('Wiget Code must have 5 characters')
    elsif code.slice(0) != 'W'
      raise StandardError.new('Wiget Code must begin with W')
    elsif !T.must(code.slice(1, 4)).match?(/[0-9]{4}/)
      raise StandardError.new('Wiget Code must contain 4 digits after W')
    else
     code
    end
  end
end
