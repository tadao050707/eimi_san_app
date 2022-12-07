import('node-fetch').then(({
  default: fetch
}) => {
  fetch('https://api.thedogapi.com/v1/breeds').then(res => {
    res.json().then(dogs => {
      dogs.map( ({ name, image }) => console.log(name, image.url) )

    })
  })
})