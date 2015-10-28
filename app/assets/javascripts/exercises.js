$(document).ready(function(){
  $('#exercise_workout_date').datepicker({ dateFormat: 'yy-mm-dd'});
  new Morris.Line({
  element:    'chart',
     data:    $('#chart').data('workouts'),
    xkey:    'workout_date',
    ykeys:    ['duration_in_min'],
   labels:    ['Duration (min)'],
  xLabels:    "day",
  xLabelAngle:  60,
  xLabelFormat: function (x){
    date_string = x.getFullYear() + "/" + parseInt(x.getMonth() + 1) + "/" + x.getDate();
    return date_string;
  },
  yLabelFormat: function(y) {return y + 'min';}
  });
  });
