import "./App.css";
import { Routes, Route, useNavigate } from "react-router-dom";
import { ToastContainer, toast } from "react-toastify";
import Login from "./components/Login";
import React, { useState, useEffect } from "react";
import Homepage from "./components/Homepage";
import SignUp from "./components/SignUp";
import Cart from "./components/Cart";

function App() {
  // Navigation
  const mainNavigate = useNavigate();

  // States
  const [currentUser, setCurrentUser] = useState({});

  // States for Cart Items
  const [cartItems, setCartItems] = useState([]);

  // Fetch Current User
  useEffect(() => {
    fetch("/me").then((res) => {
      if (res.ok) {
        res.json().then((data) => setCurrentUser(data));
      }
    });
  }, []);

  return (
    <div className="App">
      <Routes>
        <Route
          path="/login"
          element={
            <Login setCurrentUser={setCurrentUser} navigate={mainNavigate} />
          }
        />
        <Route
          path="/"
          element={
            <Homepage
              currentUserName={currentUser.name}
              setCartItems={setCartItems}
            />
          }
        />
        <Route path="sign-up" element={<SignUp navigate={mainNavigate} />} />
        <Route path="/cart" element={<Cart cartItems={cartItems} />} />
      </Routes>{" "}
    </div>
  );
}

export default App;
