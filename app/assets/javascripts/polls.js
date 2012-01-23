$(function() {
  $('.answer').change(function() {
    $(':submit').prop('disabled', false);
  });

  var form = $('form');
  var originalUrl = form.attr('action');

  form.submit(function(e) {
    e.preventDefault();

    makeGet();
    //appendImage();
  });

  function onSubmitComplete() {
    form.find('input').prop('disabled',true);

    console.log("Answer has been submitted");
    //alert('Answered!');
  }

  function completeUrl() {
    var question_id = $('#answer_question_id').val();
    var answer = form.find(':checked').val();
    return originalUrl + "?q=" + question_id + "&a=" + answer;
  }

  function appendImage() {
    var img = $('<img src="'+completeUrl()+'"  />');
    img.load(onSubmitComplete);

    form.append(img);
  }

  function makeGet() {
    $.get(completeUrl(), onSubmitComplete);
  }

});
