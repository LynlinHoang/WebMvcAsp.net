(function () {
    const connection = new signalR.HubConnectionBuilder()
        .withUrl("/commenthub")
        .build();

    connection.on("ReceiveNewReplyComment", function (reply) {
        // In toàn bộ đối tượng reply ra để kiểm tra
        console.log("Received reply object:", reply);

        const commentContainer = document.querySelector(`.card[key="${reply.commentId}"] .reply-container`);

        const commentCard = document.createElement("div");


        commentCard.classList.add("card", "mb-3");

        // Tạo một div mới cho reply
        const replyDiv = document.createElement("div");
        replyDiv.classList.add("reply", "mb-3");
        replyDiv.style.marginLeft = "20px";
        replyDiv.style.marginRight = "20px";
        replyDiv.style.paddingLeft = "10px";
        replyDiv.style.marginTop = "10px";

        // Đặt nội dung cho reply
        replyDiv.innerHTML = `
            <div>${reply.description}</div>
            <div class="d-flex justify-content-between">
                <span class="text-secondary">${reply.username}</span>
                <span class="text-secondary">${new Date(reply.dateAdded).toLocaleDateString()}</span>
            </div>
        `;

        // Thêm reply vào container
        commentContainer.appendChild(replyDiv);

    });
    connection.start().catch(function (err) {
        console.error(err.toString());
    });
})();
