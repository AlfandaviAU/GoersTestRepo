// Muhammad Alfandavi Aryo Utomo / ITB
// Goers Test Problem Number 1

let data = [
    {
        "nama": "Indomie",
        "harga": 3000,
        "rating": 5,
        "likes": 150,
    },
    {
        "nama": "Laptop",
        "harga": 4000000,
        "rating": 4.5,
        "likes": 123,
    },
    {
        "nama": "Aqua",
        "harga": 3000,
        "rating": 4,
        "likes": 250,
    },
    {
        "nama": "Smart TV",
        "harga": 4000000,
        "rating": 4.5,
        "likes": 42,
    },
    {
        "nama": "Headphone",
        "harga": 4000000,
        "rating": 3.5,
        "likes": 90,
    },
    {
        "nama": "Very Smart TV",
        "harga": 4000000,
        "rating": 3.5,
        "likes": 87,
    },
    {
        "nama": "Dummy1",
        "harga": 4000000,
        "rating": 3.5,
        "likes": 88,
    },
    {
        "nama": "Dummy2",
        "harga": 4000000,
        "rating": 5.5,
        "likes": 88,
    },
    {
        "nama": "Dummy3",
        "harga": 3000,
        "rating": 5.5,
        "likes": 68,
    },
    {
        "nama": "Dummy3",
        "harga": 3000,
        "rating": 5.5,
        "likes": 78,
    },
]

// Showing Data
// console.table(data)

// Answer Problem 1

data = data.sort((a,b) => {
    if (a.harga == b.harga){
        if (a.rating == b.rating){
            if (a.likes == b.likes){
                return 1;
            }else{
                return a.likes > b.likes? -1:1;
            }
        }else{
            return a.rating > b.rating? -1:1;
        }
    }else{
        return a.harga > b.harga? -1:1;
    }
    
});

console.table(data)
