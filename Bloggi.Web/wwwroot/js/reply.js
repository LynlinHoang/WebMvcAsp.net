document.addEventListener('DOMContentLoaded', function () {
 
    const replyLinks = document.querySelectorAll('.submit');
    const replyForms = document.querySelectorAll('.reply-form');

    replyLinks.forEach((replyLink, index) => {
 
        const replyForm = replyForms[index];

        replyLink.addEventListener('click', function () {
            if (replyForm.style.display === 'none' || replyForm.style.display === '') {
                replyForm.style.display = 'block';
            } else {
                replyForm.style.display = 'none';
            }
        });
    });
});