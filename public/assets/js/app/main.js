$(document).ready(function() {

  var dataEstado = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('Nome'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: {
      url: "https://raw.githubusercontent.com/felipefdl/cidades-estados-brasil-json/master/Estados.json"
    }
  });

  var dataCidade = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('city'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: {
      url: "http://meuproximotrabalho.com.br/api/v1/jobs?cities_uniq=true"
    }
  });

  dataEstado.initialize();
  dataCidade.initialize();

  $('input[name="c"]').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    displayKey: 'city',
    source: dataCidade.ttAdapter()
  });

  // $('input[name="job[state]"]').typeahead({
  //   hint: true,
  //   highlight: true,
  //   minLength: 1
  // }, {
  //   displayKey: 'Nome',
  //   source: dataEstado.ttAdapter()
  // });

});