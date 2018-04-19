
$(document).ready(function(){

    let emailPrompt = document.querySelector('#email_prompt');
    let closeButton = document.querySelector('.close');

    setTimeout(function() {
        emailPrompt.setAttribute('class', 'rise');
    }, 3000);

    $( ".close" ).on( "click", function( event ) {
        event.preventDefault();
        emailPrompt.setAttribute('class', 'fall');
    });    
});