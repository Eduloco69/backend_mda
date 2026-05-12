import { useEffect, useState } from "react"

import api from "../services/api"

import "../styles/Tickets.css"


export default function Tickets() {

  const [tickets, setTickets] = useState([])

  const [loading, setLoading] = useState(true)

  const [pagina, setPagina] = useState(1)

  const [totalPaginas, setTotalPaginas] = useState(1)


  const [filters, setFilters] = useState({

    estado: "",

    asignado: "",

    categoria: "",

    subcategoria: "",

    prioridad: "",

    nroTicket: "",

    fechaDesde: "",

    fechaHasta: ""
  })


  async function fetchTickets() {

    try {

      setLoading(true)

      console.log("Consultando tickets...")


      const response = await api.get(
        "/ticket",
        {
          params: {
            ...filters,
            pagina
          }
        }
      )


      console.log(
        "Respuesta API:",
        response.data
      )


      setTickets(
        response.data.tickets || []
      )


      setTotalPaginas(
        response.data.total_paginas || 1
      )


    } catch (error) {

      console.error(
        "Error cargando tickets:",
        error
      )

    } finally {

      setLoading(false)
    }
  }


  useEffect(() => {

    fetchTickets()

  }, [pagina])


  function handleChange(e) {

    setFilters({

      ...filters,

      [e.target.name]: e.target.value
    })
  }


  function handleSearch() {

    setPagina(1)

    fetchTickets()
  }


  function formatDate(date) {

    return new Date(date)
      .toLocaleDateString("es-CL")
  }


  function getVisiblePages() {

    const group = Math.floor(
      (pagina - 1) / 10
    )


    const start = (group * 10) + 1

    const end = Math.min(
      start + 9,
      totalPaginas
    )


    return Array.from(

      {
        length: end - start + 1
      },

      (_, i) => start + i
    )
  }


  if (loading) {

    return (
      <h2>
        Cargando tickets...
      </h2>
    )
  }


  return (

    <div className="tickets-page">


      <h1>
        Tickets
      </h1>


      {/* filtros */}

      <div className="ticket-filters">


        <input

          name="nroTicket"

          placeholder="Nro ticket"

          value={filters.nroTicket}

          onChange={handleChange}
        />


        <select

          name="estado"

          value={filters.estado}

          onChange={handleChange}
        >

          <option value="">
            Todos
          </option>

          <option value="Abierto">
            Abierto
          </option>

          <option value="Pendiente">
            Pendiente
          </option>

          <option value="En proceso">
            En proceso
          </option>

          <option value="Resuelto">
            Resuelto
          </option>

          <option value="Cerrado">
            Cerrado
          </option>

        </select>


        <button
          onClick={handleSearch}
        >
          Buscar
        </button>


      </div>



      {/* cards */}

      <div className="tickets-grid">


        {tickets.map(ticket => (

          <div

            key={ticket.ticketId}

            className="ticket-card"
          >


            <div className="ticket-header">


              <span className="ticket-category">

                {ticket.categoria}

              </span>


              <span

                className={
                  `priority ${ticket.prioridadTicket}`
                }
              >

                {ticket.prioridadTicket}

              </span>


            </div>



            <h3>

              {ticket.NroTicket}

            </h3>



            <p className="ticket-title">

              {ticket.tituloTicket}

            </p>



            <p className="ticket-user">

              {ticket.usuarioSolicitante}

            </p>



            <div className="ticket-footer">


              <span className="status">

                {ticket.estadoTicket}

              </span>


              <span>

                {
                  formatDate(
                    ticket.fechaCreacionTicket
                  )
                }

              </span>


            </div>


          </div>

        ))}


      </div>



      {/* paginación */}

      <div className="pagination">


        {pagina > 10 && (

          <button

            className="page-btn"

            onClick={() =>
              setPagina(
                pagina - 10
              )
            }
          >

            ←

          </button>

        )}



        {getVisiblePages()
          .map(num => (

            <button

              key={num}

              className={
                pagina === num
                  ? "page-btn active"
                  : "page-btn"
              }


              onClick={() =>
                setPagina(num)
              }
            >

              {num}

            </button>

        ))}



        {totalPaginas > 10 &&
         pagina <= totalPaginas - 10 && (

          <button

            className="page-btn"

            onClick={() =>
              setPagina(
                pagina + 10
              )
            }
          >

            →

          </button>

        )}


      </div>


    </div>
  )
}