void main(){
    // Time take by a to cover 5 clock-minutes
    double x = 2.0;  //
    
    // Time take by b to cover 5 clock-minutes
    double y = 9.0;  //
    
    // Speed of A and B in clock-minute per minute
    double speedA = 5/x;
    double speedB = 5/y;
    
    // relativeSpeed difference science they are walking in different  direction
    double relativeSpeed = speedA - speedB;
    
    //time taken by them to meet
   double timeToMeet = 60 / relativeSpeed;
   
    //meeting point using B's speed
    double meetingPoint = (timeToMeet * speedA)%60;
    
    print('they will meet at ${meetingPoint.toString()} clock-minutes.');
}