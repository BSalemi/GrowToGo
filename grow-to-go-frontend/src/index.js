const BASE_URL = "http://localhost:3000"
const PLANTS_URL = `${BASE_URL}/plants`
const CART_PLANTS_URL = `${BASE_URL}/cart_plants`
const CARTS_URL = `${BASE_URL}/carts`
const USERS_URL = `${BASE_URL}/users`

let loggedIn = null
let signedUp = false 


const signUpForm = document.querySelector(".container")
const addUserForm = document.querySelector(".signup-form")
const inputFields = document.querySelectorAll(".input-text")
// const signUpBtn = document.querySelector("#signup-btn")
const signUpBtnPhrase = document.querySelector(".sign-up-btn")
const mainContainer = document.querySelector("main")
const cartContainer = document.querySelector(".cart-container")
const cartBtn = document.querySelector(".cart-button")
const logoutBtn = document.querySelector(".logout-btn")
const sortOptions = document.querySelector('.sort-menus')


// console.log(cartBtn)
// console.log(cartContainer)
// console.log(mainContainer)
// console.log(signUpForm)
// console.log(addUserForm)
// console.log(inputFields)
// console.log(signUpBtn)

function hideSignUpBtn(){
    // signUpBtn.style.display = 'none',
    signUpBtnPhrase.style.display = 'none',
    signUpForm.style.display = 'none'
}

// signUpBtn.addEventListener('click', () => {
//     signUpBtn.style.display = 'none',
//     signUpBtnPhrase.style.display = 'none',
//     signedUp = !signedUp
//     if (!signedUp) {
//         signUpForm.style.display = "none"
//     } else {
//         signUpForm.style.display = "block"
//     }
// })

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
        renderLoggedInUser()
        }
    )
})

cartBtn.addEventListener('mouseover', () =>{
    cartContainer.style.display = "block"
})

cartBtn.addEventListener('mouseout', () => {
    cartContainer.style.display = "none"
    
})

logoutBtn.addEventListener('click', () => {
    localStorage.clear(loggedIn)
    window.location.reload()
})


sortOptions.addEventListener('change', function(e){
    console.log(e.target.value)
    fetch(BASE_URL + `/${e.target.value}`)
    .then(res => res.json())
    .then(plants => renderPlants(plants))
})


function renderLoggedInUser(){
    let welcome = document.querySelector('#welcome')
    welcome.innertText = " "
    welcome.innerText = `Welcome ${loggedIn.name}!`
    cartContainer.innerHTML = " "
    loggedIn.carts[loggedIn.carts.length - 1].cart_plants.forEach(cart_plant => {
        cartContainer.innerHTML += `<div id="cartplant-${cart_plant.id}"><p> <button class="remove" onClick=removeFromCart(event) data-cart-plant-id="${cart_plant.id}"><img src="http://icons.iconarchive.com/icons/icons8/windows-8/16/Editing-Delete-icon.png"> </button>
        <strong>${cart_plant.plant.name}</strong> - $${cart_plant.plant.price}
       </p></div>`
    })
    cartContainer.innerHTML += `<p> <strong>Total Price:</strong> $${loggedIn.carts[loggedIn.carts.length - 1].total}
    <button class="checkout" onClick=checkout(event) data-cart-id="${loggedIn.carts[loggedIn.carts.length - 1].id}"> Checkout </button></p>`
    fetchPlants() 
}

function checkout(event){
    if(loggedIn.carts[loggedIn.carts.length - 1].total > 0){
    let cartId = event.target.dataset.cartId
    // console.log(cartId)
    fetch(BASE_URL + "/checkout", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            id: cartId
        })
    })
    .then(res => res.json())
    .then(res => {
        console.log(res, "response")
        loggedIn = res
        renderLoggedInUser()
    })
}} 

function fetchPlants(){
    fetch(PLANTS_URL)
    .then(res => res.json())
    .then(plants => renderPlants(plants))
}

function renderPlants(plants){
    mainContainer.innerHTML = ""
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
   
    let cartId = loggedIn.carts[loggedIn.carts.length - 1].id
    let plantCard = event.target.parentElement
    let plantName = plantCard.querySelector('h2').innerText
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
        renderLoggedInUser()
    })
}
    
function removeFromCart(event){
    let cartPlant = event.target.dataset.cartPlantId
    fetch(CART_PLANTS_URL + "/" + cartPlant, {
        method: "DELETE",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            id: cartPlant,
        }),
    })
    .then(res => res.json())
    .then(res => {
        loggedIn = res
        console.log(loggedIn,"after remove")
        renderLoggedInUser()
    })
}


function checkForUser(){
    console.log(localStorage.loggedIn)
    if(localStorage.loggedIn){
        let id = localStorage.loggedIn
        fetch(USERS_URL + "/" + id)
        .then(res => res.json())
        .then(function(res){
            loggedIn = res 
            console.log(loggedIn, "loggedIn")
            renderLoggedInUser()
        })
        hideSignUpBtn();
    } else {
        signUpBtn.style.display = "block"
    }
}

checkForUser()

