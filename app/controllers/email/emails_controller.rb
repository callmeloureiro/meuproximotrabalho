class Email::EmailsController < ActionController::Base

  def sendcv
    if !params[:file].nil? && !params[:file].blank?
      file = params[:file].tempfile.path
      file_name = params[:file].original_filename
    else
      file = ""
      file_name = ""
    end  
    unless File.extname(file_name) == ".pdf" || File.extname(file_name) == ".doc" || File.extname(file_name) == ".docx"
      render :json => { :errors => "Você deve enviar seu currículo em formato de documento." }, :status => 422
    else
      NotificationMailer.envia_cv(params[:name], params[:email], params[:telphone], params[:obs], params[:subject], params[:sender], file_name, file, params[:jobid]).deliver_now
      render :json => { :success => true }, :status => 200
    end
  end

  def sendmsg
    NotificationMailer.send_msg(params[:name], params[:email], params[:subject], params[:message]).deliver_now
    render :json => { :success => true }, :status => 200
  end

end