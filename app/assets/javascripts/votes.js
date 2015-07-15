$(document).ready(function(){
  bindVotes();
});

function bindVotes(){
  $('.upvote').on('click', function(){ vote(event, true).bind(this) });
  $('.downvote').on('click', function(){ vote(event, false).bind(this) });
}

function vote(event, vote){
  event.preventDefault();
  var that = this
  var href = this.attr('href');
  $.ajax({
    url: href,
    method: post,
    data: { vote: vote },
    dataType: json
  }).done(function(response){
    that.toggleClass('voted')
    $(that).siblings().removeClass('voted')
    $(that).siblings('score').val(response)
  });
}