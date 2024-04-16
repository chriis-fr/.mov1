import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  Debug.print(debug_show (currentValue));

  
  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));


  let id = 33422;
  // Debug.print(debug_show(id));


  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  // topUp()

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0){
      currentValue -= amount;
    } else { 
      Debug.print("Enter the correct value")
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedSec = timeElapsedNS / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedSec));
    startTime := currentTime;

  }
}
