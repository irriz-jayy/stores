import "../App.css";

const lists = [
  {
    id: 1,
    image: "https://bit.ly/40pJNax",
    name: "Fresh vegetables",
  },
  { id: 2, image: "https://bit.ly/3KhLfWJ", name: "Fresh fruit" },
  { id: 3, image: "https://bit.ly/3G19qpK", name: "Fresh meat" },
];

const Categories = () => {
  return (
    <>
      <div className="categories-header">
        <p>Our categories</p>
      </div>
      <div className="categories-container" >
        {lists.map((item)=>(
            <div className="category-card">
            <img
              src={item.image}
              alt="vegetables "
              className="category-image"
            />
            <div className="category-name">
              <p className=""> {item.name} </p>
            </div>
          </div>
        ))}
      </div>
    </>
  );
};

export default Categories;
