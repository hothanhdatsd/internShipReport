import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-user"
export default class extends Controller {
  connect() {
    console.log("Connected")
  }
  initialize(){
    this.element.setAttribute('data-action','click->delete-user#showModal')
  }
  showModal(event){
    event.preventDefault();
    this.url = this.element.getAttribute('href')
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbpo-steam.html"
      }
    })
    .then(res => res.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
