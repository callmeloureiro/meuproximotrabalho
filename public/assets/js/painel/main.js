$(document).ready(function() {

  $("#user_date_of_birth").mask("99/99/9999");
  $("#user_zipcode").mask("99999-999");

  $('.dropify').dropify({
    messages: {
      'default': 'Arraste para cá ou clique para adicionar',
      'replace': 'Arraste para cá ou clique para substituir',
      'remove' : 'Remover',
      'error'  : 'Opa, aconteceu um erro :/.'
    }
  });

});