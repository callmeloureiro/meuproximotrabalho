class NotificationMailer < ActionMailer::Base

  def envia_cv(nome, email, telefone, obs, titulo, sender, file_name, file, jobid)
    @nome = nome
    @email = email
    @telefone = telefone
    @sender = sender
    @obs = obs
    @title = titulo
    @job = Job.find(jobid)
    if file != ""
      attachments[file_name] = File.read(file)
    end
    mail(:to       => "#{sender}", 
         :subject  => "#{titulo} - #{nome} por MeuPróximoTrabalho",
         :reply_to => "#{email}",
         :from     => '"'+nome+'" <vagas@meuproximotrabalho.com.br>')
  end

  def candidata_perfil(user, job)
    @user = user
    @job = job
    mail(:to       => @job.user.email, 
         :subject  => "#{@user.name} se candidatou a sua vaga de #{@job.title} por MeuPróximoTrabalho",
         :reply_to => @user.email,
         :from     => '"Equipe MeuPróximoTrabalho" <vagas@meuproximotrabalho.com.br>')
  end

  def user_candidata(user, job)
    @user = user
    @job = job
    mail(:to       => @user.email, 
         :subject  => "#{@user.name} você se candidatou a vaga de #{@job.title} por MeuPróximoTrabalho",
         :reply_to => @job.user.email,
         :from     => '"Equipe MeuPróximoTrabalho" <vagas@meuproximotrabalho.com.br>')
  end

  def confirm_job(job)
    @job = job
    mail(:to       => @job.email, 
         :subject  => "Gostaríamos de confirmar a vaga - #{job.title} por MeuPróximoTrabalho",
         :from     => '"Equipe MeuPróximoTrabalho" <confirmacao@meuproximotrabalho.com.br>')
  end

  def send_msg(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message
    mail(:to       => "falecom@meuproximotrabalho.com.br", 
         :subject  => "#{@name} enviou uma mensagem!",
         :reply_to => @email,
         :from     => '"Equipe MeuPróximoTrabalho" <falecom@meuproximotrabalho.com.br>')
  end

  def pagamento_aprovado(user, order)
    @user = User.find(user)
    @order = Order.find(order)
    mail(:to       => @user.email,
         :subject  => "Pedido ##{order.id} teve seu pagamento aprovado! Vamos começar? por MeuPróximoTrabalho",
         :from     => '"Equipe MeuPróximoTrabalho" <falecom@meuproximotrabalho.com.br>')
  end

  def pedido_feito(user, order)
    @user = User.find(user)
    mail(:to       => @user.email,
         :subject  => "Pedido ##{order.id} foi recebido com sucesso! por MeuPróximoTrabalho",
         :from     => '"Equipe MeuPróximoTrabalho" <falecom@meuproximotrabalho.com.br>')
  end

  def pedido_abandonado(user)
    @user = User.find(user)
    mail(:to       => @user.email,
         :subject  => "#{user.name}, posso te ajudar?! por MeuPróximoTrabalho",
         :from     => '"Equipe MeuPróximoTrabalho" <falecom@meuproximotrabalho.com.br>')
  end

  def newsletter(user, jobs)
    ActionMailer::Base.smtp_settings = {
      :address        => 'smtp.sparkpostmail.com',
      :port           => '587',
      :authentication => :plain,
      :user_name      => "SMTP_Injection",
      :password       => "7a564b95f52c902b7f67c5d4b2bd1b55426c4dd7",
      :domain         => 'www.meuproximotrabalho.com.br',
      :enable_starttls_auto => true
    }
    
    @user = User.find(user)
    @jobs = jobs.order('posted_at DESC')
    
    mail(:to       => @user.email,
         :subject  => "#{user.name}, trago algumas vagas de emprego para você! #{Time.zone.now.day}/#{Time.zone.now.month}/#{Time.zone.now.year} por MeuPróximoTrabalho",
         :from     => '"Equipe MeuPróximoTrabalho" <vagas@meuproximotrabalho.com.br>')
  end

  def vaga_fechada(job)
    ActionMailer::Base.smtp_settings = {
      :address        => 'smtp.sparkpostmail.com',
      :port           => '587',
      :authentication => :plain,
      :user_name      => "SMTP_Injection",
      :password       => "7a564b95f52c902b7f67c5d4b2bd1b55426c4dd7",
      :domain         => 'www.meuproximotrabalho.com.br',
      :enable_starttls_auto => true
    }
    
    @job = Job.find(job)
    
    mail(:to       => @job.email,
         :subject  => "A vaga #{@job.title} já foi preenchida? por MeuPróximoTrabalho",
         :from     => '"Equipe MeuPróximoTrabalho" <vagas@meuproximotrabalho.com.br>')
  end

end
