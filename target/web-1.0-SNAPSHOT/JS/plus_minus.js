function plus(){
    let number = document.getElementById("numbera").innerHTML
    if (document.getElementById("plus")){
        number ++;
        document.getElementById("numbera").innerHTML = number
    }

}
function minus(){
    let number = document.getElementById("numbera").innerHTML
    if (document.getElementById("minus")){
        number --;
        document.getElementById("numbera").innerHTML = number
        if(number < 0){
            document.getElementById("numbera").innerHTML = 0;
        }
    }

}