import DashboardLayout from
  "./components/layout/DashboardLayout"

import Login from
  "./pages/Login"

import useAuth from
  "./hooks/useAuth"


export default function App() {

  const {

    user,

    loading

  } = useAuth()


  if (loading) {

    return <p>Cargando...</p>
  }


  if (!user) {

    return <Login />
  }


  return <DashboardLayout />
}