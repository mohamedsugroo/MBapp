document.addEventListener("turbolinks:load", function() {    

    window.addEventListener('scroll', fixedAdvert);

});


function fixedAdvert (event) {
    const adBox = document.querySelector('#advertisment');
    const fixedAd = adBox.offsetTop;
    const scrollY = window.scrollY;
    const scrollable =  document.querySelector(".newgoals").offsetTop;
    const stopFixedad = scrollable - 300;
    if (scrollY >= 150) {
        // console.log("quota met ")
        adBox.classList.remove('fixedAdvert')
    } 

    if (scrollY >= stopFixedad) {
        // console.log("Stop Fixe advertisment");
        adBox.classList.remove('fixedAdvert')
    } else if (scrollY >= 200){
        adBox.classList.add('fixedAdvert')
    } else if(scrollY < 200){
        adBox.classList.remove('fixedAdvert')

    } else {
        // console.log("the advertisment is back bby")
        adBox.classList.add('fixedAdvert')
    }

    // console.log(fixedAd, scrollY, scrollX, "scrollable: " + scrollable, stopFixedad);    
}
