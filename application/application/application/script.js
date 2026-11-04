const statusButton = document.getElementById("status-button");

const statusMessage = document.getElementById("status-message");
 
if (statusButton && statusMessage) {

  statusButton.addEventListener("click", () => {

    statusMessage.textContent =

      "The sample website is running. AWS deployment and infrastructure checks must be performed separately.";

  });

}
 
