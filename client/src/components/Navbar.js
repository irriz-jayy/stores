import { NavLink, Link } from "react-router-dom";

function Navbar({ currentUser }) {
  return (
    <div className="nav-container">
      <div className="nav-item">
        <ul>
          <li>
            <a href="./home.html">
              <img
                className="h-12 rounded-full"
                src="https://shutr.bz/3nedtsa"
                alt="Logo"
              />
            </a>
          </li>
        </ul>
      </div>

      <div className="nav-item">
        <input
          className="rounded-full p-4"
          type="text"
          placeholder="Search for products..."
        />
      </div>
      <div className="nav-item">
        <ul>
          <li>
            <NavLink className="text-lg" activeClassName="active" to="/">
              Delivery area
            </NavLink>
          </li>
        </ul>
      </div>
      <div className="nav-item">
        <ul>
          <li>
            {currentUser ? (
              <button className="btn">Logout</button>
            ) : (
              <NavLink
                className="text-red-600 text-lg"
                activeClassName="active"
                to="/login"
              >
                <Link to="/login" className="btn">
                  Login/Register
                </Link>
              </NavLink>
            )}
          </li>
        </ul>
      </div>
      <div className="nav-item">
        <ul>
          <li>
            <NavLink className="text-lg" activeClassName="active" to="/cart">
              Cart
            </NavLink>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default Navbar;
