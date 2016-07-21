class Rep
  include ApplicationRel

  from_class :Student
  to_class :Exercise
  type :rep

  %w(difficulty usefulness understanding).each do |metric|
    property metric, type: Integer
    validates metric,
      numericality: {
        integer_only: true,
        allow_blank: true,
        allow_nil: true
      }

    define_method metric do
      value = super()
      if value === 0
        nil
      else
        value
      end
    end
  end
end
