document.addEventListener("turbo:load", () => {
  const forms = document.querySelectorAll("form[data-validate]");

  forms.forEach((form) => {
    const type = form.dataset.validate;

    form.addEventListener("submit", async (event) => {
        event.preventDefault();
      let isValid = true;
      form.querySelectorAll(".error-message").forEach((div) => (div.textContent = ""));

      if (type === "login") {
        const email = form.querySelector(".email-field");
        const password = form.querySelector(".password-field");
        //EMAIL PART
        if (!email || !email.value.trim()) { //check that email is present
          isValid = false;
          email?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='email']");
          if (errorDiv) errorDiv.textContent = "Email is required.";
        } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)){
          isValid = false;
          email?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='email']");
          if (errorDiv) errorDiv.textContent = "Email is not in valid format";
        }else {   //see if email is present in in db
            try {
        const response = await fetch(`/check_email?email=${encodeURIComponent(email.value.trim())}`);
        const data = await response.json();

        if (!data.exists) {  //is the email in the field?
          isValid = false;
          email.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='email']");
          if (errorDiv) errorDiv.textContent = "Email not found in our records.";
        } else {
          email.classList.remove("field-error");
        }
      } catch (err) {
        console.error("Error checking email", err);
        //fetch request fails
        }
      }
        //PASSWORD PART
        if (!password || !password.value.trim()) {//check that password is present
          isValid = false;
         password?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='password']");
          if (errorDiv) errorDiv.textContent = "Password is required.";
        } else if(password.value.trim().length<8) {
          isValid=false;
           password?.classList.add("field-error");
           const errorDiv = form.querySelector("[data-error-for='password']");
          if (errorDiv) errorDiv.textContent = "Password must be at least 8 charcters.";
          }else {
          password.classList.remove("field-error");
        }
      ///////////////////////////////////////////////////////////////////
      }else if (type==="signup"){  //Signup sheet validation
        const name = form.querySelector(".name-field")
        const email = form.querySelector(".email-field");
        const password = form.querySelector(".password-field");
        const password_confirmation= form.querySelector(".password-confirmation-field")
        ////////////////////////////////////////////////////////////
        if(!name || !name.value.trim()){ //name checks
          isValid = false;
         name?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='name']");
          if (errorDiv) errorDiv.textContent = "Name is required.";
        }else if (name.value.includes(' ')){
          isValid = false;
         name?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='name']");
          if (errorDiv) errorDiv.textContent = "Name no spaces allowed.";
        }else {
          name.classList.remove("field-error");
        }
        ///////////////////////////////////////////////////////////
        if(!email || !email.value.trim()) { //check that email is present
          isValid = false;
          email?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='email']");
          if (errorDiv) errorDiv.textContent = "Email is required.";
        } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)){
          isValid = false;
          email?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='email']");
          if (errorDiv) errorDiv.textContent = "Email is not in valid format";
        }else {   //see if email is present in in db
            try {
        const response = await fetch(`/check_email?email=${encodeURIComponent(email.value.trim())}`);
        const data = await response.json();

        if (data.exists) {  //is the email in the field?
          isValid = false;
          email.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='email']");
          if (errorDiv) errorDiv.textContent = "Email is already in our records.";
        } else {
          email.classList.remove("field-error");
        }
      } catch (err) {
        console.error("Error checking email", err);
        //fetch request fails
        }
      }
      ////////////////////////////////////////////////////////////////////////////
      if (!password || !password.value.trim()) {//check that password is present
          isValid = false;
         password?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='password']");
          if (errorDiv) errorDiv.textContent = "Password is required.";
        } else if(password.value.trim().length<8) {
          isValid=false;
           password?.classList.add("field-error");
           const errorDiv = form.querySelector("[data-error-for='password']");
          if (errorDiv) errorDiv.textContent = "Password must be at least 8 charcters.";
          }else {
          password.classList.remove("field-error");
        }
        /////////////////////////////////////////////////////////////////////////////
        if (password_confirmation.value !== password.value) {//check that password is present
          isValid = false;
         password_confirmation?.classList.add("field-error");
          const errorDiv = form.querySelector("[data-error-for='password_confirmation']");
          if (errorDiv) errorDiv.textContent = "Must match password.";
        }else {
          password_confirmation.classList.remove("field-error");
        }
        ////////////////////////////////////////////////////////////////
      } else if (type ==="subject"){
        const title = form.querySelector(".title-field");
        if(!title || !title.value.trim()){
          isValid=false;
          title?.classList.add("field-error");
          const errorDiv= form.querySelector("[data-error-for='title']");
          if(errorDiv) errorDiv.textContent= "Subject must have a name";
        }else{
          title.classList.remove("field-error");
        }
        //////////////////////////////////////////////////////////
      }else if(type==="note"){
        const title = form.querySelector(".title-field");
        const text = form.querySelector(".text-field");
        if(!title || !title.value.trim()){
          isValid=false;
          title?.classList.add("field-error");
          const errorDiv= form.querySelector("[data-error-for='title']");
          if(errorDiv) errorDiv.textContent= "Note must have a name";
        }else{
          title.classList.remove("field-error");
        }
         if(!text || !text.value.trim()){
          isValid=false;
          text?.classList.add("field-error");
          const errorDiv= form.querySelector("[data-error-for='text']");
          if(errorDiv) errorDiv.textContent= "Note text must not be blank";
        }else{
          text.classList.remove("field-error");
        }
      }

      if (isValid) {
        form.submit();
      }
    });
  });
});
