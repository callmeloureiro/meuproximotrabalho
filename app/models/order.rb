class Order < ApplicationRecord
  belongs_to :user
  enum order_status: [ "null", "Aguardando pagamento", "Em análise", "Paga", "Concluído", "Em disputa", "Devolvida", "Cancelada", "Chargeback debitado", "Em contestação" ]
end
