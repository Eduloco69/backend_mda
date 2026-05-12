import useAuth from "../../hooks/useAuth"

import "../../styles/Dashboard.css"


export default function Topbar({ email }) {

  const { logout } =
    useAuth()


  return (

    <header className="topbar">

      <h2>

        Sistema MDA

      </h2>


      <div className="user-box">

        🔔

        👤

        {email}


        <button
          className="logout-btn"
          onClick={logout}
        >

          Salir

        </button>

      </div>

    </header>
  )
}