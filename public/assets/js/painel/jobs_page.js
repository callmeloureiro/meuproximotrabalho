$(document).ready(function() {

  $('.note-editor').summernote({
    height: 300,
  });

  $('.dropify').dropify({
    messages: {
      'default': 'Arraste para cá ou clique para adicionar',
      'replace': 'Arraste para cá ou clique para substituir',
      'remove' : 'Remover',
      'error'  : 'Opa, aconteceu um erro :/.'
    }
  });

  $('.tt-input').addClass('form-control input-lg');

  $("#job_price").maskMoney({thousands:'', decimal:',', allowZero:true});

});