const connection = new signalR.HubConnectionBuilder()
    .withUrl("/commenthub")
    .build();

connection.on("ReceiveNewComment", function (comment) {

    const commentContainer = document.querySelector(".card-body");

    const commentCard = document.createElement("div");

    commentCard.classList.add("card", "mb-3");

  

    commentCard.innerHTML = `
        <div class="card-body">
            <div>${comment.description}</div>
            <div class="d-flex justify-content-between">
                <span class="text-secondary">${comment.username}</span>
                <span class="text-secondary">${new Date(comment.dateAdded).toLocaleDateString()}</span>
            </div>
            <a class="submit" style="margin-left: 20px;margin-right: 20px;padding-left: 10px; margin-top: 10px; cursor: pointer;">reply</a>
            <div class="reply-form-container" style="display: none;">
                <form class="reply-form">
                    <div class="mb-3">
                        <input type="hidden" id="idPost" value="@Model.Id" />
                        <input type="hidden" id="idComment" value="${comment.id}" />
                        <input type="text" class="form-control" id="ReplyDescription" required />
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-dark">Submit Reply</button>
                    </div>
                </form>
            </div>
        </div>
    `;

    commentContainer.appendChild(commentCard);
});
connection.start().catch(function (err) {
    console.error(err.toString());
});




