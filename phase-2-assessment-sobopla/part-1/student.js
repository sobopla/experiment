/********************************************************/
/*   It is required to use a for loop                   */
/*   when iterating over a student's array of scores.   */
/********************************************************/
var Student = function (obj) {
  this.firstName = obj.firstName;
  this.scores = obj.scores;
}

Student.prototype.averageScore = function() {
  var total = 0;
  for(var i = 0; i < this.scores.length; i++) {
    total += this.scores[i];
    console.log(total);
  }
  return Math.floor(total / this.scores.length);
}

Student.prototype.letterGrade = function() {
  var average = this.averageScore();
  if (average >= 90) {
    return "A";
  }
  if (average >= 80) {
    return "B";
  }
  if (average >= 70) {
    return "C";
  }
  if (average >= 60) {
    return "D";
  }
  else return "F";
}