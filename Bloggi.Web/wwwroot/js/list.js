const connection = new signalR.HubConnectionBuilder()
    .withUrl("/tagHub")
    .build();

connection.on("ReceiveTag", function (tag) {
    let tableBody = document.querySelector("table tbody");


    const row = document.createElement("tr");
    row.innerHTML = `<td>${tag.id}</td><td>${tag.name}</td><td>${tag.displayName}</td><td><a href="/AdminTags/Edit/${tag.id}">Edit</a></td>`;
    tableBody.appendChild(row);
});

connection.start().catch(function (err) {
    return console.error(err.toString());
});

