# typed: strict

class WidgetCode
  extend T::Sig

  sig {params(code: String).returns(T::Array[String])}
  def self.errors_bag(code)
    errors_bag = []
    errors_bag << 'Wiget Code must have 5 characters' if code.size != 5
    errors_bag << 'Wiget Code must begin with W' if code.slice(0) != 'W'
    errors_bag << 'Wiget Code must contain 4 digits after W' if !code.slice(1, 4).to_s.match?(/[0-9]{4}/)
    errors_bag
  end
end

class GizmoCode
  extend T::Sig

  sig {params(code: String).returns(T::Array[String])}
  def self.errors_bag(code)
    errors_bag = []
    errors_bag << 'Gizmo Code must have 4 characters' if code.size != 4
    errors_bag << 'Gizmo Code must begin with G' if code.slice(0) != 'G'
    errors_bag << 'Gizmo Code must contain 3 digits after G' if !code.slice(1, 3).to_s.match?(/[0-9]{3}/)
    errors_bag
  end
end

class ProductCode < T::Struct
  extend T::Sig

  prop :code, String

  sig {returns(String)}
  def validate
    if is_valid?
      code
    else
      raise StandardError.new("#{WidgetCode.errors_bag(code).first} or #{WidgetCode.errors_bag(code).first}")
    end
  end

  sig {returns(T::Boolean)}
  def is_widget?
    WidgetCode.errors_bag(code).empty?
  end

  sig {returns(T::Boolean)}
  def is_gizmo?
    GizmoCode.errors_bag(code).empty?
  end

  sig {returns(T::Boolean)}
  def is_valid?
    is_widget? || is_gizmo?
  end
end
