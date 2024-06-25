import {
  createBrowserRouter,
  RouterProvider,
  Route,
  Outlet,
} from "react-router-dom";
import Register from "./pages/Register";
import Login from "./pages/Login";
import Write from "./pages/add-blogs";
import Home from "./pages/blogs";
// import Dashboard from "./components/Dashboard";
import Single from "./pages/Single";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import "./style.scss"
import StarSpeaks from "./pages/star-speakers";
import StarHome from "./pages/add-star-speakers";
import Winners from "./pages/winners-gallery";
import WinnersHome from "./pages/add-winners-gallery";
import Ceremony from "./pages/ceremony";
import CeremonyHome from "./pages/add-ceremony";                  
import Events from "./pages/events";
import EventHome from "./pages/add-events";
import Upcoming from "./pages/upcoming-events";
import UpcomingHome from "./pages/add-upcoming-events";
import Partners from "./pages/our-partners";
import PartnersHome from "./pages/add-partners";

const Layout = () => {
  return (
    <>
      <Navbar />
      <Outlet />
      <Footer />
    </>
  );
};

const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    children: [
      {
        path: "/",
        element: <Login />,
      },
      {
        path: "/post/:id",
        element: <Single />,
      },
      {
        path: "/blogs",
        element: <Home />
      },
      {
        path: "/add-blogs",
        element: <Write />,
      },
      {
        path: "/add-star-speakers",
        element: <StarHome />,
       
      },
      {
        path: "/star-speakers",
        element: <StarSpeaks />,
      },
      {
        path: "/add-winners-gallery",
        element: <WinnersHome />,
      },
      {
        path: "/winners-gallery",
        element: <Winners />,
      },
      {
        path: "/add-ceremony",
        element: < CeremonyHome/>,
      },
      {
        path: "/ceremony",
        element: <Ceremony />,
      },
      {
        path: "/add-events",
        element: <EventHome />,
      },
      {
        path: "/events",
        element: <Events />,
      },
      {
        path: "/add-upcoming-events",
        element: <UpcomingHome />,
       
      },
      {
        path: "/upcoming-events",
        element: <Upcoming />,
      },
      {
        path: "/our-partners",
        element: <Partners />,
       
      },
      {
        path: "/add-partners",
        element: <PartnersHome />,
      
      }
    ],
  },
  {
    path: "/register",
    element: <Register />,
  },
  {
    path: "/login",
    element: <Login />,
  },
]);

function App() {
  return (
    <div className="app">
      <div className="container">
        <RouterProvider router={router} />
      </div>
    </div>
  );
}

export default App;
