// Muhammad Alfandavi Aryo Utomo / ITB
// Goers Test Problem Number 3

// Movie Ticket Problem
// last person allowed
// n people, first k get ticket
// last k people get ticket


// 123456789
// 456789
// 456
// then 6

// 12345678910
// 345678910
// 345678
// 5678
// 56
// then 6

function findLastPerson(n, k){
    let arr = Array.from({length: n}, (_, i) => i + 1)
    let indicator = 0;
    // console.log(arr);
    while (arr.length > k){
        if (indicator === 0){
            arr.splice(0,k);
            // console.log(arr);
            indicator = 1;
            // console.log(indicator);
        }else{
            arr.splice(arr.length - k,k);
            // console.log(k)
            // console.log(arr);
            indicator = 0;
            // console.log(indicator);
        }
    }
    console.log(arr[arr.length-1]);
}

// let arr = [1,2,3,4,5,6,7,8,9]
findLastPerson(9,3)
findLastPerson(10,2)
// let arr = [ 4, 5, 6, 7, 8, 9 ]
// arr.splice(3,3)
// console.log(arr)

