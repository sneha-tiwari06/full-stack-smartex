// Partners.js (Frontend)

import React, { useState, useEffect } from "react";
import axios from "axios";
import moment from "moment";
import { Link, useLocation, useNavigate } from "react-router-dom";
import Swal from 'sweetalert2';

const Partners = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const existingData = location.state || {};
  const baseURL = 'http://localhost:3000/upload/';

  const [alt, setAlt] = useState(existingData.alt || "");
  const [files, setFiles] = useState([]);
  const [errors, setErrors] = useState({});
  const [existingImageUrls, setExistingImageUrls] = useState(existingData.image_urls || []);
  const [previewURLs, setPreviewURLs] = useState([]);
  const [isEditMode, setIsEditMode] = useState(!!existingData.id);
  const [posts, setPosts] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const res = await axios.get(`/partners`);
        setPosts(res.data);
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);

  useEffect(() => {
    if (existingData.image_urls) {
      const urls = existingData.image_urls.map(url => `${baseURL}${url}`);
      setExistingImageUrls(urls);
    }
  }, [existingData]);

  const sanitizeFileName = (fileName) => fileName.replace(/[^a-zA-Z0-9._-]/g, '_');

  const upload = async () => {
    try {
      const formData = new FormData();
      const sanitizedFiles = files.map(file => {
        const sanitizedName = sanitizeFileName(file.name);
        return new File([file], sanitizedName, { type: file.type });
      });
      sanitizedFiles.forEach(file => formData.append("files", file));
      const res = await axios.post("/multiupload", formData);
      return res.data.fileUrls;
    } catch (err) {
      console.log(err);
    }
  };

  const handleClick = async (e) => {
    e.preventDefault();
  
    const errors = {};
    if (!alt.trim()) errors.alt = "Please enter an Alternate text.";
    if (!files.length && !existingImageUrls.length) errors.files = "Please select at least one image.";
    setErrors(errors);
  
    if (Object.keys(errors).length === 0) {
      let image_urls = existingImageUrls;
      if (files.length) {
        const newImageUrls = await upload();
        image_urls = [...image_urls, ...newImageUrls];
      }
  
      const payload = {
        alt,
        image_urls,
        date_speaker: moment(Date.now()).format("YYYY-MM-DD HH:mm:ss"),
      };
  
      try {
        if (isEditMode) {
          await axios.put(`/partners/${existingData.id}`, payload);
          console.log("Partner updated successfully!");
        } else {
          await axios.post(`/partners`, payload);
          console.log("Partners added successfully!");
         
          window.location.reload();
        }
      } catch (err) {
        console.log(err);
      }
    }
  };
  
  const handleFileChange = (e) => {
    const selectedFiles = Array.from(e.target.files);
    if (!selectedFiles.length) return;

    const sanitizedFiles = selectedFiles.map(file => {
      const sanitizedName = sanitizeFileName(file.name);
      return new File([file], sanitizedName, { type: file.type });
    });
    setFiles(sanitizedFiles);

    const newPreviewURLs = selectedFiles.map(file => URL.createObjectURL(file));
    setPreviewURLs(newPreviewURLs);
  };

  const handleDelete = async (post) => {
    try {
      await axios.delete(`/partners/${post.id}`);
      setPosts(posts.filter(p => p.id !== post.id));
      await handleDeleteConfirmation(post.image_url);
    } catch (err) {
      console.log(err);
    }
  };
  const handleToggleStatus = async (post) => {
    try {
      const updatedPost = { ...post, active: !post.active };
      await axios.put(`/partners/${post.id}`, { active: updatedPost.active });
      setPosts(posts.map(p => (p.id === post.id ? updatedPost : p)));
    } catch (err) {
      console.error('Error toggling status', err);
    }
  };
  const handleDeleteConfirmation = async (post) => {
    try {
      await Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      }).then(async (result) => {
        if (result.isConfirmed) {
          await axios.delete(`/partners/${post.id}`);
          setPosts(posts.filter(p => p.id !== post.id));
          await axios.delete(`/delete/${post.image_url}`);
          Swal.fire(
            'Deleted!',
            'Your file has been deleted.',
            'success'
          );
        }
      });
    } catch (error) {
      console.error('Error deleting file', error);
    }
  };
  
  
  return (
    <div className="add">
      <div className="content">
        <input
          type="text"
          name="alt"
          placeholder="Add Alternate Text"
          value={alt}
          onChange={(e) => setAlt(e.target.value)}
        />
        {errors.alt && <span className="error">{errors.alt}</span>}
      </div>
      <div className="item">
        <input
          type="file"
          id="file"
          name="image_url"
          onChange={handleFileChange}
          multiple
        />
        {errors.files && <span className="error">{errors.files}</span>}
        
        {/* Display existing image previews */}
        {isEditMode && existingImageUrls.length > 0 && (
          <div className="existing-images">
            <h3>Existing Images:</h3>
            <div className="image-preview">
              {existingImageUrls.map((url, index) => (
                <img 
                  key={index}
                  src={url} 
                  alt={`Existing image ${index + 1}`} 
                  style={{ height: "50px", width: "50px", margin: "5px" }}
                />
              ))}
            </div>
          </div>
        )}

        {/* Display new image previews */}
        {previewURLs.length > 0 && (
          <div className="new-images">
            <h3>New Images:</h3>
            <div className="image-preview">
              {previewURLs.map((url, index) => (
                <img 
                  key={index}
                  src={url} 
                  alt={`New image ${index + 1}`} 
                  style={{ height: "50px", width: "50px", margin: "5px" }}
                />
              ))}
            </div>
          </div>
        )}

        <div className="buttons">
          <button onClick={handleClick}>
            {isEditMode ? "Update" : "Publish"}
          </button>
        </div>
      </div>

      <div className="UpcomingHome">
        <h1 style={{ justifyContent: "center", textAlign: "center" }}>Partners</h1>
        <span className="write">
          <Link className="link" to="/add-partners">
            <button className="button">Add Partners</button>
          </Link>
        </span>

        <div className="posts">
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {posts.map((post, index) => (
                <tr key={index}>
                  <td>
                    <Link className="link" to={`/post/${post.id}`}>
                      {index + 1}
                    </Link>
                  </td>
                  <td>
                    <img className="img2" src={`../upload/${post.image_url}`} alt="" />
                  </td>
                  <td className="actions">
                  <button
                    className="read-more"
                    style={{ fontSize: "1rem" }}
                    onClick={() => handleToggleStatus(post)}
                  >
                    {post.active ? 'Inactive' : 'Active'}
                  </button>
                    <button className="read-more" onClick={() => handleDeleteConfirmation(post)} style={{ fontSize: "1rem"}}>Delete</button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Partners;

