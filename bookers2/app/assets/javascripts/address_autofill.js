$(function() {
  return $('#user_postcode'). jpostal({
    postcode: ['#user_postcode'],
    address: {
      '#user_prefecture_code': '%3',
      '#user_city': '%4',
      '#user_street': '%5%6%7',
    },
  });
});