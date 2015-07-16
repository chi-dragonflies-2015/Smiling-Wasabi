$(document).ready(function(){
  bindVotes();
});

function bindVotes(){
  $(document).on('click', '.upvote', function(event){ vote(event, true) });
  $(document).on('click', '.downvote', function(event){ vote(event, false) });
}

function vote(event, vote){
  event.preventDefault();
  var that = event.target
  var href = $(that).attr('href');
  $.ajax({
    url: href,
    method: 'POST',
    data: { vote: vote },
    dataType: 'json',
  }).done(function(response){
    if (response.status == 'ok'){
      $(that).toggleClass('voted');
      $(that).siblings().removeClass('voted');
      $(that).siblings('.score').text(response.score + '% like this with ' + response.num_votes + ' people voting');
    }
  })
};