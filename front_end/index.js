fetch('http://localhost:3000/bikes')
.then(response => response.json())
.then(bikes => displayBikeData(bikes))

function displayBikeData(bikes){
    bikes.forEach(bike => {
        const bikeContainer = document.querySelector('.bike-container')
        const card = document.createElement('div')
        const h5 = document.createElement('h5')
        const description = document.createElement('p')
        const noImage = document.createElement('p')
        const image = document.createElement('img')
        const zipcode = document.createElement('p')

        card.className = 'bike-card'
        h5.innerHTML = bike.title
        description.innerHTML = bike.description
        
        if (bike.image) {
            image.src = bike.image
        } else {
            noImage.textContent = 'No image available'
        }

        zipcode.innerHTML = `${bike.zipcode.city}, ${bike.zipcode.zipcode}`

        if (bike.image){
            card.append(h5, image, description, zipcode)
        } else {
            card.append(h5, noImage, description, zipcode)
        }
        
        bikeContainer.append(card)
    })
}

fetch('http://localhost:3000/zipcodes')
.then(response => response.json())
.then(zipcodes => selectZipcode(zipcodes))


function selectZipcode(zipcodes){
    const selection = document.querySelector("#zip-code")
    zipcodes.forEach(zipcode => {
        const zipcodeOption = document.createElement("option");
       zipcodeOption.textContent = zipcode.zipcode;
       zipcodeOption.value = zipcode.id;
       
       selection.append(zipcodeOption);
        
    })
}

// function search(){
//     const input = document.getElementById('#searchField')
//     const filter = input.value.toLowerCase()
//     const elements = document.getElementsByTagName('')
// }