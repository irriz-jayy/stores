import { FaInstagram, FaTwitter, FaWhatsapp } from "react-icons/fa";

const Footer = () => {
  return (
    <>
      <div className="footer">
        <div className="links">
          <div className="link-item">
            <FaInstagram />
          </div>
          <div className="link-item">
            <FaTwitter />
          </div>
          <div className="link-item">
            <FaWhatsapp />
          </div>
        </div>
        <div className="text-lg">Copyright 2023</div>
      </div>
    </>
  );
};

export default Footer;
