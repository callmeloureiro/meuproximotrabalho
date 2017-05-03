PagSeguro.configure do |config|
  config.token       = "SEUTOKEN"
  config.email       = "matheusloureirop@gmail.com"
  config.environment = :production # ou :sandbox. O padrão é production.
  config.encoding    = "UTF-8" # ou ISO-8859-1. O padrão é UTF-8.
end

# PagSeguro.configure do |config|
#   config.token       = "SEUTOKEN"
#   config.email       = "matheusloureirop@gmail.com"
#   config.environment = :sandbox # ou :sandbox. O padrão é production.
#   config.encoding    = "UTF-8" # ou ISO-8859-1. O padrão é UTF-8.
# end