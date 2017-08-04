/************************************************************/
/*   It is required to use Array.prototype methods          */
/*   when iterating over a classroom's array of students.   */
/************************************************************/
var Classroom = function (obj) {
  this.students = obj;
}
//look at the students array
//check each student if it has the name passed in
//use *find* method? why is the js also 'find'????????
Classroom.prototype.find = function(name) {
  return this.students.find(function(something){
    return something.firstName === name;
  });
} 
// *filter* students out that match an average score of 95 or higher
Classroom.prototype.honorRollStudents = function() {
	var myMatcher = function(something) { 
    // have to return all the somethings that match first:
  return something.averageScore() >= 95 };
  //filter the students previously returned with the score
	return this.students.filter(myMatcher);
  //can't this be done with a smaller step???
}


