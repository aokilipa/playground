class Contribution {
  //final int _currentweek;
  var _deposit;
  var _total;
  var _currentweek;
  
  Contribution(this._currentweek,this._deposit,this._total);

  int get currentweek => this._currentweek;
  int get deposit => _deposit;
  int get total => _total;


  
}