// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./DonateInterface.sol";

contract Donate is DonateInterface {
    /*
    * التبرع
    * المتبرعين
    * الحصول علي عنوان متبرع معين
    */

    uint public donateerId; //دده عشان اسجل فيه الاي دي بتاع  المتبرع
    mapping(uint=>address) private donateers; // عشان احفظ فيها المتبرعين
    mapping(address=>bool) private saveDonateer; // عشان لو المتبرع ده دفع تبقا ب ترو عشان استخدمها لو هيدفع مره تانيه محفظهوش تاني

    // ميثود التبرع
    function addFunds() override external payable{
        //1- اجيب الهاش بتاع المتبرع
        //2- اتأكد ان هو مش في قائمه المتبرعين
        //3- اضيفه في قائمه المتبرعين

        //1
        address donateer = msg.sender;

        //2
        if(!saveDonateer[donateer]){
            //3
            donateerId++;
            donateers[donateerId] = donateer;
            saveDonateer[donateer] = true;
        }
    }
}
