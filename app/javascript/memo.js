function memo() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/chats/#{chat.id}", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.chat;
      const list = document.getElementById("list");
      const formText = document.getElementById("message");
      const HTML = `
        <div class="chat" data-id=${item.id}>
          <div class="chat-date">
            投稿日時：${item.created_at}
          </div>
          <div class="chat-message">
          ${item.message}
          </div>
        </div>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}
//setInterval(check, 1000);
window.addEventListener("load", memo);