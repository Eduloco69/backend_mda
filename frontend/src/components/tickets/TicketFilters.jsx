export default function TicketFilters({

  filters,

  setFilters,

  onSearch

}) {


  function handleChange(event) {

    setFilters({

      ...filters,

      [event.target.name]:
        event.target.value
    })
  }


  return (

    <div className="ticket-filters">

      <input
        name="nroTicket"
        placeholder="N° ticket"
        onChange={handleChange}
      />


      <input
        name="estado"
        placeholder="Estado"
        onChange={handleChange}
      />


      <input
        name="categoria"
        placeholder="Categoría"
        onChange={handleChange}
      />


      <input
        type="date"
        name="fechaDesde"
        onChange={handleChange}
      />


      <input
        type="date"
        name="fechaHasta"
        onChange={handleChange}
      />
      <button
        onClick={onSearch}
      >
        Buscar
      </button>

    </div>
  )
}