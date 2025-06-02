document.addEventListener("turbo:load", () => {
  const forms = document.querySelectorAll("form[data-validate]");

  forms.forEach((form) => {
    const type = form.dataset.validate;

    form.addEventListener("submit", async (event) => {
        event.preventDefault();
      let isValid = true;
      form.querySelectorAll(".error-message").forEach((div) => (div.textContent = ""));

      if (type === "login") {
        const email = form.querySelector("input[name='email']");
        const password = form.querySelector("input[name='password']");

        if (!email || !email.value.trim()) { //check that email is present
          isValid = false;
          email?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='email']");
          if (errorDiv) errorDiv.textContent = "Email is required.";
        } else {
            try {
        const response = await fetch(`/check_email?email=${encodeURIComponent(email.value.trim())}`);
        const data = await response.json();

        if (!data.exists) {  // Or `data.exists === false`
          isValid = false;
          email.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='email']");
          if (errorDiv) errorDiv.textContent = "Email not found in our records.";
        } else {
          email.classList.remove("field-error");
        }
      } catch (err) {
        console.error("Error checking email", err);
        // Optionally show a generic error
        }
    }

        if (!password || !password.value.trim()) {//check that password is present
          isValid = false;
         password?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='password']");
          if (errorDiv) errorDiv.textContent = "Password is required.";
        } else {
          password.classList.remove("field-error");
        }
      }

      if (isValid) {
        form.submit();
      }
    });
  });
});
