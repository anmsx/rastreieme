class TrackingNumber
  include Mongoid::Document

  OPEN     = 'OPEN'
  DELAYED  = 'DELAYED'
  FINISHED = 'FINISHED'

  STATUS_NAME = {
    OPEN     => 'Aberto',
    DELAYED  => 'Atrasado',
    FINISHED => 'Finalizado'
  }

  field :number, :type => String, :null => false
  field :shipping_price,    :type => BigDecimal
  field :destination,       :type => String
  field :status,            :type => String
  field :status_updated_at, :type => Time, :default => Time.now
  field :created_at,        :type => Time, :default => Time.now

  referenced_in :user

  validates_uniqueness_of :number, :message => 'Pacote já cadastrado'
  validates_format_of :number, :with => /\A[a-zA-Z]{2}[0-9]{9}[a-zA-Z]{2}$/i, :allow_blank => false, :message => "Número inválido"
  validates_format_of :destination, :with => /\A\d{5}\-\d{3}$/, :allow_blank => true, :message => "CEP inválido"
  validate :shipping_price, :numericality => true, :greater_than => 0
  validates_inclusion_of :status, :in => [OPEN, DELAYED, FINISHED]

end
