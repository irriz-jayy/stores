import { useState, useEffect } from "react";
import "../App.css";

const ProductCard = ({ setCartItems }) => {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    fetch("/products")
      .then((response) => response.json())
      .then((products) => setProducts(products))
      .catch((error) => console.error(error));
  }, []);

  function handleAddToCart(product) {
    setCartItems((prevCartItems) => [...prevCartItems, product]);
    window.alert(`${product.name} has been added to your cart.`);
  }

  return (
    <>
      <div className="products-header">
        <p>Buy products</p>
      </div>
      <div className="product-container">
        {products.map((product) => (
          <div className="product-card" key={product.id}>
            <img
              src={product.image_url}
              alt="vegetables "
              className="product-image"
            />
            <div className="product-name">
              <p className=""> {product.name} </p>
            </div>
            <div className="product-name">
              <p className=""> {product.price} </p>
            </div>
            <div className="product-button">
              <button
                className="rounded m-2 p-2 bg-slate-200 hover:bg-slate-400 "
                onClick={() => handleAddToCart(product)}
              >
                Add to cart
              </button>
            </div>
          </div>
        ))}
      </div>
    </>
  );
};

export default ProductCard;
