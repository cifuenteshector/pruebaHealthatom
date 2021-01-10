const { random} = require("mathjs");

const etiquetadora = (N) => {
    let A= random(1,N).toString(),B = (N-A).toString(),index=1;
    const arr = [];
    while(FindFour(A) || FindFour(B))
        {
            A= N/(4*index);
            B= N-A;
            index++;
        }
    arr.push(A);
    arr.push(B); 
    return arr;
}


function GenerateRandomN(){
    const number = random(1,10**100).toString();
    while(FindFour(number)) return Math.round(number);
}


function FindFour(number){
    if(typeof(number) != 'string') number = number.toString();
    while(number.includes(4))
    {
        return true;
    }
}
const N = GenerateRandomN();
console.log(etiquetadora(N));