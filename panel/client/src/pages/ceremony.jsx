import React, { useEffect, useState } from "react";
import { Link, useLocation } from "react-router-dom";
import axios from "axios";
import "./home.css"; 

const CeremonyHome = () => {
  const [posts, setPosts] = useState([]);
  const [postToDelete, setPostToDelete] = useState(null); 
  const cat = useLocation().search;

  useEffect(() => {
    const fetchData = async () => {
      try {
        const res = await axios.get(`/ceremony`);
        setPosts(res.data);
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, [cat]);

  const getText = (html) => {
    const doc = new DOMParser().parseFromString(html, "text/html");
    return doc.body.textContent.slice(0, 30) +  "...";
  };


  const handleDeleteConfirmation = (post) => {
    setPostToDelete(post);
  };

  
  const handleDelete = async () => {
    try {
      await axios.delete(`/ceremony/${postToDelete.id}`);
      
      setPosts(posts.filter(post => post.id !== postToDelete.id));
      await handleFileDelete(postToDelete.image_url);
      setPostToDelete(null);
    } catch (err) {
      console.log(err);
    }
  };
  const handleFileDelete = async (filename) => {
    try {
      await axios.delete(`/delete/${filename}`);
    } catch (error) {
      console.error('Error deleting file', error);
    }
  };
  const handleToggleStatus = async (post) => {
    try {
      const updatedPost = { ...post, active: !post.active }; 

      await axios.put(`/ceremony/${post.id}`, { active: updatedPost.active });
      setPosts(posts.map(p => (p.id === post.id ? updatedPost : p)));
    } catch (err) {
      console.error('Error toggling status', err);
    }
  };
  return (
    <div className="StarHome">
      <h1 style={{justifyContent: "center", textAlign: "center"}}>Ceremony</h1>
      <span className="write">
        <Link className="link" to="/add-ceremony">
          <button className="button">Add Ceremony</button>
        </Link>
      </span>

      <div className="posts">
        <table>
          <thead>
            <tr>
              <th> ID </th>
              <th>Title</th>
              <th>Image</th>
              <th>Link</th>
              <th> Created At</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {posts.map((post, index) => (
              <tr key={index}>
                <td>
                  <Link className="link" to={`/post/${post.id}`}>
                    {index+1}
                  </Link>
                </td>
                <td>
                  <Link className="link" to={`/post/${post.id}`}>
                    {post.ceremony_name}
                  </Link>
                </td>
                <td>
                  <img className="img2" src={`../upload/${post.image_url}`} alt="" />
                  
                </td>
                <td>{getText(post.ceremony_link)}</td>
                <td>
                  <Link className="link" to={`/post/${post.id}`}>
                    {post.created_at.slice(0, 10)}
                  </Link>
                </td>
                <td className="actions">
                  {/* <Link className="read-more" to={`/post/${post.id}`}>
                    View
                  </Link> */}
                
                  <Link className="read-more" to={`/add-ceremony?edit=2`} state={post}>
                    Edit
                  </Link>
                  <div className="delete-wrapper">
                  <button className="read-more" style={{ fontSize: "1rem" }} onClick={() => handleDeleteConfirmation(post)}>Delete</button>
                    {postToDelete && postToDelete.id === post.id && (
                      <div className="confirmation-popup">
                        <p>Are you sure you want to delete this post?</p>
                        <div>
                          <button onClick={handleDelete}>Yes</button>
                          <button onClick={() => setPostToDelete(null)}>No</button>
                        </div>
                      </div>
                    )}
                  </div>
                  <button className="read-more" style={{ fontSize: "1rem" }} onClick={() => handleToggleStatus(post)}>
                    {post.active ? 'Inactive' : 'Active'}
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default CeremonyHome;