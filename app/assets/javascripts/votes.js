$(document).ready(function(){
  bindVotes();
});

function bindVotes(){
  $('.upvote').on('click', function(event){ vote(event, true) });
  $('.downvote').on('click', function(event){ vote(event, false) });
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
    statusCode:{
      200: function(response){
          $(that).toggleClass('voted');
          $(that).siblings().removeClass('voted');
          $(that).siblings('.score').text(response.score + '% with ' + response.num_votes + ' people voting');
        }
    }
  });
};