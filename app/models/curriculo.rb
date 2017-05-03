class Curriculo < ApplicationRecord
  belongs_to :user
    enum status: [ "Aguardando", "Concluído" ]
end
