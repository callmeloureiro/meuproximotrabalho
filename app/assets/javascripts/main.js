function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

$(document).ready(function() {

  $('#job_zipcode').blur(function () {
    $.ajax({
      url: "http://viacep.com.br/ws/" + $(this).val() + "/json/",
      type: "get",
      beforeSend: function(data) {
        $('#job_address').prop('disabled', true);
        $('#job_city').prop('disabled', true);
        $('#job_state').prop('disabled', true);
        $('#job_district').prop('disabled', true);
      },
      complete: function(data) {
        $('#job_address').prop('disabled', false);
        $('#job_city').prop('disabled', false);
        $('#job_state').prop('disabled', false);
        $('#job_district').prop('disabled', false);
      },
      success: function(data) {
        $('#job_address').val(data.logradouro);
        $('#job_city').val(data.localidade);
        $('#job_state').val(data.uf);
        $('#job_district').val(data.bairro);
        console.log("FOI!");
      }
    });
  });

  $('#user_zipcode').blur(function () {
    $.ajax({
      url: "http://viacep.com.br/ws/" + $(this).val() + "/json/",
      type: "get",
      beforeSend: function(data) {
        $('#user_address').prop('disabled', true);
        $('#user_city').prop('disabled', true);
        $('#user_state').prop('disabled', true);
        $('#user_district').prop('disabled', true);
      },
      complete: function(data) {
        $('#user_address').prop('disabled', false);
        $('#user_city').prop('disabled', false);
        $('#user_state').prop('disabled', false);
        $('#user_district').prop('disabled', false);
      },
      success: function(data) {
        $('#user_address').val(data.logradouro);
        $('#user_city').val(data.localidade);
        $('#user_state').val(data.uf);
        $('#user_district').val(data.bairro);
        console.log("FOI!");
      }
    });
  });

  $('#formsendcv').submit(function(event) {
    event.preventDefault();
    var formData = new FormData($(this)[0]);
    $.ajax({
      type: 'POST',
      url:  $(this).attr('action'),
      data: formData,
      dataType: 'JSON',
      processData: false,
      contentType: false,
      beforeSend: function() {
        $('button#enviar').hide();
        $('button#status').show();
      },
      complete: function(data, request) {
        $('button#enviar').show();
        $('button#status').hide();
      },
      success: function(data) {
        $('input[type="text"],input[type="file"],textarea').val(''); 
        swal("Pronto!", "Agora é só aguardar, espero que dê tudo certo!", "success")  
        $('#modalsendemail').modal('toggle');
      },
      error: function(data) {
        swal("Opa!", data.responseJSON.errors, "error");
      }
    });
  })

  $('#formsendmsg').submit(function(event) {
    event.preventDefault();
    var formData = new FormData($(this)[0]);
    $.ajax({
      type: 'POST',
      url:  $(this).attr('action'),
      data: formData,
      dataType: 'JSON',
      processData: false,
      contentType: false,
      beforeSend: function() {
        $('button#enviar').hide();
        $('button#status').show();
      },
      complete: function(data, request) {
        $('button#enviar').show();
        $('button#status').hide();
      },
      success: function(data) {
        $('input[type="text"],input[type="file"],textarea').val(''); 
        swal("Pronto!", "Você enviou sua mensagem com sucesso!", "success")  
        $('#modalmsg').modal('toggle');
      },
      error: function(data) {
        swal("Opa!", data.responseJSON.errors, "error");
      }
    });
  })

  $('.btnpagseguro').click(function(event) {
    event.preventDefault();
    $.ajax({
      type: 'GET',
      url: $(this).attr('href'),
      beforeSend: function() {
        $('#preloader').show()
      },
      complete: function(data) {
        $('#preloader').hide()
        // $('.linkpagseguro').attr('href', data.responseJSON)
        // console.log(getParameterByName('code', data.responseJSON))
        // window.location.href = data.responseJSON
        checkoutCode = getParameterByName('code', data.responseJSON);
        isOpenLightbox = PagSeguroLightbox({
          code: checkoutCode
        },{
          success : function(transactionCode) {
            // alert("success - " + transactionCode);
            window.location.href = "http://meuproximotrabalho.com.br/painel/u/?pagseguro_retorno=true"
          },
          abort : function() {
            $.ajax({
              type: 'GET',
              url: "http://" + location.host + '/painel/u/premium/order_abandoned'
            })
            console.log("GET disparado: " + "http://" + location.host + '/painel/u/premium/order_abandoned')
          }
        });
        if (!isOpenLightbox){
          location.href = "https://pagseguro.uol.com.br/v2/checkout/payment.html?code="+checkoutCode;
        }
      }
    })
    return false;
  })

});

// $(window).load(function() {
//   $('#sendcvbtn').show()
//   $('#loading').hide()
// })
