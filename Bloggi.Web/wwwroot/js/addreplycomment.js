document.addEventListener('DOMContentLoaded', function () {
    document.addEventListener('submit', async function (event) {
        if (event.target.matches('.reply-form')) {
            event.preventDefault();

            const form = event.target;
            const IdPost = form.querySelector("#idPost").value;
            const IdComment = form.querySelector("#idComment").value;
            const ReplayComment = form.querySelector("#ReplyDescription").value;

            try {
                const response = await fetch('/api/Comment/reply', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': '*/*'
                    },
                    body: JSON.stringify({
                        Description: ReplayComment,
                        BlogPostId: IdPost,
                        CommentId: IdComment,
                    })
                });

                if (response.ok) {
                    form.querySelector("#ReplyDescription").value = "";
                } else {
                    console.log('Error:', response.status, response.statusText);
                    alert('Error: ' + response.status + ' - ' + response.statusText);
                }
            } catch (error) {
                console.error('Error:', error);
                alert('An error occurred while adding the comment.');
            }
        }
    });
});