class CurriculumMailer < ActionMailer::Base

  def generate_cv(nome, naturalidade, civil, idade, endereco, numero, complemento, bairro, cidade, estado, telefone, email, objetivo, formacao, experiencias, qualificacoes, informacoes)
    @nome = nome
    @naturalidade = naturalidade
    @civil = civil
    @idade = idade
    @endereco = endereco
    @numero = numero
    @complemento = complemento
    @bairro = bairro
    @cidade = cidade
    @estado = estado
    @telefone = telefone
    @email = email
    @objetivo = objetivo
    @formacao = formacao
    @experiencias = experiencias
    @qualificacoes = qualificacoes
    @informacoes = informacoes
    mail(:to       => "falecom@meuproximotrabalho.com.br", 
         :subject  => "#{nome} - Solicitou um currículo",
         :reply_to => "#{email}",
         :from     => '"'+nome+'" <noreply@meuproximotrabalho.com.br>')
  end

end