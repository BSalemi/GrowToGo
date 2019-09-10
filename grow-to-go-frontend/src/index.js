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
const signUpBtn = document.querySelector("#signup-btn")
const signUpBtnPhrase = document.querySelector(".sign-up-btn")
const mainContainer = document.querySelector("main")

console.log(mainContainer)

// console.log(signUpForm)
// console.log(addUserForm)
// console.log(inputFields)
// console.log(signUpBtn)

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
        console.log(object, "object")
        loggedIn = `${object.id}`
        if(loggedIn){
            let div = document.createElement('div')
            let welcome = document.querySelector('#welcome')
            div.innerText = `Welcome ${object.name}`
            welcome.append(div)
            signUpBtn.style.display = 'none'
            signUpBtnPhrase.style.display = 'none'
            signUpForm.style.display = 'none'
            fetchPlants()   
        }
    })
})

function fetchPlants(){
    fetch(PLANTS_URL)
    .then(res => res.json())
    .then(console.log)
}

function renderPlants(plants){
    plants.forEach(plant => {

    })
}

// function checkForUser(){
//     if(localStorage.loggedInUser){
//         fetchPlants()
//     }
// }
