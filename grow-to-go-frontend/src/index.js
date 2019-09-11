const BASE_URL = "http://localhost:3000"
const PLANTS_URL = `${BASE_URL}/plants`
const CART_PLANTS_URL = `${BASE_URL}/cart_plants`
const CARTS_URL = `${BASE_URL}/carts`
const USERS_URL = `${BASE_URL}/users`

let loggedIn = null
let signedUp = false 
const emptyCart =  "https://img.icons8.com/ios/50/000000/shopping-cart-loaded.png"
const filledCart = "https://img.icons8.com/ios-filled/50/000000/shopping-cart-loaded.png"

const signUpForm = document.querySelector(".container")
const addUserForm = document.querySelector(".signup-form")
const inputFields = document.querySelectorAll(".input-text")
const signUpBtn = document.querySelector("#signup-btn")
const signUpBtnPhrase = document.querySelector(".sign-up-btn")
const mainContainer = document.querySelector("main")
const cartContainer = document.querySelector(".cart-container")

// console.log(cartContainer)
// console.log(mainContainer)
// console.log(signUpForm)
// console.log(addUserForm)
// console.log(inputFields)
// console.log(signUpBtn)

function hideSignUpBtn(){
    signUpBtn.style.display = 'none',
    signUpBtnPhrase.style.display = 'none',
    signUpForm.style.display = 'none'
}

signUpBtn.addEventListener('click', () => {
    signUpBtn.style.display = 'none',
    signUpBtnPhrase.style.display = 'none',
    signedUp = !signedUp
    if (!signedUp) {
        signUpForm.style.display = "none"
    } else {
        signUpForm.style.display = "block"
    }
})

addUserForm.addEventListener('submit', function(e){
    e.preventDefault()
    fetch(USERS_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            name: inputFields[0].value,
            email: inputFields[1].value,
        })
    })
    .then(res => res.json())
    .then(function(object){
        loggedIn = object
        localStorage.loggedIn = object.id
        hideSignUpBtn()
        renderLoggedInUser(loggedIn)
        }
    )
})

function renderLoggedInUser(loggedIn){
    console.log(loggedIn)
    let div = document.createElement('div')
    let welcome = document.querySelector('#welcome')
    div.innerText = `Welcome ${loggedIn.name}`
    loggedIn.carts[loggedIn.carts.length - 1].id
    welcome.append(div)
    loggedIn.carts[0].plants.forEach(plant => {
        cartContainer.innerHTML += `<p>${plant.name} - $${plant.price}</p>
        <button class="remove" onClick=removeFromCart(event) data-plant-id="${plant.id}"> X </button>`
    })
    cartContainer.innerHTML = `<p> Total Price: $${loggedIn.carts.total}</p>`
    fetchPlants() 
}

function fetchPlants(){
    fetch(PLANTS_URL)
    .then(res => res.json())
    .then(plants => renderPlants(plants))
}

function renderPlants(plants){
    plants.forEach(plant => {
        mainContainer.innerHTML += `<div class="card">
        <img src=${plant.image} class="plant-avatar" />
        <p> ${plant.size} - $${plant.price}<p>
        <h2>${plant.name}</h2>
        <p><em>${plant.species}</em></p> 
        <p><strong>Experience Level:</strong> ${plant.exp_level}</p>
        <p><strong>Light Required:</strong> ${plant.light_required}</p>
        <button onClick=addToCart(event) data-plant-id="${plant.id}"> Add To Cart </button>
        </br>
      </div>`
    })
}

function addToCart(event){
    let id = localStorage.loggedIn
    fetch(USERS_URL + "/" + id)
    .then(res => res.json())
    .then(function(object){
        loggedIn = object
    })
    console.log(loggedIn)
    let cartId = loggedIn.carts[loggedIn.carts.length - 1].id
    let plantCard = event.target.parentElement
    let plantName = plantCard.querySelector('h2').innerText
    console.log(plantName)
    fetch(CART_PLANTS_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            cart_id: `${cartId}`,
            plant_id: `${event.target.dataset.plantId}`,
        }),
    })
    .then(res => res.json())
    .then(res => {
        loggedIn = res
        renderLoggedInUser(loggedIn)
    })
}
        //fetch user again and reset loggedIn user varaible to the updated object
        //write a function that changes the dom to reflect the logged in object
        //cartDiv = document.querySelector .yadayaaaaada
        ///cartDiv.innerHTML = ${loggedIn.carts.first.total}
//     )
//     })
// }
function checkForUser(){
    if(localStorage.loggedIn){
        let id = localStorage.loggedIn
        fetch(USERS_URL + "/" + id)
        .then(res => res.json())
        .then(res => renderLoggedInUser(res))
        hideSignUpBtn();
    }
}

checkForUser()

