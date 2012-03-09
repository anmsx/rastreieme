class TrackingNumber
  include Mongoid::Document

  OPEN     = 'OPEN'
  DELAYED  = 'DELAYED'
  FINISHED = 'FINISHED'

  REMOTE_STATUS = {
    'entregue'            => TrackingNumber::FINISHED,
    'encaminhado'         => TrackingNumber::OPEN,
    'aguardando retirada' => TrackingNumber::FINISHED
  }

  STATUS_NAME = {
    OPEN     => 'Aberto',
    DELAYED  => 'Atrasado',
    FINISHED => 'Finalizado'
  }

  ACRONYM = {
    'AL' => 'AGENTES DE LEITURA
    'AR' => 'AVISO DE RECEBIMENTO
    'CA' => 'OBJETO INTERNACIONAL
    'CC' => 'COLIS POSTAUX
    'CD' => 'OBJETO INTERNACIONAL
    'CE' => 'OBJETO INTERNACIONAL
    'CG' => 'OBJETO INTERNACIONAL
    'CJ' => 'REGISTRADO INTERNACIONAL
    'CK' => 'OBJETO INTERNACIONAL
    'CL' => 'OBJETO INTERNACIONAL
    'CP' => 'COLIS POSTAUX
    'CR' => 'CARTA REGISTRADA SEM VALOR DECLARADO
    'CS' => 'OBJETO INTERNACIONAL
    'CT' => 'OBJETO INTERNACIONAL
    'CV' => 'REGISTRADO INTERNACIONAL
    'CY' => 'OBJETO INTERNACIONAL
    'DA' => 'REM EXPRES COM AR DIGITAL
    'DB' => 'REM EXPRES COM AR DIGITAL BRADESCO
    'DC' => 'REM EXPRESSA CRLV/CRV/CNH e NOTIFICAÇÃO
    'DD' => 'DEVOLUÇÃO DE DOCUMENTOS
    'DE' => 'REMESSA EXPRESSA TALÃO E CARTÃO C/ AR
    'DI' => 'REM EXPRES COM AR DIGITAL ITAU
    'DP' => 'REM EXPRES COM AR DIGITAL PRF
    'DS' => 'REM EXPRES COM AR DIGITAL SANTANDER
    'DT' => 'REMESSA ECON.SEG.TRANSITO C/AR DIGITAL
    'EA' => 'OBJETO INTERNACIONAL
    'EB' => 'OBJETO INTERNACIONAL
    'EC' => 'ENCOMENDA PAC
    'ED' => 'OBJETO INTERNACIONAL
    'EE' => 'SEDEX INTERNACIONAL
    'EF' => 'OBJETO INTERNACIONAL
    'EG' => 'OBJETO INTERNACIONAL
    'EH' => 'ENCOMENDA NORMAL COM AR DIGITAL
    'EI' => 'OBJETO INTERNACIONAL
    'EJ' => 'ENCOMENDA INTERNACIONAL
    'EK' => 'OBJETO INTERNACIONAL
    'EL' => 'OBJETO INTERNACIONAL
    'EM' => 'OBJETO INTERNACIONAL
    'EN' => 'ENCOMENDA NORMAL NACIONAL
    'EP' => 'OBJETO INTERNACIONAL
    'EQ' => 'ENCOMENDA SERVIÇO NÃO EXPRESSA ECT
    'ER' => 'REGISTRADO
    'ES' => 'e-SEDEX
    'EF' => 'OBJETO INTERNACIONAL
    'EG' => 'OBJETO INTERNACIONAL
    'EF' => 'OBJETO INTERNACIONAL
    'EU' => 'OBJETO INTERNACIONAL
    'EV' => 'OBJETO INTERNACIONAL
    'EX' => 'OBJETO INTERNACIONAL
    'FE' => 'ENCOMENDA FNDE
    'FF' => 'REGISTRADO DETRAN
    'FH' => 'REGISTRADO FAC COM AR DIGITAL
    'FM' => 'REGISTRADO - FAC MONITORADO
    'FR' => 'REGISTRADO FAC
    'IA' => 'INTEGRADA AVULSA
    'IC' => 'INTEGRADA A COBRAR
    'ID' => 'INTEGRADA DEVOLUCAO DE DOCUMENTO
    'IE' => 'INTEGRADA ESPECIAL
    'IF' => 'CPF
    'II' => 'INTEGRADA INTERNO
    'IK' => 'INTEGRADA COM COLETA SIMULTANEA
    'IM' => 'INTEGRADA MEDICAMENTOS
    'IN' => 'OBJ DE CORRESP E EMS REC EXTERIOR
    'IP' => 'INTEGRADA PROGRAMADA
    'IR' => 'IMPRESSO REGISTRADO
    'IS' => 'INTEGRADA STANDARD
    'IT' => 'INTEGRADO TERMOLÁBIL
    'IU' => 'INTEGRADA URGENTE
    'JA' => 'REMESSA ECONOMICA C/AR DIGITAL
    'JB' => 'REMESSA ECONOMICA C/AR DIGITAL
    'JC' => 'REMESSA ECONOMICA C/AR DIGITAL
    'JJ' => 'REGISTRADO JUSTIÇA
    'LC' => 'CARTA EXPRESSA
    'LE' => 'LOGÍSTICA REVERSA ECONOMICA
    'LF' => 'OBJETO INTERNACIONAL
    'LI' => 'OBJETO INTERNACIONAL
    'LJ' => 'OBJETO INTERNACIONAL
    'LM' => 'OBJETO INTERNACIONAL
    'LS' => 'LOGISTICA REVERSA SEDEX
    'LV' => 'LOGISTICA REVERSA EXPRESSA
    'LX' => 'CARTA EXPRESSA
    'LY' => 'CARTA EXPRESSA
    'MA' => 'SERVIÇOS ADICIONAIS
    'MB' => 'TELEGRAMA DE BALCÃO
    'MC' => 'MALOTE CORPORATIVO
    'MD' => 'SEDEX MUNDI - DOCUMENTO INTERNO
    'ME' => 'TELEGRAMA
    'MF' => 'TELEGRAMA FONADO
    'MK' => 'TELEGRAMA CORPORATIVO
    'MM' => 'TELEGRAMA GRANDES CLIENTES
    'MP' => 'TELEGRAMA PRÉ-PAGO
    'MS' => 'ENCOMENDA SAUDE
    'MT' => 'TELEGRAMA VIA TELEMAIL
    'MY' => 'TELEGRAMA INTERNACIONAL ENTRANTE
    'MZ' => 'TELEGRAMA VIA CORREIOS ON LINE
    'NE' => 'TELE SENA RESGATADA
    'PA' => 'PASSAPORTE
    'PB' => 'ENCOMENDA PAC - NÃO URGENTE
    'PR' => 'REEMBOLSO POSTAL - CLIENTE AVULSO
    'RA' => 'REGISTRADO PRIORITÁRIO
    'RB' => 'CARTA REGISTRADA
    'RC' => 'CARTA REGISTRADA COM VALOR DECLARADO
    'RD' => 'REMESSA ECONOMICA DETRAN
    'RE' => 'REGISTRADO ECONÔMICO
    'RF' => 'OBJETO DA RECEITA FEDERAL
    'RG' => 'REGISTRADO DO SISTEMA SARA
    'RH' => 'REGISTRADO COM AR DIGITAL
    'RI' => 'REGISTRADO
    'RJ' => 'REGISTRADO AGÊNCIA
    'RK' => 'REGISTRADO AGÊNCIA
    'RL' => 'REGISTRADO LÓGICO
    'RM' => 'REGISTRADO AGÊNCIA
    'RN' => 'REGISTRADO AGÊNCIA
    'RO' => 'REGISTRADO AGÊNCIA
    'RP' => 'REEMBOLSO POSTAL - CLIENTE INSCRITO
    'RQ' => 'REGISTRADO AGÊNCIA
    'RR' => 'CARTA REGISTRADA SEM VALOR DECLARADO
    'RS' => 'REGISTRADO LÓGICO
    'RT' => 'REM ECON TALAO/CARTAO SEM AR DIGITA
    'RU' => 'REGISTRADO SERVIÇO ECT
    'RV' => 'REM ECON CRLV/CRV/CNH COM AR DIGITAL
    'RW' => 'OBJETO INTERNACIONAL
    'RX' => 'OBJETO INTERNACIONAL
    'RY' => 'REM ECON TALAO/CARTAO COM AR DIGITAL
    'RZ' => 'REGISTRADO
    'SA' => 'SEDEX ANOREG
    'SC' => 'SEDEX A COBRAR
    'SD' => 'REMESSA EXPRESSA DETRAN
    'SE' => 'ENCOMENDA SEDEX
    'SF' => 'SEDEX AGÊNCIA
    'SG' => 'SEDEX DO SISTEMA SARA
    'RH' => 'REGISTRADO COM AR DIGITAL
    'SI' => 'SEDEX AGÊNCIA
    'SJ' => 'SEDEX HOJE
    'SK' => 'SEDEX AGÊNCIA
    'SL' => 'SEDEX LÓGICO
    'SM' => 'SEDEX MESMO DIA
    'SN' => 'SEDEX COM VALOR DECLARADO
    'SO' => 'SEDEX AGÊNCIA
    'SP' => 'SEDEX PRÉ-FRANQUEADO
    'SQ' => 'SEDEX
    'SR' => 'SEDEX
    'SS' => 'SEDEX FÍSICO
    'ST' => 'REM EXPRES TALAO/CARTAO SEM AR DIGITAL
    'SU' => 'ENCOMENDA SERVIÇO EXPRESSA ECT
    'SV' => 'REM EXPRES CRLV/CRV/CNH COM AR DIGITAL
    'SW' => 'e-SEDEX
    'SX' => 'SEDEX 10
    'SY' => 'REM EXPRES TALAO/CARTAO COM AR DIGITAL
    'SZ' => 'SEDEX AGÊNCIA
    'TE' => 'TESTE (OBJETO PARA TREINAMENTO)
    'TS' => 'TESTE (OBJETO PARA TREINAMENTO)
    'VA' => 'ENCOMENDAS COM VALOR DECLARADO
    'VC' => 'ENCOMENDAS
    'VD' => 'ENCOMENDAS COM VALOR DECLARADO
    'VE' => 'ENCOMENDAS
    'VF' => 'ENCOMENDAS COM VALOR DECLARADO
    'VV' => 'OBJETO INTERNACIONAL
    'XM' => 'SEDEX MUNDI
    'XR' => 'ENCOMENDA SUR POSTAL EXPRESSO
    'XX' => 'ENCOMENDA SUR POSTAL 24 HORAS
  }

  field :number,            :type => String, :null => false
  field :description,       :type => String
  field :shipping_price,    :type => BigDecimal
  field :destination,       :type => String
  field :status,            :type => String
  field :status_updated_at, :type => Time, :default => Time.now
  field :created_at,        :type => Time, :default => Time.now

  field :post_date, :type => Time
  

  referenced_in :user

  validates_uniqueness_of :number, :message => 'Pacote já cadastrado'
  validates_format_of :number, :with => /\A[a-zA-Z]{2}[0-9]{9}[a-zA-Z]{2}$/i, :allow_blank => false, :message => "Número inválido"
  validates_format_of :destination, :with => /\A\d{5}\-\d{3}$/, :allow_blank => true, :message => "CEP inválido"
  validate :shipping_price, :numericality => true, :greater_than => 0
  validates_inclusion_of :status, :in => [OPEN, DELAYED, FINISHED]

  def status_name
    STATUS_NAME[self.status]
  end

  def shipping_date
  end

  def TrackingNumber.from_user(user, status)
    TrackingNumber.where({:user_id => user.id, :status => status})
  end

  def TrackingNumber.get_opens
    TrackingNumber.where({:status => TrackingNumber::OPEN})
  end

  def update_remote_status(status)
    raise 'Invalid argument!' if !status.respond_to?('situacao')
    n_status = REMOTE_STATUS[status.situacao.downcase]
    raise 'Invalid status' if n_status.nil?
    write_attribute :status, n_status
    write_attribute :status_update_at, Time.now
    save
  end

  def update_post_date(status)
    raise 'Invalid argument!' if !status.respond_to?('data')
    write_attribute :post_date, status.data.to_time if post_date.nil?
  end

  def is_not_from_user(user)
    user_id != user.id
  end

  def delayed?
    status == TrackingNumber::DELAYED
  end

  def set_delayed_if_delayed
    if post_date < 3.business_days.ago && status == TrackingNumber::OPEN
      write_attribute :status, TrackingNumber::DELAYED
      save
    end
  end

end
