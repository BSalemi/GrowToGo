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

// console.log(signUpForm)
// console.log(addUserForm)
// console.log(inputFields)
// console.log(signUpBtn)

signUpBtn.addEventListener('click', () => {
    signedUp = !signedUp
    if (signedUp) {
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
        loggedIn = `${object.id}`
        console.log(loggedIn)
    })
})