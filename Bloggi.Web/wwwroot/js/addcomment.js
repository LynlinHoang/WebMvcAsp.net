var submitElement = document.getElementById("commentForm");

submitElement.addEventListener('submit', async function (event) {
    event.preventDefault();

    const Description = document.getElementById("Description").value;
    const Id = document.getElementById("id").value;

    console.log(Description);
    console.log(Id);

    try {
        const response = await fetch('/api/Comment/Add', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': '*/*'
            },
            body: JSON.stringify({
                Description: Description,
                BlogPostId: Id,
            })
        });

        if (response.ok) {

            document.getElementById("Description").value = "";
        } else {
            console.log('Error:', response.status, response.statusText);
            alert('Error: ' + response.status + ' - ' + response.statusText);
            return;
        }
    } catch (error) {
        console.error('Error:', error);
        alert('An error occurred while adding the comment.');
    }
});
