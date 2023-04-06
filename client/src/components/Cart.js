const Cart = ({ cartItems, setCartItems }) => {
  const handleRemoveFromCart = (item) => {
    const newCartItems = cartItems.filter(
      (cartItem) => cartItem.id !== item.id
    );
    setCartItems(newCartItems);
  };

  return (
    <div className="cart">
      <h2>Your Cart</h2>
      {cartItems.length === 0 ? (
        <p>Your cart is empty.</p>
      ) : (
        <ul>
          {cartItems.map((item) => (
            <li key={item.id}>
              <img
                src={item.image_url}
                alt={item.name}
                className="cart-image"
              />
              <div className="cart-name">{item.name}</div>
              <div className="cart-price">{item.price}</div>
              <button onClick={() => handleRemoveFromCart(item)}>
                Remove from cart
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

export default Cart;
