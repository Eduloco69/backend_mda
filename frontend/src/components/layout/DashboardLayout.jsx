import {Routes,Route,Navigate} from "react-router-dom"

import Sidebar from "./Sidebar"

import Topbar from "./Topbar"


import Dashboard from
  "../../pages/Dashboard"

import Tickets from
  "../../pages/Tickets"


import useAuth from
  "../../hooks/useAuth"


import "../../styles/Dashboard.css"


export default function DashboardLayout() {

  const { user } =
    useAuth()


  return (

    <div className="dashboard-container">

      <Sidebar />


      <div className="dashboard-main">

        <Topbar
          email={user.email}
        />


        <main
          className="dashboard-content"
        >

          <Routes>

            <Route

              path="/"

              element={
                <Navigate
                  to="/dashboard"
                />
              }
            />


            <Route

              path="/dashboard"

              element={
                <Dashboard />
              }
            />


            <Route

              path="/tickets"

              element={
                <Tickets />
              }
            />

          </Routes>

        </main>

      </div>

    </div>
  )
}