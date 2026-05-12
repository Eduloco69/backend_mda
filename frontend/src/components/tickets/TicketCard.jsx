export default function TicketCard({

  ticket

}) {

  return (

    <div className="ticket-card">

      <h3>

        {ticket.titulo}

      </h3>


      <p>

        {ticket.descripcion}

      </p>


      <small>

        #{ticket.id}

      </small>


      <div>

        {ticket.estado}

      </div>

    </div>
  )
}