const BASE_URL = "http://localhost:3000"
const PLANTS_URL = `${BASE_URL}/plants`
const CART_PLANTS_URL = `${BASE_URL}/cart_plants`
const CARTS_URL = `${BASE_URL}/carts`
const USERS_URL = `${BASE_URL}/users`

let loggedIn = ""
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