fetch('http://localhost:3000/bikes')
.then(response => response.json())
.then(bikes => displayBikeData(bikes))

function displayBikeData(bikes){
    bikes.forEach(bike => {
        // debugger
        const h5 = document.createElement('h5')
        const description = document.createElement('p')
        const image = document.createElement('img')
        const zipcode = document.createElement('p')
        h5.innerHTML = bike.title
        description.innerHTML = bike.description
        image.innerHTML = bike.image
        zipcode.innerHTML = bike.zipcode_id
        document.body.append(h5, description, image, zipcode)
    })
}

function addNewLostBike(bike){

    
}