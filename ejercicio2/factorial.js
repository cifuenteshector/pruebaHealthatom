// import { all,create } from "mathjs";

// const config = {
//     precision:2000
// };

// // Se crea la instancia con la configuracion de precision de numeros significativos
// const mathjs = create(all,config);

// //Se crea una variable que puede almacenar muchos elementos
// const value = mathjs.bignumber(1000);

// //Se calcula el factorial del valor
// const resultado = mathjs.factorial(value);
// //const resultado = (number) => number ? number * factorial(number -1) :1;

// //Se formatea el resultado para obtener todos los digitos 
// const formate = mathjs.format(resultado,{notation:'fixed'});
// console.log(formate);
const getZerosFactorial = (number) =>{
    let zeros = 0,fives = 1;
    while(fives <= number) zeros = Math.floor(zeros+ number/(fives*=5));
        return zeros;
}

console.log(getZerosFactorial(1000));