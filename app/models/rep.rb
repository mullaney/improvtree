class Rep
  include ApplicationNode

  has_one :in, :enrollment,
    model_class: :Enrollment,
    type: :rep

  has_one :out, :exercise,
    model_class: :Exercise,
    type: :exercise

  has_many :in, :comments, origin: :comment_on

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
