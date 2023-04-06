import React, { useState } from "react";
import { toast } from "react-toastify";

const SignUp = ({ navigate }) => {
  const [signupFormData, setSignupFormData] = useState({
    name: "",
    email: "",
    shipping_address: "",
    password: "",
  });
  const [errors, setErrors] = useState({});
  // function to handle new registrations of applicants
  // function to post applicants to database
  function handleSignupChange(e) {
    const name = e.target.name;
    const value = e.target.value;
    setSignupFormData({
      ...signupFormData,
      [name]: value,
    });
  }

  function handleSignup(e) {
    e.preventDefault();

    //Post new users

    fetch("/users", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify(signupFormData),
    }).then((res) => {
      if (res.status === 422) {
        res.json().then((data) => {
          setErrors(data.errors);
        });
      } else {
        res.json().then((data) => {
          console.log(signupFormData);
          //Display succesfull response
          toast.success("Succesfully Registered");
          //navigates to login page
          //will redirect to login page
          navigate("/login");
        });
      }
    });

    e.target.reset();
  }
  console.log(errors);
  return (
    <>
      <div className="bg-yellow-400 flex min-h-[100vh] items-center justify-center py-12 px-4 sm:px-6 lg:px-8 ">
        <div className="w-full max-w-md space-y-8">
          <div>
            <img
              className="mx-auto h-12 w-auto"
              src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600"
              alt="Your Company"
            />
            <h2 className="mt-6 text-center text-3xl font-bold tracking-tight text-gray-900">
              Sign up for an account
            </h2>
          </div>
          <form className="mt-8 space-y-6" onSubmit={handleSignup}>
            <div>
              <label htmlFor="email-address" className="sr-only">
                Email address
              </label>
              <input
                id="email-address"
                name="email"
                type="email"
                autoComplete="email"
                required
                className="relative block w-full rounded-t-md border-0 py-1.5 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:z-10 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                placeholder="Email address"
                value={signupFormData.email}
                onChange={handleSignupChange}
              />
            </div>
            <div>
              <label htmlFor="email-address" className="sr-only">
                Name
              </label>
              <input
                id="email-address"
                name="name"
                type="text"
                required
                className="relative block w-full rounded-t-md border-0 py-1.5 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:z-10 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                placeholder="Name"
                value={signupFormData.name}
                onChange={handleSignupChange}
              />
            </div>
            <div>
              <label htmlFor="email-address" className="sr-only">
                Shipping address
              </label>
              <input
                id="email-address"
                name="shipping_address"
                type="text"
                required
                className="relative block w-full rounded-t-md border-0 py-1.5 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:z-10 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                placeholder="Preffered shipping address"
                value={signupFormData.shipping_address}
                onChange={handleSignupChange}
              />
            </div>
            <div>
              <label htmlFor="password" className="sr-only">
                Password
              </label>
              <input
                id="password"
                name="password"
                type="password"
                autoComplete="current-password"
                required
                className="relative block w-full rounded-b-md border-0 py-1.5 text-gray-900 ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:z-10 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                placeholder="Password"
                value={signupFormData.password}
                onChange={handleSignupChange}
              />
            </div>
            <div>
              <button
                type="submit"
                className="group relative flex w-full justify-center rounded-md bg-indigo-600 py-2 px-3 text-sm font-semibold text-white hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
              >
                Sign up
              </button>
            </div>
          </form>
        </div>
      </div>{" "}
    </>
  );
};

export default SignUp;
