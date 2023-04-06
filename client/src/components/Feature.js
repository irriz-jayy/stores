import "../App.css";

const list=[
  {image:"https://bit.ly/3lOPLCA",header:"Fresh and organic",description:"Lorem ipsum dolor sit, amet consectetur adipisicing elit.Ducimusaccusantium qui laudantium deserunt debitis dolorem"},
  {image:"https://bit.ly/3ZvDAZc",header:"Quick deliveries",description: "Lorem ipsum dolor sit, amet consectetur adipisicing elit.Ducimus accusantium qui laudantium deserunt debitis dolorem"},
  {image:"https://bit.ly/3TQVdBF",header:"Easy payments",description:    "Lorem ipsum dolor sit, amet consectetur adipisicing elit.Ducimus accusantium qui laudantium deserunt debitis dolorem"}
]

function Feature() {
  return (
    <>
      <div className="feature-header">
        <p>Our features</p>
      </div>
      <div className="feature-container">
        {list.map((item)=>(
          <div className=" feature-card">
          <img
            src={item.image}
            alt="feature"
            className="h-1/2"
          />
          <h2 className="text-center font-black ">{item.header}</h2>
          <p className="text-center ">
            {item.description}
          </p>
          <div className="feature-button">
            <button className="rounded m-2 p-2 bg-slate-200 hover:bg-slate-400">
              Read more
            </button>
          </div>
        </div>
        ))}
      </div>
    </>
  );
}

export default Feature;
