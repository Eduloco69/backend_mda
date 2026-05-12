import { useState } from "react"

import useAuth from "../hooks/useAuth"

import "../styles/login.css"

export default function Login() {

  const {
    login
  } = useAuth()


  const [email, setEmail] = useState("")

  const [password, setPassword] = useState("")

  const [error, setError] = useState("")

  const [loading, setLoading] = useState(false)


  async function handleSubmit(event) {

    event.preventDefault()

    setError("")

    setLoading(true)

    try {
      await login(
        email,
        password
      )

    } catch {
      setError(
        "Credenciales inválidas"
      )

    } finally {
      setLoading(false)
    }
  }


  return (

    <div className="login-page">
      <form
        className="login-form"
        onSubmit={handleSubmit}
      >
        <h1>
          Sistema MDA
        </h1>
        <input
          type="email"
          placeholder="Correo"
          value={email}
          onChange={(event) =>
            setEmail(
              event.target.value
            )
          }
        />
        <input
          type="password"
          placeholder="Contraseña"
          value={password}
          onChange={(event) =>
            setPassword(
              event.target.value
            )
          }
        />
        {error && (
          <p>
            {error}
          </p>
        )}
        <button
          type="submit"
          disabled={loading}
        >
          {
            loading
              ? "Ingresando..."
              : "Ingresar"
          }
        </button>
      </form>
    </div>
  )
}